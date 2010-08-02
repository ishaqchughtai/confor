<?php
/**
 * MUser Model Class
 *
 * @package		Confor
 * @subpackage	Models
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */

class MUser extends Model
{
	function MUser()
	{
		parent::Model();
		$this->load->database();
	}	
	
	function add($data) 
	{
		$this->db->insert('users', $data);
	}
	
	function save($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('users', $data);
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Get speaker's profile by ID
	 *
	 * @access	public
	 * @return	void
	 */		
	function get_by_id($id)
	{
		$this->db->select("users.*");
		$this->db->from('users');
		$this->db->where('users.id',$id);
		$this->db->limit(1);
		return $this->db->get();
		// $query = $this->db->get();
		// if ($query->num_rows()>0) {return $query->row();}
		// else {return 0;}		  		  
	}
	
	// --------------------------------------------------------------------
	
	function get_by_username($username) 
	{
		$this->db->select("users.*");
		$this->db->from('users');
		$this->db->where('username', $username);            
		$this->db->limit(1);
		return $this->db->get();
	}
			
	function get_payment_by_user_id($user_id) 
	{			
		$this->db->select("payments.*,
			rates.amount,
			rates.term,
			rates.term_c,
			rates.title as rate_title
		");
		$this->db->from('payments');
		$this->db->where('user_id', $user_id);
		$this->db->where('payments.status', 1); 
		$this->db->where('payments.date >', time());
		$this->db->join('rates','payments.rate_id=rates.id');
		$this->db->limit(1);
		$query = $this->db->get();		
		if ($query->num_rows()<1) 
		{
			return FALSE;
		}
		else 
		{
			return $query->row();			
		}		
	}	
	
	function membership_info($user_id)
	{
		//Current Membership: 
		//Current Membership Rate: 
		//Membership Expires:		
		$this->db->select("
			users.username,
			users.name,
			memberships.title,
			memberships.free,
			memberships.desc
		");
		$this->db->from('users');
		$this->db->where('users.id', $user_id); 
		$this->db->join('memberships','users.membership_id=memberships.id');
		$this->db->limit(1);
		$query = $this->db->get();						
		if ($query->num_rows()<1) 
		{
			return FALSE;
		}
		else 
		{
			return $query->row();			
		}			
	}
	
	function get_membership_rate()
	{
		
	}
	
	// --------------------------------------------------------------------
	
	function speaker_paging($num_per_page, $page_offset, $keyword) {	
		
		$this->db->select("
		users.id,
		users.username,
		users.name"); 
		$this->db->from('users');
		if (($keyword)&&(strlen($keyword)>0)) {
			$this->db->like("users.username", $keyword); 
		}
		$this->db->where("users.userlevel <>", "9"); 
		$this->db->order_by("users.username", "asc"); 
		$this->db->order_by("users.id", "asc"); 
		$this->db->limit($num_per_page, $page_offset);
		return $this->db->get();		
	}
	
	function is_email_exists($email)
	{		
		//$email = sanitize($email);
		$this->db->select("users.id");
		$this->db->from('users');
		$this->db->where('email', $email);            
		$this->db->limit(1);	
		$query = $this->db->get();
		if ($query->num_rows()>0) 
		{
			return true;
		}
		else 
		{
			return false;
		}								
	}
	
	function is_username_exists($username)
    {                
        $this->db->select("users.id");
        $this->db->from('users');
        $this->db->where('username', $username);            
        $this->db->limit(1);    
        $query = $this->db->get();
        if ($query->num_rows()>0) 
        {
            return true;
        }
        else 
        {
            return false;
        }                                
    }	
			
	function confirm_user_cookie_id($username, $cookie_id) 
	{				
		$this->db->select("id,username,email,name,cookie_id,language,userlevel,membership_id");
		$this->db->from('users');
		$this->db->where('username', xss_clean($username));            
		$this->db->limit(1);
		$query = $this->db->get();
		if ($query->num_rows()<1) 
		{
			return FALSE;
		}
		else 
		{
			$row = $query->row();
			$cookie_id = xss_clean($cookie_id);
			if ($cookie_id == $row->cookie_id)
			{
				return $row;
			}
			else
			{
				return FALSE;
			}			
		}			
	}
	
	// --------------------------------------------------------------------
	
	function get_user_for_login($username, $password) {
		$this->db->select("id,username,email,name,cookie_id,language,userlevel,membership_id");
		$this->db->from('users');
		$this->db->where('username', $username);		
		$this->db->where('password', $password);
		$this->db->where('status', 1);
		$this->db->limit(1);
		return $this->db->get();
	}
	
	// --------------------------------------------------------------------
	
	function confirm_user_pass($username, $password) {
		$this->db->select("users.password, users.token");
		$this->db->from('users');
		$this->db->where('username', $username);
		//$this->db->where('password', $password);
		$this->db->limit(1);	
		return $this->db->get();
		if ($query->num_rows()>0) 
		{
			$row = $query->row();
			if ($row->token != 0) return 3;			
			if ($row->password == $password) return 1;
			return 2;
		}
		else 
		{
			return 0;
		}			
	}		
	
	// --------------------------------------------------------------------
	
	// function update_user_field($username, $field, $value)
	// {
		// $this->db->where('username', $username);
		// $data[$field] = $value;
		// $this->db->update('users', $data);			
	// }		
	
	function update_user_for_login($username, $cookie_id) 
	{
		$data['last_access'] = time();
		$data['cookie_id'] = $cookie_id;
		$data['last_ip'] = $_SERVER['REMOTE_ADDR'];
		$this->db->where('username', $username);
		$this->db->update('users', $data);		
	}	
	
	function update_by_username($username, $data)
	{
		$this->db->where('username', $username);
		$this->db->update('users', $data);
	}		
	
	
	function get_function_id_by_url($url)
	{
		$query = $this->db->get_where('functions', array('url' => $url),1);
		if ($query->num_rows()>0)
		{
			$row = $query->row();
			return $row->id;
		}
		else return FALSE;		
	}
	
	function get_membership_by_function($function_id, $function_url=FALSE)
	{
		if ($function_url!=FALSE)
		{
			$function_id = $this->get_function_id_by_url($function_url);
			if ($function_id==FALSE) return FALSE;
		}
		
		$this->db->where('function_id',$function_id);
		$query = $this->db->get('membership_functions');
		$ret = array();
		if ($query->num_rows()>0)
		{
			foreach ($query->result() as $item)
			{
				$ret[] = $item->membership_id;
			}			
			return $ret;
		}
		else
		{
			return FALSE;
		}		
	}
	
	// --------------------------------------------------------------------

}

/* End of file muser.php */ 
/* Location: ./system/application/models/muser.php */ 

