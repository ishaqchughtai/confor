<?php

class Event extends Frontend_controller {
	//var $blog_sidebar = 'most_post';
    function Event()
    {
        parent::Frontend_controller();
		$this->_container = 'container';		
		$this->load->model('MEvent');		
		$this->load->helper('date');		
		//$this->load->library('speaker_lib'); 
		$this->load->model('MSpeaker');
		$this->load->model('Remember_me');		
		$this->_data['adv']['category'] = 'event';
    }	
	
	function _before_render() {
		$side_bar['page'] = "event/sidebar";		
		$side_bar['popular_video'] = $this->Mhome->get_popular_video();
		$side_bar['recent_video'] = $this->Mhome->get_recent_video();	
		$this->_data['side_bar'] = $side_bar;		
	}

    function index()
    {				

    }		

    function show_event($date)
    {
      //$config['base_url'] = base_url().'index.php/event/show-event/'.$date.'/';
//      $config['total_rows'] = $this->MEvent->count_record();
//      $config['per_page']='3';

//      $config['full_tag_open'] = '<li>';        
//      $config['full_tag_close'] = '</li>'; 
//      $config['next_link'] = 'Next >';
//      $config['prev_link'] = '< Previous';
//      $config['last_link'] = 'Last >>';
//      $config['first_link'] = '<< First';

//      $this->pagination->initialize($config);
//      $this->data['query'] = $this->MEvent->get_event_by_date($this->uri->segment(3),$config['per_page'],$date);

//      $this->data['pagination'] = $this->pagination->create_links();
//      $this->load->view('event',$this->data);
      
      $this->_data['events'] = $this->MEvent->get_event_by_date($date);
      $this->_load_view('event/show_event');
    }
	
    //Content's event of user
    function event_content($id) 
    {
      $this->_data['query'] = $this->MEvent->get_event_by_id($id);
      $this->_load_view('event/event_content');
    }
	
    //Add New Event of speaker
    function add()
    {
      //$userData = $this->speaker_lib->is_speaker();
	  $userData = is_speaker();
      $id = $userData['speaker_id'];
      if($this->input->post('btnsubmit'))
      {
        $this->form_validation->set_rules('title','Title','trim|required|max_length[50]');
        $this->form_validation->set_rules('subject','Subject','trim|required|max_length[50]');
        $this->form_validation->set_rules('keywords','Keywords','trim|required|callback_keyword_check');
        $this->form_validation->set_rules('description','Description','trim|required|max_length[500]');
        $this->form_validation->set_error_delimiters('<p class="not_error short"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
          $this->_load_view('event/add_event');
        }
        else
        {   
          $speaker = $id;
          $date = date('Y-m-d');
          $title = $this->input->post('title');                                          
          $subject = $this->input->post('subject');
          $keywords = $this->input->post('keywords');
          $description = $this->input->post('description');
          $status = 0;
          if($this->MEvent->add_event($speaker,$date,$title,$subject,$keywords,$description,$status)==TRUE)
          {
            $this->_load_view('event/add_success');     
          }
        }  
      } 
      else
      {
        $this->_load_view('event/add_event');
      }
    }
	
    //Get Event To form
    function get_event($author, $id)
    {
	  $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];	  
	  
	  if ($speaker_id != $author) redirect('/');
	  
      $this->_data['query'] = $this->MEvent->get_data_to_form($id);
      $this->_load_view('event/edit_event');
    }	
	
    //Edit Event of speaker
    function edit_event($author, $id)
    {   
	  $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];	 
	  if ($speaker_id != $author) redirect('/');
	  
      if($this->input->post('btnedit'))
      {
        $this->form_validation->set_rules('title','Title','trim|required|max_length[50]');
        $this->form_validation->set_rules('subject','Subject','trim|required|max_length[50]');
        $this->form_validation->set_rules('keywords','Keywords','trim|required|callback_keyword_check');
        $this->form_validation->set_rules('description','Description','trim|required|max_length[500]');
        $this->form_validation->set_error_delimiters('<p class="not_error short"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
          $this->get_event($author, $id);
        }
        else
        {

          $title = $this->input->post('title');                                          
          $subject = $this->input->post('subject');
          $keywords = $this->input->post('keywords');
          $description = $this->input->post('description');
          $data = $this->MEvent->edit($id,$title,$subject,$keywords,$description);
          redirect('event/event_content/'.$id);
        }   
      }
    }
	
    //Delete Event
    function delete_event($author, $id)
    {
	
	  $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];	 
	  if ($speaker_id != $author) redirect('/');	
	
      if($this->input->post('btndelete'))
      {
        $this->MEvent->delete($id);
        redirect('event/show_event/'.date('Y-m-d'));    
      }
    }
	
    //Keyword check
	function keyword_check($Keywords)
	{
		$Key = explode(" ", $Keywords);
		for($i=0;$i<count($Key);)
		{
			$i++;    
		}
		if($i > 4)
		{
			$this->form_validation->set_message('keyword_check', 'The %s field max are four word'); 
			return FALSE ;           
		}else
		{
			return TRUE ;
		}
	}
	
    //Pagination Event
    function event_list()
    {
		// $date = $this->uri->segment(2);
		// $per_page = $this->uri->segment(3);
		// $offset = $this->uri->segment(4);
		// $config['uri_segment'] = 4;
      // if($this->session->userdata('admin')=="")
      // {
        // redirect(site_url("admin"));
      // }
	  if (is_admin())      
      {
        $config['base_url'] = base_url().'index.php/event/event_list/';
        $config['total_rows'] = $this->db->count_all('tblevent');
        $config['per_page']='5';

        $config['full_tag_open'] = '<li>';        
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';

        $this->pagination->initialize($config);
        $this->_data['query'] = $this->MEvent->get_all_event($config['per_page'], $this->uri->segment(3));
        $this->_data['pagination'] = $this->pagination->create_links();        
        $this->_load_view('admin/event_view_admin');    
      }
    }
	
   //Content's event of admin
    function event_content_admin($id) 
    {
		if (is_admin()) 
		{         
			$this->_data['query'] = $this->MEvent->get_event_by_id($id);
			$this->_load_view('admin/event_content_admin');
		}
    }
	
	//get event of admin
    function get_event_admin($id)
    {
		is_admin();
		$this->_data['query'] = $this->MEvent->get_data_to_form_admin($id);
		$this->_load_view('admin/get_event_admin');		
    }	

    //Edit event of admin
    function edit_event_admin($id)
    {   
		is_admin();
		if($this->input->post('btnedit'))
		{
		$this->form_validation->set_rules('speaker','Speaker','trim|required|');
		$this->form_validation->set_rules('title','Title','trim|required|max_length[50]');
		$this->form_validation->set_rules('subject','Subject','trim|required|max_length[50]');
		$this->form_validation->set_rules('keywords','Keywords','trim|required|callback_keyword_check');
		$this->form_validation->set_rules('description','Description','trim|required|max_length[500]');
		$this->form_validation->set_error_delimiters('<p class="not_error short"><span class="img"></span>','<span class="close"></span></p>');
		if($this->form_validation->run()==FALSE)
		{
		  $this->get_event_admin($id);
		}
		else
		{
			$speaker_id = $this->input->post('speaker');
			$title = $this->input->post('title');                                          
			$subject = $this->input->post('subject');
			$keywords = $this->input->post('keywords');
			$description = $this->input->post('description');
			$status = $this->input->post('status');
			$data = $this->MEvent->edit_event($id,$speaker_id,$title,$subject,$keywords,$description,$status);
			$status = $this->input->post('status');
			redirect('event/event_content_admin/'.$id);
		}   
		}
    }

    //Delete Event admin
    function delete_event_admin($id)
    {
		is_admin();
		if($this->input->post('btndelete'))
		{
			$this->MEvent->delete($id);
			redirect('event/event_list');    
		}
    }	
	
    //Add new event of admin
    function add_event()
    {
		is_admin();
        if($this->input->post('btnsubmit'))
        {
          $this->form_validation->set_rules('title','Title','trim|required|max_length[50]');
          $this->form_validation->set_rules('subject','Subject','trim|required|max_length[50]');
          $this->form_validation->set_rules('keywords','Keywords','trim|required|callback_keyword_check');
          $this->form_validation->set_rules('description','Description','trim|required|max_length[500]');
          $this->form_validation->set_error_delimiters('<p class="not_error short"><span class="img"></span>','<span class="close"></span></p>');
          if($this->form_validation->run()==FALSE)
          {
            $this->_load_view('admin/add_event_admin');
          }
          else
          {   
            $speaker = $this->input->post('speaker');
            $date = date('Y-m-d');
            $title = $this->input->post('title');                                          
            $subject = $this->input->post('subject');
            $keywords = $this->input->post('keywords');
            $description = $this->input->post('description');
            $status = 1;
            if($this->MEvent->add_event($speaker,$date,$title,$subject,$keywords,$description,$status)==TRUE)
            {
				//$this->_load_view('admin/add_event_admin');
				redirect('event/event_list');
            }
          }  
        } 
        else
        {
          $this->_load_view('admin/add_event_admin');    
        }   
	}
	
    //Search Event
    function search()
    {
		$query = $this->MEvent->search_event();
		if($query->num_rows()>0)
		{
			$this->_data['query'] =  $query->result_array();
			$this->_load_view('admin/search_event');    
		}
		else
		{
			$this->_data['error'] = 'There are no results for your search.';
			$this->_load_view('admin/search_event');
		}
    }	
	
}