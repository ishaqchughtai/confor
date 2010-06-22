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

  function speaker()
  {
    $id = $this->uri->segment(3);
    $per_page = $this->uri->segment(4);
    $offset = $this->uri->segment(5);


    $config['uri_segment'] = 5;
    $config['base_url'] = base_url().'index.php/video/speaker/'.$id.'/'.$per_page;
    $config['total_rows'] = $this->MVideo->count_record_speaker($id);
    $config['per_page']=$per_page;

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';
    $this->_data['video_speaker'] = $this->MVideo->get_video_by_speaker($id,$per_page,$offset); 
    $this->pagination->initialize($config);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('home/get_video_by_speaker'); 
  }

  function archives($month,$year)
  {
    $month = $this->uri->segment(3);
    $year = $this->uri->segment(4);
    $per_page = $this->uri->segment(5);
    $offset = $this->uri->segment(6);


    $config['uri_segment'] = 6;
    $config['base_url'] = base_url().'index.php/video/archives/'.$month.'/'.$year.'/'.$per_page;
    $config['total_rows'] = $this->MVideo->count_record_archives($month,$year);
    $config['per_page']=$per_page;

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';
    $this->_data['video_archives'] = $this->MVideo->get_video_by_archives($month,$year,$per_page,$offset); 
    $this->pagination->initialize($config);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('home/archives');
  }




}