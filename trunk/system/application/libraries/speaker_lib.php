<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Speaker_lib Class
 *
 * @package		Confor
 * @subpackage	Libraries
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Speaker_lib 
{ 	
	var $redirect_login = '/home/login';
	
	function Speaker_lib()
	{
		$this->CI =& get_instance();
		$this->CI->load->model('MSpeaker');
		$this->CI->load->model('Remember_me');
		$this->CI->load->helper('cookie');		
	}

	// --------------------------------------------------------------------
	
	/**
	 * Check if u r a speaker, if not SPEAKER it redirect to loginpage
	 *
	 * @access	public	 
	 * @return	mixed
	 */		
	function is_speaker($go_after_login=TRUE) 
	{
		if ($this->CI->session->userdata('speaker_id')) 
		{
			$fields = array('','','','');
			$speaker_data = array
			(
				'speaker_id' => $this->CI->session->userdata('speaker_id'),
				'speaker_email' => $this->CI->session->userdata('speaker_email'),
				'speaker_name' => $this->CI->session->userdata('speaker_name'),
				'lang' => $this->CI->session->userdata('lang'),			
				'speaker_subcription_name' => $this->CI->session->userdata('speaker_subcription_name'),
				'speaker_subscription_expiration' => $this->CI->session->userdata('speaker_subscription_expiration')
			);			
			return $speaker_data;
		} 
		else 
		{
			$email = $this->CI->Remember_me->check_remember_me();
			$is_using_cookie = $this->_is_using_cookie($email);
			if ($is_using_cookie) {return $is_using_cookie;}
		}		 	
		
		if ($go_after_login==TRUE)
		{
			redirect($this->redirect_login);
		}
		return FALSE;
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Return a json string for login action
	 *
	 * @access	public	 
	 * @return	string
	 */			
	function login_ajax() 
	{
		if ($this->CI->session->userdata('speaker_id'))
		{			
			$result['name'] = $this->CI->session->userdata('speaker_name');
			return $result;	
		} 
		else 
		{
			$email = $this->CI->Remember_me->check_remember_me();
			$is_using_cookie = $this->_is_using_cookie($email);
			if ($is_using_cookie) 
			{
				$result['name'] = $is_using_cookie['speaker_name'];
				return $result;
			}
		}
		
		$this->CI->load->library('form_validation');
		$this->CI->form_validation->set_rules('email', 'Email', $this->CI->config->item('spk_email_rule'));
		$this->CI->form_validation->set_rules('password', $this->CI->lang->line('CON_user_password_label'), $this->CI->config->item('spk_password_rule'));
						
		$data['email'] = $this->CI->input->post('email');
		$data['password'] = $this->CI->input->post('password');
		
		if($this->CI->form_validation->run()==FALSE) 
		{
			$result['error'] = $this->CI->lang->line('CON_invalid_validation_message');
			return $result;
		} 
		else 
		{
			$email = (isset($data['email']) ? $data['email'] : false);
			$password = (isset($data['password']) ? $data['password'] : false);	
			$is_cookie = $this->CI->input->post('is_cookie');
			
			if ($email && $password) 
			{
				$password = $this->_encode($password);
				$query = $this->CI->MSpeaker->get_speaker_for_login($email, $password);
				if ($query->num_rows() == 1) 
				{
					$row = $query->row();
					$speaker_data['speaker_id'] = $row->ID;
					$speaker_data['speaker_email'] = $row->Email;
					$speaker_data['speaker_name'] = $row->Name;
					$speaker_data['speaker_subcription_name'] = $row->TypeName;
					$speaker_data['speaker_subscription_expiration'] = $row->SubscriptionExpiration;	
					$speaker_data['lang'] = $row->Language;
					$this->_set_logindata($speaker_data, $is_cookie);
					$result['name'] = $row->Name;
					return $result;	
				} 
				else 
				{
					$result['error'] = $this->CI->lang->line('CON_invalid_username_password_message');					
					return $result;
				}
			}
		}		 
		$result['error'] = 'Unknown error';
		return $result;
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Login as a speaker
	 *
	 * @access	public
	 * @return	void
	 */		
	function login() 
	{						
		if($this->CI->session->userdata('speaker_id')) 
		{
			redirect('speaker');
		} 
		else 
		{
			$email = $this->CI->Remember_me->check_remember_me();
			$is_using_cookie = $this->_is_using_cookie($email);
			if ($is_using_cookie) {redirect('speaker');}
		}		
		
		$this->CI->load->library('form_validation');
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->CI->form_validation->set_rules('email', 'Email', $this->CI->config->item('spk_email_rule'));
		$this->CI->form_validation->set_rules('password', $this->CI->lang->line('CON_user_password_label'),$this->CI->config->item('spk_password_rule'));
		
		if($this->CI->input->post('login')) 
		{				
			$data['email'] = $this->CI->input->post('email');
			$data['password'] = $this->CI->input->post('password');					
			$is_cookie = (isset($_POST['is_cookie']) ? true : false);	
			
			if($this->CI->form_validation->run()==FALSE) 
			{
				$this->CI->_load_view('speaker/speaker_login');
				return;
			} 
			else 
			{
				$email = (isset($data['email']) ? $data['email'] : false);
				$password = (isset($data['password']) ? $data['password'] : false);	
				
				if ($email && $password) 
				{
					$password = $this->_encode($password);
					$query = $this->CI->MSpeaker->get_speaker_for_login($email, $password);
					
					if ($query->num_rows() == 1)
					{
						$row = $query->row();
						$speaker_data['speaker_id'] = $row->ID;
						$speaker_data['speaker_email'] = $row->Email;
						$speaker_data['speaker_name'] = $row->Name;
						$speaker_data['speaker_subcription_name'] = $row->TypeName;
						$speaker_data['speaker_subscription_expiration'] = $row->SubscriptionExpiration;	
						$speaker_data['lang'] = $row->Language;
						$this->_set_logindata($speaker_data, $is_cookie);
						//flashMsg('Login successful !');
						// Login successful
						redirect('speaker');
					} 
					else 
					{
						$this->CI->_data['error'] = $this->CI->lang->line('CON_invalid_username_password_message');						
						$this->CI->_load_view('speaker/speaker_login');
					}
				} 
				else 
				{
					$this->CI->_load_view('speaker/speaker_login');					
				}
			}
		} 
		else 
		{
			$this->CI->_load_view('speaker/speaker_login');			
		}
	}

	// --------------------------------------------------------------------
	
	/**
	 * Change speaker's password
	 *
	 * @access	public
	 * @return	void
	 */			
	function change_password($email) {
		$this->CI->load->library('form_validation');
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');

		$this->CI->form_validation->set_rules('old_password', 'Old Password', $this->CI->config->item('spk_password_rule'));
		$this->CI->form_validation->set_rules('new_password', 'New Password', $this->CI->config->item('spk_password_rule').'|matches[passconf]');
		$this->CI->form_validation->set_rules('passconf', 'Password Confirmation', $this->CI->config->item('spk_password_rule'));				
			
		if($this->CI->input->post('change')) 
		{		
			$data['old_password'] = $this->CI->input->post('old_password');
			$data['new_password'] = $this->CI->input->post('new_password');					
			$old_password = (isset($data['old_password']) ? $data['old_password'] : false);	
			$new_password = (isset($data['new_password']) ? $data['new_password'] : false);	
			
			if($this->CI->form_validation->run()==FALSE) 
			{
				$this->CI->_load_view('speaker/speaker_change_pw');					
				return;
			} 
			else 
			{								
				if ($old_password && $new_password) 
				{
					$old_password = $this->_encode($old_password);
					$query = $this->CI->MSpeaker->get_speaker_for_login($email, $old_password);
					if ($query->num_rows() == 1) 
					{
						$row = $query->row();													
						if (strlen($new_password)>3) 
						{
							$save_data['Password'] = $this->_encode($new_password);
							$this->CI->MSpeaker->save($row->ID, $save_data);	
							redirect('speaker/success');
						}									
					} else {
						$this->CI->_data['error'] = 'Your Old Password was incorrect';
						$this->CI->_load_view('speaker/speaker_change_pw');							
					}
				} else {
					$this->CI->_data['error'] = 'An error has been occurred';
					$this->CI->_load_view('speaker/speaker_change_pw');
				}
			}
		} else {
			$this->CI->_load_view('speaker/speaker_change_pw');
		}			
	}	
	
	// --------------------------------------------------------------------
	
	/**
	 * Delete all speaker session & cookie, remove RememberMe data and redirect to homepage
	 *
	 * @access	public
	 * @return	void
	 */			
	function logout() {
		if($this->CI->session->userdata('speaker_id')) {
			$this->CI->Remember_me->remove_remember_me($this->CI->session->userdata('speaker_email'));
			$this->CI->session->unset_userdata('speaker_id');
			$this->CI->session->unset_userdata('speaker_email');
			$this->CI->session->unset_userdata('speaker_name');
			$this->CI->session->unset_userdata('speaker_subcription_name');
			$this->CI->session->unset_userdata('speaker_subscription_expiration');
			$this->CI->session->unset_userdata('lang');
		}
		redirect('/');
	}
	
	// --------------------------------------------------------------------
	
	/**
	 * Return speaker's information if using cookie
	 *
	 * @access	private
	 * @param	string
	 * @return	mixed
	 */			
	function _is_using_cookie($email = false) {
		if ($email)
		{
			$query = $this->CI->MSpeaker->get_by_email($email);
			if ($query->num_rows() == 1) 
			{
				$row = $query->row();
				$speaker_data['speaker_id'] = $row->ID;
				$speaker_data['speaker_email'] = $row->Email;
				$speaker_data['speaker_name'] = $row->Name;
				$speaker_data['speaker_subcription_name'] = $row->TypeName;
				$speaker_data['speaker_expire'] = $row->SubscriptionExpiration;
				$speaker_data['lang'] = $row->Language;
				$this->_set_logindata($speaker_data, FALSE);
				return $speaker_data;												
			} else return false;
		} else return false;		
	}	
	
	// --------------------------------------------------------------------
	
	/**
	 * Set data when speaker loggedin (session & cookie)
	 *
	 * @access	private
	 * @param	mixed
	 * @param	bool
	 * @return	void
	 */		
    function _set_logindata($userdata, $is_cookie)
    {
        //updates the Last_visit field in the user table
        //$this->CI->MSpeaker->updateUserForLogin($userdata['id']); 		
		$this->CI->session->set_userdata($userdata);
		if ($is_cookie) $this->CI->Remember_me->add_remember_me($userdata['speaker_email']);						
    }
	
	// --------------------------------------------------------------------
	
	/**
	 * Encode password
	 *
	 * @access	private
	 * @param	string	 
	 * @return	string
	 */			
  	function _encode($password)
  	{
		// $majorsalt=null;				
  		// if ($this->CI->config->item('encryption_key')!='')
		// {
			// $_password = $this->CI->config->item('encryption_key').$password;
		// }
		// else {$_password=$password;}
				
		// if (function_exists('str_split'))
		// {
		    // $_pass = str_split($_password);       
		// }		
		// else
		// {
			// $_pass = array();
		    // if (is_string($_password))
		    // {
		    	// for ($i = 0; $i < strlen($_password); $i++)
		    	// {
		        	// array_push($_pass, $_password[$i]);
		        // }
		     // }
		// }				
		// foreach ($_pass as $_hashpass) 
		// {
			// $majorsalt .= md5($_hashpass);
		// }
		// return $password=md5($majorsalt);
		return md5($password);
  	}
	
	// --------------------------------------------------------------------
	
	function paging_ajax() {
		if (! is_admin(FALSE)) 
		{
			$out['error'] = 'Only Speaker can use this function';
			return $out;
		}
	
		$num_per_page = $this->CI->uri->segment(3);
		$page_offset = $this->CI->uri->segment(4);
		$keyword = $this->CI->input->post('keyword');
		
		if ($page_offset==FALSE) 
		{
			$page_offset = 0;
		}
		
		if ($num_per_page>0) 
		{
			$query = $this->CI->MSpeaker->speaker_paging($num_per_page, $page_offset, $keyword);
			if ($query->num_rows() > 0)
			{
				$out['speakers'] = json_encode($query->result_array());
			} 
			else 
			{
				$out['error'] = 'Your searching did not match any rows. ';
			}
		} 
		else 
		{
			$out['error'] = 'Row each page must > 0';
		}
		
		return $out;
	}
	
	// --------------------------------------------------------------------
	
	function paging_html() {		
		if (! is_admin(FALSE)) 
		{
			return FALSE;
		}	
		$num_per_page = $this->CI->uri->segment(3);
		$page_offset = $this->CI->uri->segment(4);
		$keyword = $this->CI->input->post('keyword');
		
		$config['base_url'] = base_url()."index.php/speaker/do_paging/".$num_per_page;
		$config['per_page'] = $num_per_page;
		$config['uri_segment'] = 4;
		
		if (($keyword)&&(strlen($keyword)>0)) {
			//$this->CI->db->select("tblspeaker.ID");
			$this->CI->db->like("tblspeaker.Email", $keyword);			
			$this->CI->db->from('tblspeaker');	
			//$query = $this->CI->db->get();
			//$config['total_rows'] = $query->num_rows();
			$config['total_rows'] =  $this->CI->db->count_all_results();
		} else {
			$config['total_rows'] = $this->CI->db->count_all('tblspeaker');
		}
		$this->CI->pagination->initialize($config);
		echo $this->CI->pagination->create_links();
	}
}

/* End of file xemmex_helper.php */ 
/* Location: ./system/application/helpers/xemmex_helper.php */ 