<?php
  class Conference_office extends Admin_controller {
    var $blog_sidebar = 'most_post';
    //var $per_page = 2;
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

  }
?>
