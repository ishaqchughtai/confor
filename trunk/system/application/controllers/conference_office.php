<?php
  class Conference_office extends Admin_controller {
    var $office_per_page = 10;
    function Conference_office()
    {
      parent::Admin_controller();
      $this->_container = 'container';               
      $this->load->helper('date');
      $this->load->helper('string');
      $this->load->model('Mcoffice');
      $this->load->model('Mshopproduct','mshopproduct');
      ;    
    }    

    //function index()
    //    {              
    //      $this->_data['page_title'] = 'Conference Office';                
    //      $this->_load_view('conference_office/conference_office_view'); 
    //    }

    function get_all()
    {
      if (is_admin())      
      {
        $lg = $this->uri->segment(3);  
        if (! $lg) return;
        if (lang_name_by_short_key($lg,TRUE)==FALSE)
        {
          $this->_message('admin', 'Invaild language', 'error',site_url("conference_office/get_all").'/'.$this->_data['lang']);
        }

        $this->_data['path'][] = array(
        'name' => __("CF_conference_office"),
        'link' => '#'
        );
        //echo 'abc';
        $this->_data['lg'] = $lg;
        $per_page = $this->uri->segment(4);
        $page_offset = $this->uri->segment(5);

        $config['base_url'] = base_url().'index.php/conference_office/get_all/'.$lg.'/'.$per_page;
        $config['total_rows'] = $this->Mcoffice->count_office_by_lang($lg);            
        $config['per_page']=$per_page;
        $this->_data['lang'];
        $config['uri_segment'] = 5;
        $config['full_tag_open'] = '<li>';        
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = __("CF_next");
        $config['prev_link'] = __("CF_previous");
        $config['last_link'] = __("CF_last");
        $config['first_link'] = __("CF_first");
        $this->pagination->initialize($config);
        $this->_data['query'] = $this->Mcoffice->get_all_office($lg,$per_page, $page_offset);
        $this->_data['pagination'] = $this->pagination->create_links();        
        $this->_load_view('admin/office_view_admin');    
      } 
    }

    //add new conference office
    function add()
    {
      is_admin();
      $lg = $this->_data['lang'];
      $this->_data['path'][] = array(
      'name' => __("CF_list_ar"),
      'link' => '#'
      );
      $this->_data['lg'] = $lg;
      if($this->input->post('btnsubmit'))
      {
        $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
          $this->_load_view('admin/add_conference_office');
        }
        else
        {    
          $date = date('Y-m-d');
          $title = $this->input->post('title');
          $content = $this->input->post('content');
          $lg = $this->input->post('lg');
          if($this->Mcoffice->add_conference_office($date,$title,$content,$lg)==TRUE)
          {
            redirect('conference_office/get_all/'.$this->_data['lang'].'/'.$this->office_per_page);
          }
        }  
      } 
      else
      {
        $this->_load_view('admin/add_conference_office');    
      }   
    }

    //get office admin
    function get_office_admin($id)
    { 
      is_admin();
      $query = $this->Mcoffice->get_data_to_form($id);   
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      $this->_data['path'][] = array(
      'name' => __("CF_list_ar"),
      'link' => site_url("conference_office/get_all/".$lg.'/'.$this->office_per_page)
      ); 

      $this->_data['path'][] = array(
      'name' => __("CF_edit_ar"),
      'link' => '#'
      );      
      $this->_data['query'] = $this->Mcoffice->get_data_to_form($id);
      $this->_load_view('admin/get_office_admin');    
    }


    function edit($id)
    {   
      is_admin();
      $query = $this->Mcoffice->get_data_to_form($id);   
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      if($this->input->post('btnsubmit'))
      {
        $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
        $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
          $this->get_office_admin($id);
        }
        else
        {
          $title = $this->input->post('title');
          $content = $this->input->post('content');
          $lg = $this->input->post('lg');
          $data = $this->Mcoffice->edit_office($id,$title,$content,$lg);
          redirect('conference_office/get_all/'.$lg.'/'.$this->office_per_page);
        }   
      }
    }

    //Delete office admin
    function delete($id)
    {
      $query = $this->Mcoffice->get_data_to_form($id);
      foreach($query as $row)    
      {
        $lg = $row->lang;
      }
      is_admin();
      $this->Mcoffice->delete($id);
      redirect('conference_office/get_all/'.$lg.'/'.$this->office_per_page);    
    }

  }
?>
