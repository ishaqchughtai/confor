<?php

// ------------------------------------------------------------------------
/**
 * Remember_me Class
 *
 * @package		Confor
 * @subpackage	Models
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Remember_me extends Model {

	var  $table_name = 'tblremember_me';
	
	function Remember_me()
	{
		parent::Model();
		$this->CI =& get_instance();
		$this->CI->load->helper( array('cookie', 'date', 'security', 'string') );
		$this->load->database();
	}

	// ------------------------------------------------------------------------
	
	function add_remember_me($username)
	{
		// start by removing any current cookie before the re-issue
		$this->remove_remember_me();
		$random_string = random_string('alnum', 128);
		$remember_me_info = array(
			   'username' => $username,
			   'usernamehash' => dohash($username),
			   'random_string' => $random_string,
			   'origin_time' => now()
			);
		$this->db->insert($this->table_name, $remember_me_info);
		set_cookie("confor_userhash", dohash($username), $this->config->item('remember_me_life'));
		set_cookie("confor_randomstring", $random_string, $this->config->item('remember_me_life'));
	}

	// ------------------------------------------------------------------------
	
	function remove_remember_me($username = false)
	{
		if(!$username)
		{
			$this->db->where('usernamehash', $this->input->cookie('confor_userhash', TRUE));
			$this->db->where('random_string', $this->input->cookie('confor_randomstring', TRUE));
			/*
			 * it is possible, although incredibly unprobable that the same user will have persistent
			 * cookies on more then 1 machine with the same randomly generated hash, so this simply
			 * ensures that only 1 is taken out.  
			 */
			$this->db->limit(1); 
			
			set_cookie("confor_userhash");
			set_cookie("confor_randomstring");
		}
		// removes all entries for a given username (deleted user!)
		else $this->db->where('username', $username);
		$this->db->delete($this->table_name); 
	}

	// ------------------------------------------------------------------------
	
	function check_remember_me()
	{
		//input->cookie returns FALSE if item does not exist
		$userhash = $this->input->cookie('confor_userhash', TRUE);		
		$random_string = $this->input->cookie('confor_randomstring', TRUE);
		
		if (!empty($userhash) && !empty($random_string)) 
		{		
			log_message('debug','Has Remember Me Cookie');			
														
			$this->db->where ('usernamehash', $userhash);	
			$this->db->where ('random_string', $random_string);	
			$result = $this->db->get($this->table_name);
								
			if ($result != FALSE && $result->num_rows() > 0) 
			{			
				$result = $result->row();
				$expire_time = time() - $this->CI->config->item('remember_me_life');
				if ( $result->origin_time <=  $expire_time )
				{
					$this->remove_remember_me();
					return FALSE;
				}
				else
				{
					return $result->username;
				}				
			} 
			else 
			{ 
				return FALSE; 
			}						
		} 
		else 
		{ 
			return FALSE; 
		}	
	}
	
	// ------------------------------------------------------------------------
	
	function remove_all_expired() {
		// function for administrator to delete all expired records
		$expire_time = time() - $this->CI->config->item('remember_me_life');
		$this->db->where ('origin_time <=', $expire_time);
		$this->db->delete($this->table_name); 
	}
}

?>