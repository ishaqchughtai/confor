<?php
class Vid extends Controller {
	function Vid()
	{	
		parent::Controller();
		$this->load->helper('url','html');
		$this->load->library('video_lib');
		//$this->load->library('vid_lib');
		$this->load->helper('file');
	}
	function index()
	{        
		//$file = base_url().'test/a1.mp4';
		//$fileun = base_url().'test/confor.txt';
		$fileName = 'a4';
		//$this->video_lib->load_video($file);
		//$this->video_lib->convert_to_flv('./test/');
		//$this->video_lib->create_thumb('./test/a4.jpg');
		//delete_files('./confor/test/'.$fileName);
		$path = './confor/test/a4';
		echo file_exists($path);
		if(is_file($fileName ))
  		{
		  echo ("$fileName is a regular file");
		  }
		else
		  {
		  echo ("$fileName is not a regular file");
		  } 
		$result = unlink($path);
 
if($result){
   echo 'File has been deleted successfully!';
}else{
   echo  'There is a problem deleting the file!';
}            				
		//print_r($this->video_lib);
	
				
	}  	
	
		
}