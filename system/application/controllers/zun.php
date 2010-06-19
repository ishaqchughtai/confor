<?php

class Zun extends Frontend_controller
{
	function Zun()	{
		  parent::Frontend_controller();
		  $this->load->model('MSpeaker');
		  $this->load->helper(array('form', 'url', 'date', 'JSON'));
		  $this->load->library(array('speaker_lib','pagination'));
	}	  
	
	function index() {
		//$this->speaker_lib->isSpeaker();
		$config['base_url'] = base_url()."index.php/speaker/do_paging/10";
		$config['total_rows'] = $this->db->count_all('tblspeaker');
		$config['first_link'] = 'First';
		$config['last_link'] = 'Last';
		$config['per_page'] = 10;
		$config['uri_segment'] = 4;			
		$this->pagination->initialize($config); 
		$this->_data["paging"] = $this->pagination->create_links();
		$this->_load_view('speaker/zun_index');	
	}		
} 
?>
