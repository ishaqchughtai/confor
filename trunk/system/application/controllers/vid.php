<?php
class Vid extends Frontend_controller {
	function Vid()
	{	
		parent::Frontend_controller();
		$this->load->helper('url','html');
		$this->load->library('video_lib');
        $this->load->model('Mshopproduct','mshopproduct');    
		//$this->load->library('vid_lib');
	}
	function index()
	{        
		$file = base_url().'test/a2.avi';
		$this->video_lib->load_video($file);
		echo $this->video_lib->duration. '</br></br>';
		$this->video_lib->convert_to_flv('./test/');
		// $aa = 4;
		// $this->_yy($aa);
		// echo $aa;
	}  	
	
	function _yy(&$b)
	{
		$b = 5;
	}
	
	function zz()
	{
		//echo __("CF_shop");
		//$this->_message('admin', 'Your video has been deleted!', 'success', 'http://www.confor.ca','confor');
		$this->_message('admin', 'Your video information has been saved!', 'success',site_url("admin/list_video_conference"));
	}
	
		
}