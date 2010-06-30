<?php
/**
 * Speaker Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Speaker extends Speaker_controller
{
	
	function Speaker()	{
		  parent::Speaker_controller();
		  $this->load->helper(array('date', 'JSON'));		  
	}	  
	
	function index() {
		is_speaker();
		$this->_data['path'][] = array(
			'name' => __("CF_control_panel"),
			'link' => site_url("speaker")
		);		
		
		$this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
		$this->_data['header']['page'] = '/speaker/header_panel';
		$this->_load_view('speaker/index');	
	}
	
	function do_login() {
		$login = $this->user_lib->login_ajax();
		echo json_encode($login);
	}
	
	function do_paging() {					
		$this->load->view('speaker/speaker_json',$this->user_lib->paging_ajax());
	}
	
	function get_paging_html() {		
		$this->user_lib->paging_html();
	}	
		
	function logout() {		
		$this->user_lib->logout();
	}
	  	  
	function edit_profile() {
  
  	$this->_data['path'][] = array(
      'name' => __("CF_edit_admin"),
      'link' => site_url("speaker/edit_profile")
    );
    	
		$userData = $this->user_lib->is_speaker();
		$id = $userData['speaker_id'];
		$this->user_lib->edit_profile($id);		
	}	
	
	function change_password() {
    $this->_data['path'][] = array(
      'name' => __("CF_change_pass"),
      'link' => site_url("speaker/change_password")
    );
    
		$user_data = $this->user_lib->is_speaker();
		$username = $user_data['username'];
		$this->user_lib->change_password($username);
	}
	
} 
?>
