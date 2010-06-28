<?php

class Video extends Frontend_controller 
{

  function Video()
  {
    parent::Frontend_controller();
    $this->load->model('Mvconference');
    $this->_container = 'container';    
    $this->load->helper('date');
    $this->load->model('Remember_me');
    $this->load->library('vid_lib');
  }

  //add new video
  function add_video()
  {
    $userData = is_speaker();
    $id = $userData['speaker_id'];
    $this->vid_lib->init_uploader();

    $this->form_validation->set_rules('speaker_email','User name','required');
    $this->form_validation->set_rules('title','Title','required');
    $this->form_validation->set_rules('description','Description','required'); 
    $this->form_validation->set_rules('category','Category','required');
    $this->form_validation->set_rules('keywords','Keywords','required');
    $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
    $this->_data['query']=$this->Mvconference->get_category();                  

    if($this->input->post('submit'))
    {
      if($this->form_validation->run()==FALSE)
      {
        $this->_data['error'] = "Can not update !";
        $this->_load_view('speaker/add_video');   
      }
      else
      {
        $vname = $this->input->post('vname');    
        if (strlen($vname) <= 1)
        {
          $this->_data['error'] = "You must upload your clip !";
          $this->_load_view('speaker/add_video');       
          return;
        }        
        $dateupload= NOW();
        $data = array(
        'mem_id'=>$id,
        'title'=>$this->input->post('title'),
        'description'=>$this->input->post('description'),
        'category'=>$this->input->post('category'),
        'tags'=>$this->input->post('keywords'),
        'Date'=>$dateupload,
        'vhash'=>$vname.'.flv',
        'shash'=>$vname.'.jpg',
        'approved'=>1,
        'viewed'=>0          
        );
        $this->Mvconference->add_new_video($data);
        $this->list_video_conference();      
      }
    }
    else
    {  
      $this->_load_view('speaker/add_video');
    }                       
  }

  //get all video of a speaker
  function your_video()
  {
    $userData = is_speaker();

    $id = $this->uri->segment(3);
    $per_page = $this->uri->segment(4);
    $offset = $this->uri->segment(5);

    $config['uri_segment'] = 5;
    $config['base_url'] = base_url().'index.php/video/your_video/'.$id.'/'.$per_page;
    $config['total_rows'] = $this->Mvconference->count_video_speaker($id);
    $config['per_page']=$per_page;

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';

    $this->pagination->initialize($config);
    $this->_data['your_vid'] = $this->Mvconference->video_speaker($id,$per_page,$offset);

    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('speaker/your_video');
  }

  //edit video of user
  function edit_video_conference($speaker,$id)
  {
    $userData = is_speaker();
    $speaker_id = $userData['speaker_id'];
    if ($speaker_id != $speaker) redirect('/');
    if(is_nan((float)$id)) redirect(site_url("admin"));
    $this->form_validation->set_rules('title','Title','required');
    $this->form_validation->set_rules('keywords','Keywords','required');
    $this->form_validation->set_rules('description','Description','required'); 
    $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
    $this->_data['query']=$this->Mvconference->get_video_conference_by_id($id);
    $this->_data['category']=$this->Mvconference->get_category();
    $this->_data['error'] ="";
    if($this->input->post('submit')){
      if($this->form_validation->run()==FALSE)
      {
        $this->_load_view('speaker/edit_video_conference/');
      }
      else
      {
        $config['upload_path'] = './videos/';
        $config['allowed_types'] = 'flv|gif|jpg|png';
        $config['max_size']    = '20480';
        $this->load->library('upload', $config);

        if ( ! $this->upload->do_upload())
        {
          $this->_data['error'] = $this->upload->display_errors();
          $this->_load_view('speaker/edit_video_conference');
        }    
        else
        {
          $data_upload = $this->upload->data();
          $data = array(
          'title'=>$this->input->post('title'),
          'description'=>$this->input->post('description'),
          'category'=>$this->input->post('category'),
          'tags'=>$this->input->post('keywords'),
          'vhash'=>$data_upload['file_name'],
          );
          if(!$data_upload)
          {
            return;
          }
          else
          {
            $this->Mvconference->update_conference($data,$id);
            redirect('speaker/video/your_video/'.$id_speaker.'/5');
          }
        }
      }
    }
    else
    {
      $this->_load_view('speaker/edit_video_conference');
    }

  }

  function speaker()
  {
    $id = $this->uri->segment(3);
    $per_page = $this->uri->segment(4);
    $offset = $this->uri->segment(5);


    $config['uri_segment'] = 5;
    $config['base_url'] = base_url().'index.php/video/speaker/'.$id.'/'.$per_page;
    $config['total_rows'] = $this->Mvconference->count_record_speaker($id);
    $config['per_page']=$per_page;

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';
    $this->_data['video_speaker'] = $this->Mvconference->get_video_by_speaker($id,$per_page,$offset); 
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