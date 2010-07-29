<?php
  class Manage_event extends Speaker_controller
  {
    var $event_per_page = 10;
    function Manage_event()  {
      parent::Speaker_controller();
      $this->load->helper(array('date', 'JSON'));  
      $this->load->model('Mshopproduct','mshopproduct');
      $this->load->model('MEvent');        
    }

    //List envent of speaker
    function your_event()  
    {

      $userData = is_speaker();
      $id = $userData['speaker_id'];
      $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
      $this->_data['header']['page'] = '/speaker/header_panel';
      $lg = $this->uri->segment(3);  
      if (! $lg) return;
      if (lang_name_by_short_key($lg,TRUE)==FALSE)
      {
        $this->_message('speaker', 'Invaild language', 'error',site_url("manage_event/your_event").'/'.$this->_data['lang']);
      }
      $this->_data['path'][] = array(
      'name' => __("CF_yr_event"),
      'link' => '#'
      );
      $this->_data['lg'] = $lg; 
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);


      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/manage_event/your_event/'.$lg.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_event_by_speaker($id,$lg);
      $config['per_page']=$per_page;

      $config += config_pagination_style();
      $this->_data['your_event'] = $this->MEvent->list_event_by_speaker($id,$lg,$per_page,$offset); 
      $this->pagination->initialize($config);
      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('speaker/your_event');
    }

    //Add new event of speaker
    function add()
    {
      $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
      $this->_data['header']['page'] = '/speaker/header_panel';
      $lg = $this->_data['lang'];
      $this->_data['path'][] = array(
      'name' => __("CF_add_event"),
      'link' => "#"
      );    
      $this->_data['lg'] = $lg;
	  
      //$userData = is_speaker();
	  $userData = check_membership();
	  
      $id = $userData['speaker_id'];
      if($this->input->post('btnsubmit'))
      {
        $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('subject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
        $this->form_validation->set_rules('description',strtolower(__("CF_des")),'trim|required');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
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
          $description = $this->input->post('description');
          $keywords = $this->input->post('keywords');
          $status = 0;
          if($this->_data['lang'] == 'en')
          {
            $lg = 'en';
          }
          else if($this->_data['lang'] == 'fr')
            {
              $lg = 'fr';
            }
            else
            {
              $lg = 'en';
          }
          if($this->MEvent->add_event($speaker,$date,$title,$subject,$keywords,$description,$status,$lg)==TRUE)
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
      $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
      $this->_data['header']['page'] = '/speaker/header_panel';
      $query = $this->MEvent->get_data_to_form_admin($id);   
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      $this->_data['path'][] = array(
      'name' => __("CF_yr_event"),
      'link' => site_url("manage_event/your_event/".$lg."/".$this->event_per_page)
      );

      $this->_data['path'][] = array(
      'name' => __("CF_edit_event"),
      'link' => '#'
      );

      $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];    

      if ($speaker_id != $author) redirect('/');

      $this->_data['query'] = $this->MEvent->get_data_to_form($id);
      $this->_load_view('event/edit_event');
    }

    //Edit Event of speaker
    function edit_event($author, $id)
    {
      $query = $this->MEvent->get_data_to_form_admin($id);   
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      $this->_data['lg'] = $lg;   
      $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];   
      if ($speaker_id != $author) redirect('/');

      if($this->input->post('btnedit'))
      {
        $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('subject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
        $this->form_validation->set_rules('description',strtolower(__("CF_des")),'trim|required');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
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
          redirect('manage_event/your_event/'.$lg.'/'.$this->event_per_page);
        }   
      }
    }

    //delete event
    function delete_event($author, $id)
    {
      $query = $this->MEvent->get_data_to_form_admin($id);   
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      $this->_data['lg'] = $lg;
      $userData = is_speaker();
      $speaker_id= $userData['speaker_id'];   
      if ($speaker_id != $author) redirect('/');  
      $this->MEvent->delete($id);
      redirect('manage_event/your_event/'.$lg.'/'.$this->event_per_page);    
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
        $this->form_validation->set_message('keyword_check', __("CF_the").' %s '.__("CF_field_max")); 
        return FALSE ;           
      }else
      {
        return TRUE ;
      }
    }
  }
?>
