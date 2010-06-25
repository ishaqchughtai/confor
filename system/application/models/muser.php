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
		$data['last_access'] = "NOW()";
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
	
	// --------------------------------------------------------------------

	function get_subcription_by_user($username)
	{
		
	}
	
	// --------------------------------------------------------------------

}

/* End of file muser.php */ 
/* Location: ./system/application/models/muser.php */ 
