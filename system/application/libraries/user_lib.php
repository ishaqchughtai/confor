<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * User library Class
 *
 * @package		Confor
 * @subpackage	Libraries
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
 
define("COOKIE_EXPIRE", 60 * 60 * 24 * 60); //60 days by default
define("COOKIE_PATH", "/"); //Avaible in whole domain

class User_lib 
{ 	
	var $redirect_login = '/home/login';
	var $control_panel_link = 'speaker';
	
	function User_lib()
	{
		$this->CI =& get_instance();
		$this->CI->load->model('MUser');			
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
			//$speaker_data['id'] = $row->id;
			$speaker_data['speaker_id'] = $this->CI->session->userdata('speaker_id');
			$speaker_data['speaker_email'] = $this->CI->session->userdata('speaker_email');
			$speaker_data['speaker_name'] = $this->CI->session->userdata('speaker_name');
			$speaker_data['username'] = $this->CI->session->userdata('username');
			$speaker_data['cookie_id'] = $this->CI->session->userdata('cookie_id');
			$speaker_data['lang'] = $this->CI->session->userdata('lang');
			$speaker_data['userlevel'] = $this->CI->session->userdata('userlevel');	
			$speaker_data['membership_id'] = $this->CI->session->userdata('membership_id');
			return $speaker_data;
		} 
		else 
		{
			// $user_name = $this->CI->input->cookie('MSM_COOKIE', TRUE);		
			// $cookie_id = $this->CI->input->cookie('MSM_COOKIE_ID', TRUE);			
			if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID']))			
			{
				$is_using_cookie = $this->_is_using_cookie($_COOKIE['MSM_COOKIE'], $_COOKIE['MSM_COOKIE_ID']);
				if ($is_using_cookie) {return $is_using_cookie;}
			}			
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
			if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID']))				
			{
				$is_using_cookie = $this->_is_using_cookie($_COOKIE['MSM_COOKIE'], $_COOKIE['MSM_COOKIE_ID']);
				if ($is_using_cookie) 
				{
					$result['name'] = $is_using_cookie['speaker_name'];
					return $result;													
				}
			}					
		}
				
		$this->CI->form_validation->set_rules('username', 'Username', $this->CI->config->item('spk_user_rule'));
		$this->CI->form_validation->set_rules('password', __('CON_user_password_label'), $this->CI->config->item('spk_password_rule'));
						
		$data['username'] = $this->CI->input->post('username');
		$data['password'] = $this->CI->input->post('password');
		
		if($this->CI->form_validation->run()==FALSE) 
		{
			$result['error'] = __('CON_invalid_validation_message');
			return $result;
		} 
		else 
		{
			$username = (isset($data['username']) ? $data['username'] : false);
			$password = (isset($data['password']) ? $data['password'] : false);	
			$is_cookie = $this->CI->input->post('is_cookie');
			
			if ($username && $password) 
			{				
				$query = $this->CI->MUser->get_user_for_login($username, $this->_encode($password));
				if ($query->num_rows() == 1) 
				{
					$row = $query->row();
					//$speaker_data['id'] = $row->id;
					$speaker_data['speaker_id'] = $row->id;
					$speaker_data['speaker_email'] = $row->email;
					$speaker_data['speaker_name'] = $row->name;
					$speaker_data['username'] = $row->username;
					$speaker_data['cookie_id'] = xm_generateRandID();
					$speaker_data['lang'] = $row->language;
					$speaker_data['userlevel'] = $row->userlevel;
					$speaker_data['membership_id'] = $row->membership_id;
					$this->_set_logindata($speaker_data, $is_cookie);
					$result['name'] = $row->name;
					return $result;	
				} 
				else 
				{
					$result['error'] = __('CON_invalid_username_password_message');					
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
			redirect($this->control_panel_link);
		} 
		else 
		{
			// $user_name = $this->CI->input->cookie('MSM_COOKIE', TRUE);		
			// $cookie_id = $this->CI->input->cookie('MSM_COOKIE_ID', TRUE);
			if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID']))	
			{				
				$is_using_cookie = $this->_is_using_cookie($_COOKIE['MSM_COOKIE'], $_COOKIE['MSM_COOKIE_ID']);
				if ($is_using_cookie) {redirect($this->control_panel_link);}
			}
		}		
		
		$this->CI->load->library('form_validation');
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->CI->form_validation->set_rules('username', 'Username', $this->CI->config->item('spk_user_rule'));
		$this->CI->form_validation->set_rules('password', __('CON_user_password_label'),$this->CI->config->item('spk_password_rule'));
		
		if($this->CI->input->post('login')) 
		{				
			$data['username'] = $this->CI->input->post('username');
			$data['password'] = $this->CI->input->post('password');					
			$is_cookie = (isset($_POST['is_cookie']) ? true : false);	
			
			if($this->CI->form_validation->run()==FALSE) 
			{
				$this->CI->_load_view('speaker/user_login');
				return;
			} 
			else 
			{
				$username = (isset($data['username']) ? $data['username'] : false);
				$password = (isset($data['password']) ? $data['password'] : false);	
				
				if ($username && $password) 
				{					
					$query = $this->CI->MUser->get_user_for_login($username, $this->_encode($password));
					
					if ($query->num_rows() == 1)
					{
						$row = $query->row();				
						//$speaker_data['id'] = $row->id;
						$speaker_data['speaker_id'] = $row->id;
						$speaker_data['speaker_email'] = $row->email;
						$speaker_data['speaker_name'] = $row->name;
						$speaker_data['username'] = $row->username;
						$speaker_data['cookie_id'] = xm_generateRandID();//$row->cookie_id;
						$speaker_data['lang'] = $row->language;
						$speaker_data['userlevel'] = $row->userlevel;	
						$speaker_data['membership_id'] = $row->membership_id;
						$this->_set_logindata($speaker_data, $is_cookie);
						//flashMsg('Login successful !');
						// Login successful
						redirect($this->control_panel_link);
					} 
					else 
					{
						$this->CI->_data['error'] = __('CON_invalid_username_password_message');
						$this->CI->_load_view('speaker/user_login');
					}
				} 
				else 
				{
					$this->CI->_load_view('speaker/user_login');					
				}
			}
		} 
		else 
		{
			$this->CI->_load_view('speaker/user_login');			
		}
	}

	// --------------------------------------------------------------------		
	/**
	 * Register new speaker
	 *
	 * @access	public
	 * @return	void
	 */		
	function register() 
	{						
		if($this->CI->session->userdata('speaker_id')) 
		{
			redirect($this->control_panel_link);
		} 
		else 
		{
			if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID']))	
			{				
				$is_using_cookie = $this->_is_using_cookie($_COOKIE['MSM_COOKIE'], $_COOKIE['MSM_COOKIE_ID']);
				if ($is_using_cookie) {redirect($this->control_panel_link);}
			}
		}
		
		$this->CI->load->plugin('captcha');
		$vals = array(
						'word'		 => strtoupper(xm_generateRandStr(6)),
						'img_path'	 => './assets/captcha/',
						'img_url'	 => base_url().'assets/captcha/',
						'font_path'	 => base_url().'system/fonts/texb.ttf',
						'img_width'	 => '150',
						'img_height' => 32,
						'expiration' => 300
					);
		
		$cap = create_captcha($vals);
				
		$cap_save = array(
						'captcha_id'	=> '',
						'captcha_time'	=> $cap['time'],
						'ip_address'	=> $this->CI->input->ip_address(),
						'word'			=> $cap['word']
					);
		$query = $this->CI->db->insert_string('captcha', $cap_save);
		$this->CI->db->query($query);		
		$this->CI->_data['captcha_img'] = $cap['image'];		
		
		$this->CI->load->library('form_validation');
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->CI->form_validation->set_rules('username', 'Username', $this->CI->config->item('spk_user_rule').'|callback_is_username_exists');		
		$this->CI->form_validation->set_rules('password', __('CON_user_password_label'), $this->CI->config->item('spk_password_rule').'|matches[passconf]');
		$this->CI->form_validation->set_rules('passconf', 'Password Confirmation', $this->CI->config->item('spk_password_rule'));				
		$this->CI->form_validation->set_rules('name','Name','required');
		$this->CI->form_validation->set_rules('company_name','Company','required');
		$this->CI->form_validation->set_rules('first_name','First Name','required');
		$this->CI->form_validation->set_rules('email','Email',$this->CI->config->item('spk_email_rule').'|callback_is_email_exists');
		$this->CI->form_validation->set_rules('captcha','Confirm code','required|max_length[6]|callback_is_correct_captcha');
		if($this->CI->input->post('register')) 
		{							
			if($this->CI->form_validation->run()==FALSE) 
			{
				$this->CI->_data['country'] = $this->CI->input->post('country');
				$this->CI->_data['description'] = $this->CI->input->post('description');
				$this->CI->_load_view('speaker/speaker_register');
				return;
			} 
			else 
			{			
				$save_data['username'] = $this->CI->input->post('username');
				$save_data['email'] = $this->CI->input->post('email');
				$save_data['name'] = $this->CI->input->post('name');				
				$save_data['first_name'] = $this->CI->input->post('first_name');
				$save_data['company_name'] = $this->CI->input->post('company_name');
				$save_data['country'] = $this->CI->input->post('country');				
				$save_data['description'] = $this->CI->input->post('description');				
				$save_data['userlevel'] = 1;
				$save_data['cookie_id'] = 0;
				$save_data['token'] = 0;
				$save_data['status'] = 1;
				$save_data['notify'] = 1;
				$save_data['membership_id'] = 1;
				$save_data['register_date'] = 'NOW()';				
				$save_data['last_ip'] = $this->CI->input->ip_address();			
				$save_data['password'] = $this->_encode($this->CI->input->post('password'));																				
				$this->CI->MUser->add($save_data);
				
				$this->CI->session->set_flashdata('msg', 'Register succesfull');
				$this->CI->session->set_flashdata('class_msg', 'success');			
				redirect('home/message');											
			}
		}	
		else 
		{
			$this->CI->_load_view('speaker/speaker_register');			
		}
	}	
	

	// --------------------------------------------------------------------		
	/**
	 * Update speaker's profile
	 *
	 * @access	public
	 * @return	void
	 */		
	function edit_profile($id) 
	{													
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->CI->form_validation->set_rules('name','Name','required');
		$this->CI->form_validation->set_rules('first_name','First Name','required');
		$this->CI->form_validation->set_rules('company_name','Company','required');
		$this->CI->form_validation->set_rules('email','Email',$this->CI->config->item('spk_email_rule').'|callback_is_email_exists');		
		
		if($this->CI->input->post('update')) 
		{							
			if($this->CI->form_validation->run()==FALSE) 
			{
				$this->CI->_data['country'] = $this->CI->input->post('country');
				$this->CI->_data['description'] = $this->CI->input->post('description');
				$this->CI->_load_view('speaker/speaker_edit_profile');
				return;
			} 
			else 
			{							
				$save_data['email'] = $this->CI->input->post('email');
				$save_data['name'] = $this->CI->input->post('name');				
				$save_data['first_name'] = $this->CI->input->post('first_name');
				$save_data['company_name'] = $this->CI->input->post('company_name');
				$save_data['country'] = $this->CI->input->post('country');
				$save_data['description'] = $this->CI->input->post('description');
				// $save_data['userlevel'] = 1;
				// $save_data['cookie_id'] = 0;
				// $save_data['token'] = 0;
				// $save_data['status'] = 1;
				// $save_data['notify'] = 1;
				// $save_data['register_date'] = 'NOW()';				
				$save_data['last_ip'] = $this->CI->input->ip_address();							
				$this->CI->MUser->save($id, $save_data);				
				$this->CI->session->set_flashdata('msg', 'Your profile has been updated');
				$this->CI->session->set_flashdata('class_msg', 'success');			
				redirect('speaker/message');							
			}
		}	
		else 
		{
			$query = $this->CI->MUser->get_by_id($id);	
			if ($query->num_rows()>0)
			{
				$speaker_data = $query->row();
				$this->CI->_data['email'] = $speaker_data->email;
				$this->CI->_data['name'] = $speaker_data->name;
				$this->CI->_data['first_name'] = $speaker_data->first_name;				
				$this->CI->_data['company_name'] = $speaker_data->company_name;								
				$this->CI->_data['country'] = $speaker_data->country;
				$this->CI->_data['description'] = $speaker_data->description;				
				$this->CI->_data['membership_id'] = $speaker_data->membership_id;				
			}		
			$this->CI->_load_view('speaker/speaker_edit_profile');
		}
	}			
	
	// --------------------------------------------------------------------
		
	/**
	 * Change speaker's password
	 *
	 * @access	public
	 * @return	void
	 */			
	function change_password($username) 
	{		
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
					$query = $this->CI->MUser->get_user_for_login($username, $this->_encode($old_password));
					if ($query->num_rows() == 1) 
					{
						$row = $query->row();													
						if (strlen($new_password)>0) 
						{
							$save_data['password'] = $this->_encode($new_password);
							$this->CI->MUser->update_by_username($row->username, $save_data);								
							$this->CI->session->set_flashdata('msg', 'Your password has been successfully updated');
							$this->CI->session->set_flashdata('class_msg', 'success');
							redirect('speaker/message');
						}									
					} 
					else 
					{
						$this->CI->_data['error'] = 'Your Old Password was incorrect';
						$this->CI->_load_view('speaker/speaker_change_pw');							
					}
				} 
				else 
				{
					$this->CI->_data['error'] = 'An error has been occurred';
					$this->CI->_load_view('speaker/speaker_change_pw');
				}
			}
		} 
		else 
		{
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
	function logout() 
	{
		if($this->CI->session->userdata('username')) 
		{			
			$this->CI->session->unset_userdata('speaker_id');
			$this->CI->session->unset_userdata('speaker_email');
			$this->CI->session->unset_userdata('speaker_name');
			$this->CI->session->unset_userdata('lang');
			$this->CI->session->unset_userdata('username');
			$this->CI->session->unset_userdata('cookie_id');
			$this->CI->session->unset_userdata('userlevel');
			@session_start();
			unset($_SESSION['username']);
			unset($_SESSION['cookie_id']);			
			if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID'])) 
			{
				  setcookie("MSM_COOKIE", "", time() - COOKIE_EXPIRE, COOKIE_PATH);
				  setcookie("MSM_COOKIE_ID", "", time() - COOKIE_EXPIRE, COOKIE_PATH);
			}		  			
			// set_cookie("MSM_COOKIE");
			// set_cookie("MSM_COOKIE_ID");							
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
	function _is_using_cookie($username, $cookie_id) 
	{
		if ($username)
		{			
			$row = $this->CI->MUser->confirm_user_cookie_id($username, $cookie_id);	
			if ($row) 
			{
				//$speaker_data['id'] = $row->id;
				$speaker_data['speaker_id'] = $row->id;
				$speaker_data['speaker_email'] = $row->email;
				$speaker_data['speaker_name'] = $row->name;
				$speaker_data['username'] = $row->username;
				$speaker_data['cookie_id'] = xm_generateRandID();
				$speaker_data['lang'] = $row->language;
				$speaker_data['userlevel'] = $row->userlevel;
				$speaker_data['membership_id'] = $row->membership_id;
				$this->_set_logindata($speaker_data, FALSE);
				return $speaker_data;
			} 
		} 
		return FALSE;
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
		$this->CI->session->set_userdata($userdata);
		//updates the last access field in the users table		
		$this->CI->MUser->update_user_for_login($userdata['username'], $userdata['cookie_id']);
		if ($is_cookie) 
		{
			// set_cookie("MSM_COOKIE", $userdata['username'], $this->config->item('remember_me_life'));
			// set_cookie("MSM_COOKIE_ID", $userdata['cookie_id'], $this->config->item('remember_me_life'));			
			  setcookie("MSM_COOKIE", $userdata['username'], time() + COOKIE_EXPIRE, COOKIE_PATH);
			  setcookie("MSM_COOKIE_ID", $userdata['cookie_id'], time() + COOKIE_EXPIRE, COOKIE_PATH);			
		}		
		@session_start();
		$_SESSION['username'] = $userdata['username'];
		$_SESSION['cookie_id'] = $userdata['cookie_id'];
    }
	
	// --------------------------------------------------------------------
	
	function paging_ajax() {
		if (! is_admin(FALSE)) 
		{
			$out['error'] = 'Only Admin can use this function';
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
			$query = $this->CI->MUser->speaker_paging($num_per_page, $page_offset, $keyword);
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
			$this->CI->db->like("users.user", $keyword);
			$this->CI->db->from('users');
			$config['total_rows'] =  $this->CI->db->count_all_results();
		} else {
			$config['total_rows'] = $this->CI->db->count_all('users');
		}
		$this->CI->pagination->initialize($config);
		echo $this->CI->pagination->create_links();
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
	
}

/* End of file user_lib.php */ 
/* Location: ./system/application/libraries/user_lib.php */ 