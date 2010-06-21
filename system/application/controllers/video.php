<?php

class Video extends Frontend_controller 
{

  function Video()
  {
    parent::Frontend_controller();
    $this->load->model('MVideo');
    $this->_container = 'container';    
    $this->load->helper('date');
    $this->load->model('Remember_me');
  }
  
  function speaker($speaker)
  {
    $this->_data['query'] = $this->MVideo->get_video_by_speaker($speaker);
    $this->_load_view('home/get_video_by_speaker'); 
  }
  
  function archives($month,$year)
  {
    $this->_data['query'] = $this->MVideo->get_video_by_archives($month,$year);
    $this->_load_view('home/archives');
  }




}