<?php
class Training_frontend extends Frontend_controller {
    function Training_frontend()
    {
        parent::Frontend_controller();
        $this->_container = 'container';        
        $this->load->model('Mtraining');        
        $this->load->helper('date');
        $this->load->helper('string');
        $this->load->model('Mshopproduct','mshopproduct');       
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

        $config['full_tag_open'] = '<li>';    
        $config['full_tag_close'] = '</li>';
        $config['next_link'] = __("CF_next");
        $config['prev_link'] = __("CF_previous");
        $config['last_link'] = __("CF_last");
        $config['first_link'] = __("CF_first");
        $config['uri_segment'] = 4;

        $this->pagination->initialize($config);
        $this->_data['query'] = $this->Mtraining->get_all_training($lg,$this->uri->segment(4),$config['per_page']);
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
        $this->_data['page_title'] = $title;         
        $this->_load_view('home/training_entry_view');
    }
}
