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
		  $this->load->model('MSpeaker');
		  $this->load->helper(array('date', 'JSON'));
		  $this->load->library('speaker_lib'); 
	}	  
	
	function index() {
		$this->speaker_lib->is_speaker();
		
		$this->_data['path'][] = array(
			'name' => __("CON_control_panel"),
			'link' => site_url("speaker")
		);		
		
		$this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
		$this->_data['header']['page'] = '/speaker/header_panel';
		$this->_load_view('speaker/index');	
	}
	
	function do_login() {
		$login = $this->speaker_lib->login_ajax();
		echo json_encode($login);
	}
	
	function do_paging() {					
		$this->load->view('speaker/speaker_json',$this->speaker_lib->paging_ajax());
	}
	
	function get_paging_html() {		
		$this->speaker_lib->paging_html();
	}	
	
	// function login() {		
		// $this->speaker_lib->login();
	// }
	
	function logout() {
		$this->speaker_lib->logout();
	}
	  	  
	function edit_profile() {		
		$userData = $this->speaker_lib->is_speaker();
		$id = $userData['speaker_id'];
		
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->form_validation->set_rules('name','Name','required');
		$this->form_validation->set_rules('firstName','FirstName','required');
		$this->form_validation->set_rules('email','Email',$this->config->item('spk_email_rule'));

		if($this->input->post('update')) {
			if($this->form_validation->run()==FALSE) {								
				$this->_data['CompanyName'] = $this->input->post('companyName');
				$this->_data['Description'] = $this->input->post('description');
				$this->_data['TypeName'] = $this->input->post('typeName');
				$this->_data['SubcriptionDate'] = $this->input->post('subcriptionDate');
				$this->_data['SubscriptionExpiration'] = $this->input->post('subscriptionExpiration');								
				$this->_load_view('speaker/speaker_edit_profile');	
				return;
			} else {				
				$save_data = array(
					'Name'=>$this->input->post('name'),
					'FirstName'=>$this->input->post('firstName'),
					'CompanyName'=>$this->input->post('companyName'),
					'Description'=>$this->input->post('description'),
					'Email'=>$this->input->post('email')					
				);					
				$this->MSpeaker->save($id, $save_data);
				redirect('speaker/success');
			}
		} else {
			$speaker_data = $this->MSpeaker->get_by_id($id);	
			if ($speaker_data) {			
				$this->_data['Name'] = $speaker_data->Name;
				$this->_data['FirstName'] = $speaker_data->FirstName;				
				$this->_data['CompanyName'] = $speaker_data->CompanyName;
				$this->_data['Description'] = $speaker_data->Description;
				$this->_data['Email'] = $speaker_data->Email;
				$this->_data['TypeName'] = $speaker_data->TypeName;
				$this->_data['SubcriptionDate'] = $speaker_data->SubcriptionDate;
				$this->_data['SubscriptionExpiration'] = $speaker_data->SubscriptionExpiration;
			}		
			$this->_load_view('speaker/speaker_edit_profile');			
		}				
	}	
	
	function change_password() {
		$user_data = $this->speaker_lib->is_speaker();
		$email = $user_data['speaker_email'];
		$this->speaker_lib->change_password($email);
	}
	
	function success() {
		$this->speaker_lib->is_speaker();
		$this->_load_view('speaker/speaker_success');		
	}
} 
?>
