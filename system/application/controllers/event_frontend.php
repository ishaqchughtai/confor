<?php

  class Event_frontend extends Frontend_controller
  {
    var $event_per_page = 5; 
    function Event_frontend()
    {
      parent::Frontend_controller();
      $this->_container = 'container';    
      $this->load->model('MEvent');    
      $this->load->helper('date');    
      $this->load->model('Mshopproduct','mshopproduct');    
      $this->_data['adv']['category'] = 'event';
      $this->load->model('Mmetadata');
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

    function show_event()
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $date = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);

      $this->_data['path'][] = array(
      'name' => __("CF_event"),
      'link' => "#"
      );

      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/show_event/'.'/'.$date.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_record_by_date($date,$lg);
      //echo $config['total_rows'];
      //      return;
      $config['per_page']=$per_page;

      $config += config_pagination_style();

      $this->pagination->initialize($config);
      $this->_data['events'] = $this->MEvent->get_event_by_date($lg,$date,$per_page,$offset);

      $this->_data['pagination'] = $this->pagination->create_links();

      $this->_load_view('event/show_event');
    }

    //Content's event of user
    function event_content($id='') 
    {

      $this->_data['path'][] = array(
      'name' => __("CF_event"),
      'link' => site_url("event_frontend/show_event/".date('Y-m-d').'/'.$this->event_per_page)
      );

      $this->_data['path'][] = array(
      'name' => __("CF_event_content"),
      'link' => '#'
      ); 
      $id = (double)$id;
      if(is_nan($id)==FALSE && $id > 0)
      {
        $this->_data['query'] = $this->MEvent->get_event_by_id($id);
        $meta = $this->Mmetadata->out_meta('event',$id);
        if ($meta!=FALSE) $this->_data['meta'] = $meta;
        $this->_load_view('event/event_content');  
      }
      else
      {
        redirect(base_url());
      }
    }

    //Search Event of speaker
    function search_event()
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $this->_data['path'][] = array(
      'name' => __("CF_search_event"),
      'link' => '#'
      );
      $keywords = $this->input->post('search_field');

      $keywords = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);


      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/search_event/'.$keywords.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_record_by_title($keywords,$lg);
      $config['per_page']=$per_page;

      $config += config_pagination_style();
      $this->_data['events'] = $this->MEvent->search_event($keywords,$lg,$per_page,$offset); 
      $this->pagination->initialize($config);
      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('event/search_event');    
    }

    //Search keyword of speaker
    function search_keyword($keyword = '')
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $this->_data['path'][] = array(
      'name' => __("CF_event"),
      'link' => site_url("event_frontend/show_event/".date('Y-m-d')."/5")
      );
      $this->_data['path'][] = array(
      'name' => __("CF_search_event"),
      'link' => '#'
      );

      $keywords = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);


      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/search_keyword/'.$keywords.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_record_by_keywords($keywords,$lg);
      $config['per_page']=$per_page;

      $config += config_pagination_style();
      $this->_data['events'] = $this->MEvent->search_event_by_keyword($keywords,$lg,$per_page,$offset); 
      $this->pagination->initialize($config);
      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('event/search_event');    
    }

    function today_event()
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $date = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);

      $this->_data['path'][] = array(
      'name' => __("CF_event"),
      'link' => "#"
      );

      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/today_event/'.'/'.$date.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_record_by_date($date,$lg);
      //echo $config['total_rows'];
      //      return;
      $config['per_page']=$per_page;

      $config += config_pagination_style();

      $this->pagination->initialize($config);
      $this->_data['events'] = $this->MEvent->get_event_by_date($lg,$date,$per_page,$offset);

      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('event/today_event');  
    }

    function week_event()  
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $week = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);

      $this->_data['path'][] = array(
      'name' => __("CF_week_events"),
      'link' => "#"
      );

      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/week_event/'.'/'.$week.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_event_by_week($week,$lg);
      $config['per_page']=$per_page;
      //echo  $config['total_rows'];
      //      return; 
      $config += config_pagination_style();
      $this->pagination->initialize($config);
      $this->_data['week_events'] = $this->MEvent->get_event_by_week($lg,$week,$per_page,$offset);

      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('event/week_event');
    }

    function month_event()
    {
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      $month = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);

      $this->_data['path'][] = array(
      'name' => __("CF_month_events"),
      'link' => "#"
      );

      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/event_frontend/month_event/'.'/'.$month.'/'.$per_page;
      $config['total_rows'] = $this->MEvent->count_event_by_month($month,$lg);
      $config['per_page']=$per_page;

      $config += config_pagination_style();

      $this->pagination->initialize($config);
      $this->_data['month_events'] = $this->MEvent->get_event_by_month($lg,$month,$per_page,$offset);

      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('event/month_event');
    }
  }
?>
