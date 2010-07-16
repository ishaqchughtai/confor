<?php
  class Office_frontend extends Frontend_controller
  {
    var $office_per_page = 5;
    function Office_frontend()
    {
      parent::Frontend_controller();
      $this->_container = 'container';    
      $this->load->model('Mcoffice');    
      $this->load->helper('date');    
      $this->load->model('Mshopproduct','mshopproduct');    
      $this->_data['adv']['category'] = 'event';
    }
    
    function _before_render() 
    {
      $side_bar['page'] = "event/sidebar";    
      $side_bar['popular_video'] = $this->Mhome->get_popular_video();
      $side_bar['recent_video'] = $this->Mhome->get_recent_video();  
      $side_bar['categories'] = $this->Mhome->get_category($this->_data['lang']);
      $side_bar['dates'] = $this->Mhome->get_dates(); 
      $side_bar['top_speaker'] = $this->Mhome->get_top_speaker();     
      $this->_data['side_bar'] = $side_bar;    
    }
    
    function office()
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $per_page = $this->uri->segment(3);
      $offset = $this->uri->segment(4);

      $this->_data['path'][] = array(
      'name' => __("CF_conference_office"),
      'link' => "#"
      );

      $config['uri_segment'] = 4;
      $config['base_url'] = base_url().'index.php/office_frontend/office/'.$per_page;
      $config['total_rows'] = $this->Mcoffice->count_office_by_lang($lg);
      //echo $config['total_rows'];
      //      return;
      $config['per_page']=$per_page;

      $config['full_tag_open'] = '<li>';        
      $config['full_tag_close'] = '</li>'; 
      $config['next_link'] = __("CF_next");
      $config['prev_link'] = __("CF_previous");
      $config['last_link'] = __("CF_last");
      $config['first_link'] = __("CF_first");

      $this->pagination->initialize($config);
      $this->_data['query'] = $this->Mcoffice->get_all_office($lg,$per_page,$offset);

      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('home/office_view');
    }
    
    //Content's office of user
    function office_content($id='') 
    {

      $this->_data['path'][] = array(
      'name' => __("CF_conference_office"),
      'link' => site_url("office_frontend/office/".$this->office_per_page)
      );

      $this->_data['path'][] = array(
      'name' => __("CF_conference_office_content"),
      'link' => '#'
      ); 
      $id = (double)$id;
      if(is_nan($id)==FALSE && $id > 0)
      {
        $this->_data['query'] = $this->Mcoffice->get_office_by_id($id);
        $this->_load_view('home/office_entry_view');  
      }
      else
      {
        redirect(base_url());
      }
    }
  }
  
?>
