<?php
class Training_frontend extends Frontend_controller {
  function Training_frontend()
  {
    parent::Frontend_controller();
    $this->_container = 'container';        
    $this->load->model('Mtraining');
    $this->load->model('Mmetadata');        
    $this->load->helper('date');
    $this->load->helper('string');
    $this->load->model('Mshopproduct','mshopproduct');       
  }

  function _before_render() 
  {
    $side_bar['page'] = "home/sidebar_office";         
    $this->_data['side_bar'] = $side_bar;    
  }

  function index()
  {
    $this->show();       
  }

  function show()
  {
    //$lg = $this->uri->segment(3);    
    $lg =$this->_data['lang'];
    if (! $lg) return;
    if (lang_name_by_short_key($lg,TRUE)==FALSE)
    {
      $this->_message('training', 'Invaild language', 'error',site_url("training_frontend/index").'/'.$this->_data['lang']);
    }   

    $this->_data['path'][] = array(
    'name' => __("CF_training"),
    'link' => '#'
    ); 

    $this->_data['lg'] = $lg;
    $config['base_url'] = base_url().'index.php/training_frontend/index/'.$lg;
    $config['total_rows'] = $this->Mtraining->count_record($lg);
    $config['per_page']=5;

    $config += config_pagination_style();
    $config['uri_segment'] = 4;

    $this->pagination->initialize($config);
    //$this->_data['query'] = $this->Mtraining->get_all_training($lg,$this->uri->segment(4),$config['per_page']);
    $this->_data['query'] = $this->Mtraining->get_all_by_order($lg,$this->uri->segment(4),$config['per_page']);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('home/training_view');     
  }
  function training_content($title='')
  {
    $this->_data['path'][] = array(
    'name' => __("CF_training"),
    'link' => site_url('training_frontend/index').'/'.$this->_data['lang']
    );                 
    $this->_data['path'][] = array(
    'name' => $title,
    'link' => '#'
    );        
    $this->_data['query'] = $this->Mtraining->get_training_by_title($title);
    $query_meta = $this->Mtraining->get_training_by_title($title);
    foreach($query_meta as $row)
    {
      $id = $row['ID'];
      $meta = $this->Mmetadata->out_meta('formation',$id);
      if ($meta!=FALSE) $this->_data['meta'] = $meta;         
      $this->_load_view('home/training_entry_view');
    }
    $this->_data['page_title'] = $title;  
  }
}
