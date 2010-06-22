<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class MY_controller extends Controller {

	var $_data	= FALSE;	
	var $_container = 'container';	
	/**
	 * Constructor
	 *
	 * Calls the initialize() function
	 */
	function MY_controller()
	{	
		parent::Controller();
		$this->_data['lang'] = xemmex_language();		
		$this->_data['path'] = '';
	}
	
	function _load_view($path) {	
		$this->_before_render();
		$this->_data['load_page'] = $path;
		$this->load->view($this->_container, $this->_data);
	}
	
	function _before_render() {
	}

}

class Frontend_controller extends MY_controller {

	function Frontend_controller()
	{	
		parent::MY_controller();
		$this->load->model('Mhome'); 		
		$this->_container = 'home/container';		
				
		$adv['page'] = "home/adv";
		$adv['category'] = 'video';
		
		$header['page'] = "home/header";
		$footer['page'] = "home/footer";				
		
		$this->_data['header'] = $header;		
		$this->_data['adv'] = $adv;
		$this->_data['footer'] = $footer;
		
		$this->_data['path'][0] = array(
			'name' => __("CON_home"),
			'link' => site_url("/")
		);		
	}
	
	function _before_render() {
		$side_bar['page'] = "home/sidebar";		
		$side_bar['popular_video'] = $this->Mhome->get_popular_video();
		$side_bar['recent_video'] = $this->Mhome->get_recent_video();					
		$this->_data['side_bar'] = $side_bar;		
	}

}

// Controller for user backend
class Speaker_controller extends MY_controller {
	function Speaker_controller()
	{	
		parent::MY_controller();
		
		$adv['page'] = "speaker/adv";				
		$header['page'] = "speaker/header";
		$footer['page'] = "speaker/footer";
		
		$this->_data['header'] = $header;
		//$this->_data['side_bar'] = $side_bar;
		$this->_data['adv'] = $adv;
		$this->_data['footer'] = $footer;
		
		$this->_data['path'][0] = array(
			'name' => __("CON_speaker"),
			'link' => site_url("/speaker")
		);				
		$side_bar['page'] = "speaker/sidebar";
		$this->_data['side_bar'] = $side_bar;		
	}	
}

// Controller for admin
class Admin_controller extends MY_controller {
	function Admin_controller()
	{	
		parent::MY_controller();		
		$this->_container = 'admin/container';				
		$footer['page'] = "admin/footer";
		$this->_data['footer'] = $footer;
		$header['page'] = "admin/header_panel";
		$side_bar['page'] = "admin/sidebar_empty";
		$this->_data['header'] = $header;
		$this->_data['side_bar'] = $side_bar;	
		$this->_data['path'][0] = array(
			'name' => __("CON_admin"),
			'link' => site_url("/admin")
		);			
	}		
}

/* End of file MY_Controller.php */ 
/* Location: ./system/application/libraries/MY_Controller.php */ 