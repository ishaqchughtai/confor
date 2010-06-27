<?php
class Vid extends Controller {
	function Vid()
	{	
		parent::Controller();
		$this->load->helper('url','html');
		$this->load->library('video_lib');
		//$this->load->library('vid_lib');
	}
	function index()
	{        
		$file = base_url().'test/a1.mp4';
		$this->video_lib->load_video($file);
		if ($this->video_lib->convert_to_flv('./test/')) echo 'FFFFFFFF';
		//$this->video_lib->create_thumb('./test/a4.jpg');		
		print_r($this->video_lib);
	
				
	}  	
	
		
}