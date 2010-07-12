<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');

class MY_controller extends Controller {

  var $_data	= FALSE;	
  var $_container = 'container';	
  var $_memberships = FALSE;
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
  
  function _message($controller_name, $msg, $class_msg, $link=FALSE, $link_name=FALSE)
  {  
	$this->session->set_flashdata('msg', $msg);
	$this->session->set_flashdata('class_msg', $class_msg);
	if ($link) $this->session->set_flashdata('msg_link', $link);
	if ($link_name) $this->session->set_flashdata('msg_link_name', $link_name);
	redirect($controller_name.'/message');
  }
  
  function message()
  {
	$this->_load_view('message');
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

    $adv['page'] = "home/show_shop_product";
    $adv['category'] = 'video';

    $header['page'] = "home/header";
    $footer['page'] = "home/footer";				

    $this->_data['header'] = $header;		
    $this->_data['adv'] = $adv;
    $this->_data['footer'] = $footer;

    $this->_data['path'][0] = array(
    'name' => __("CF_home"),
    'link' => site_url("/")
    );		
  }

  function _before_render() {
    $side_bar['page'] = "home/sidebar";		
    $side_bar['popular_video'] = $this->Mhome->get_popular_video();
    $side_bar['recent_video'] = $this->Mhome->get_recent_video();		
    //$side_bar['$count_video'] = $this->Mhome->count_record_archives();
    $side_bar['categories'] = $this->Mhome->get_category();
    $side_bar['dates'] = $this->Mhome->get_dates();


    //$dates = $this->Mhome->get_dates();
//    print_r($dates) ;
//    $date_data = array();
//    for ($i=0; $i<count($dates); $i++)
//    {
//      $date_data[] = array(
//      'name' => $dates[$i],
//      'count' => $this->Mhome->get_count_by_month($dates[$i])
//      );
//    }
//    $side_bar['dates'] = $date_data;
    
     
    $side_bar['top_speaker'] = $this->Mhome->get_top_speaker();    
    $this->_data['side_bar'] = $side_bar;		
  }

}

// Controller for user backend
class Speaker_controller extends MY_controller {
  function Speaker_controller()
  {	
    parent::MY_controller();

    $adv['page'] = "speaker/show_shop_product";				
    $header['page'] = "speaker/header";
    $footer['page'] = "speaker/footer";

    $this->_data['header'] = $header;
    //$this->_data['side_bar'] = $side_bar;
    $this->_data['adv'] = $adv;
    $this->_data['footer'] = $footer;

    $this->_data['path'][0] = array(
    'name' => __("CF_speaker"),
    'link' => site_url("/speaker")
    );				
    $side_bar['page'] = "speaker/sidebar";
	$side_bar['membership_info'] = $this->user_lib->get_membership_info();	
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
    'name' => __("CF_admin"),
    'link' => site_url("/admin")
    );			
  }		
}

/* End of file MY_Controller.php */ 
/* Location: ./system/application/libraries/MY_Controller.php */ 