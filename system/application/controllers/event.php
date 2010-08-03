<?php

class Event extends Admin_controller {
  var $event_per_page = 10;
  function Event()
  {
    parent::Admin_controller();
    $this->_container = 'container';		
    $this->load->model('MEvent');		
    $this->load->helper('date');		
    $this->load->model('Mshopproduct','mshopproduct'); 		
    $this->_data['adv']['category'] = 'event';
  }	

  //function _before_render() 
  //  {
  //    $header['page'] = "admin/header";
  //    $this->_data['header'] = $header;    
  //  }



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
      $this->form_validation->set_message('keyword_check', __("CF_the").' %s '.__("CF_field_max")); 
      return FALSE ;           
    }else
    {
      return TRUE ;
    }
  }

  //event list
  function event_list()
  {
    if (is_admin())      
    {
      $lg = $this->uri->segment(3);  
      if (! $lg) return;
      if (lang_name_by_short_key($lg,TRUE)==FALSE)
      {
        $this->_message('admin', 'Invaild language', 'error',site_url("event/event_list").'/'.$this->_data['lang']);
      }

      $this->_data['path'][] = array(
      'name' => __("CF_admin_event_list"),
      'link' => '#'
      );

      $this->_data['lg'] = $lg;
      $per_page = $this->uri->segment(4);
      $page_offset = $this->uri->segment(5);

      $config['base_url'] = base_url().'index.php/event/event_list/'.$lg.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_event_by_en($lg);            
      $config['per_page']=$per_page;
      $this->_data['lang'];
      $config['uri_segment'] = 5;
      $config += config_pagination_style();
      $this->pagination->initialize($config);
      $this->_data['query'] = $this->MEvent->get_all_event($lg,$per_page, $page_offset);
      $this->_data['pagination'] = $this->pagination->create_links();        
      $this->_load_view('admin/event_view_admin');    
    }
  }

  //get event of admin
  function get_event_admin($id)
  { 
    $query = $this->MEvent->get_data_to_form_admin($id);   
    foreach($query as $row)    
    {
      $lg = $row->lang;
    }
    $this->_data['path'][] = array(
      'name' => __("CF_admin_event_list"),
      'link' => site_url("event/event_list/".$lg.'/'.$this->event_per_page)
      ); 
    
    $this->_data['path'][] = array(
    'name' => __("CF_edit_event"),
    'link' => '#'
    );
    is_admin();
    $this->_data['query'] = $this->MEvent->get_data_to_form_admin($id);
    $this->_load_view('admin/get_event_admin');		
  }	

  //Edit event of admin
  function edit_event_admin($id)
  {   
    is_admin();
    $query = $this->MEvent->get_data_to_form_admin($id);   
    foreach($query as $row)    
    {
      $lg = $row->lang;
    }
    if($this->input->post('btnedit'))
    {
      $this->form_validation->set_rules('speaker_name',strtolower(__("CF_one_speaker")),'required');
      $this->form_validation->set_rules('date',strtolower(__("CF_date")),'required|callback_check_date');
      $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
      $this->form_validation->set_rules('subject',strtolower(__("CF_subject")),'trim|required|max_length[50]');   
      $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
      $this->form_validation->set_rules('description',strtolower(__("CF_des")),'trim|required');
      $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
      if($this->form_validation->run()==FALSE)
      {
        $this->get_event_admin($id);
      }
      else
      {
        $speaker_id = $this->input->post('speaker');
        $title = $this->input->post('title');
        $date = $this->input->post('date');      
        $subject = $this->input->post('subject');      
        $keywords = $this->input->post('keywords');
        $description = $this->input->post('description');
        $status = $this->input->post('status');
        $lg = $this->input->post('lg');
        $data = $this->MEvent->edit_event($id,$speaker_id,$title,$date,$subject,$keywords,$description,$status,$lg);
        $this->_message('event', __("CF_edit_event_suc"), 'success', site_url('event/event_list/'.$lg.'/'.$this->event_per_page));
      }   
    }
  }

  //Delete Event admin
  function delete_event_admin($id)
  {
    $query = $this->MEvent->get_data_to_form_admin($id);   
    foreach($query as $row)    
    {
      $lg = $row->lang;
    }
    is_admin();
    $this->MEvent->delete($id);
    redirect('event/event_list/'.$lg.'/'.$this->event_per_page);    
  }	

  //Add new event of admin
  function add_event()
  {
    is_admin();
    $lg = $this->_data['lang'];
    $this->_data['path'][] = array(
    'name' => __("CF_add_event"),
    'link' => '#'
    );
    $this->_data['lg'] = $lg;
    if($this->input->post('btnsubmit'))
    {
      $this->form_validation->set_rules('speaker_name',strtolower(__("CF_one_speaker")),'required');
      $this->form_validation->set_rules('date',strtolower(__("CF_date")),'required|callback_check_date');
      $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
      $this->form_validation->set_rules('subject',strtolower(__("CF_subject")),'trim|required|max_length[50]');   
      $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
      $this->form_validation->set_rules('description',strtolower(__("CF_des")),'trim|required');
      $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
      if($this->form_validation->run()==FALSE)
      {
        $this->_load_view('admin/add_event_admin');
      }
      else
      {    
        $speaker = $this->input->post('speaker');
        $date = $this->input->post('date');
        $title = $this->input->post('title');
        $subject = $this->input->post('subject');
        $keywords = $this->input->post('keywords');
        $description = $this->input->post('description');
        $status = 1;
        $lg = $this->input->post('lg');
        if($this->MEvent->add_event($speaker,$date,$title,$subject,$keywords,$description,$status,$lg)==TRUE)
        {
          $this->_message('event', __("CF_add_event_suc"), 'success', site_url('event/event_list/'.$this->_data['lang'].'/'.$this->event_per_page));
        }
      }  
    } 
    else
    {
      $this->_load_view('admin/add_event_admin');    
    }   
  }

  //search event of  admin
  function search_event_admin()
  {
    $this->_data['path'][] = array(
    'name' => __("CF_search_event"),
    'link' => '#'
    );
    $keywords = $this->input->post('search_field');

    $keywords = $this->uri->segment(3);
    $per_page = $this->uri->segment(4);
    $offset = $this->uri->segment(5);


    $config['uri_segment'] = 5;
    $config['base_url'] = base_url().'index.php/event/search_event_admin/'.$keywords.'/'.$per_page;
    $config['total_rows'] = $this->MEvent->count_record_by_title($keywords);
    $config['per_page']=$per_page;

    $config += config_pagination_style();
    $this->_data['events'] = $this->MEvent->search_event($keywords,$per_page,$offset); 
    $this->pagination->initialize($config);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('admin/search_event');    
  }

  //search keyword of admin
  function search_keyword_admin($keyword = '')
  {
    //$lg = $this->_data['lang'];
    $lg = $this->uri->segment(4);
    $this->_data['lg'] = $lg;
    $this->_data['path'][] = array(
    'name' => __("CF_admin_event_list"),
    'link' => site_url("event/event_list/".$lg.'/'.$this->event_per_page)
    );
    $this->_data['path'][] = array(
    'name' => __("CF_search_event"),
    'link' => '#'
    );

    $keywords = $this->uri->segment(3);
    
    $per_page = $this->uri->segment(5);
    $offset = $this->uri->segment(6);


    $config['uri_segment'] = 6;
    $config['base_url'] = base_url().'index.php/event/search_keyword_admin/'.$keywords.'/'.$lg.'/'.$per_page;
    $config['total_rows'] = $this->MEvent->count_record_by_keywords($keywords,$lg);
    $config['per_page']=$per_page;

    $config += config_pagination_style();
    $this->_data['events'] = $this->MEvent->search_event_by_keyword($keywords,$lg,$per_page,$offset); 
    $this->pagination->initialize($config);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('admin/search_event');    
  }
  
  function check_date($date) 
  { 
    if($date < date('Y/m/d'))
    {
      $this->form_validation->set_message('check_date', __("CF_check_date"));
      return FALSE;
    }
    else 
    {
      return TRUE;
    }
  }

}