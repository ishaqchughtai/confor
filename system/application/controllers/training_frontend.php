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
        $side_bar['page'] = "home/sidebar_training";         
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
        $lg = $this->_data['lang'];
        $meta = $this->Mmetadata->out_static_meta('formation_list',$lg);
        if ($meta!=FALSE) 
        {
            $title = $meta->title.' - confor.tv';
            $this->_data['meta'] = $meta; 
        }
        else
        {
            $title = __("CF_training").' - confor.tv';
        }
        $this->_data['page_title'] = $title;
        $this->_load_view('home/training_view');     
    }
    function training_content($id='',$title='')
    {
        $this->_data['path'][] = array(
        'name' => __("CF_training"),
        'link' => site_url('training_frontend/index').'/'.$this->_data['lang']
        );                 
        $this->_data['path'][] = array(
        'name' => $title,
        'link' => '#'
        );        
        $this->_data['query'] = $this->Mtraining->get_training_by_id($id);
        $query_meta = $this->Mtraining->get_training_by_id($id);
        foreach($query_meta as $row)
        {
            $id = $row['ID'];
            $meta = $this->Mmetadata->out_meta('formation',$id);
            if ($meta!=FALSE) 
            {
                $title1 = $meta->title.' - confor.tv';
                $this->_data['meta'] = $meta;          
            }
            else
            {
                $title1 = $title.' - confor.tv';
            }
        }
        $this->_data['page_title'] = $title1;
        $this->_load_view('home/training_entry_view');  
    }

    function search()
    {
        $lg = $this->_data['lang'];
        $this->_data['lg'] = $lg;
        $this->_data['path'][] = array(
        'name' => __("CF_training"),
        'link' => site_url('training_frontend/index').'/'.$this->_data['lang']
        ); 
        $this->_data['path'][] = array(
        'name' => __("CF_result_search_training"),
        'link' => '#'
        );

        $keywords = $this->uri->segment(3);
        $per_page = 5;
        $offset = $this->uri->segment(5);


        $config['uri_segment'] = 5;
        $config['base_url'] = base_url().'index.php/training_frontend/search/'.$keywords.'/'.$per_page;
        $config['total_rows'] = $this->Mtraining->count_record_trainning($keywords,$lg);
        $config['per_page']=$per_page;

        $config += config_pagination_style();
        $this->_data['training'] = $this->Mtraining->search_training_by_alphabet($keywords,$lg,$per_page,$offset); 
        $this->pagination->initialize($config);
        $this->_data['pagination'] = $this->pagination->create_links();
        $this->_data['keywords'] = $keywords;
        $this->_data['page_title']=__("CF_Search_results").'"'.$keywords.'"'.' - '.__("CF_training").' - '.'Confor.tv';
        if($this->_data['training'])
        {
            $this->_data['training_search']  =TRUE;
        }else
        {
            $this->_data['training_search']  =FALSE;    
        } 
        $this->_load_view('home/search_training');
    }

    function search_training()
    {
        $lg = $this->_data['lang'];
        $this->_data['lg'] = $lg;
        $this->_data['path'][] = array(
        'name' => __("CF_training"),
        'link' => site_url('training_frontend/index').'/'.$this->_data['lang']
        ); 
        $this->_data['path'][] = array(
        'name' => __("CF_result_search_training"),
        'link' => '#'
        );

        $keywords = $this->uri->segment(3);
        $per_page = $this->uri->segment(4);
        $offset = $this->uri->segment(5);


        $config['uri_segment'] = 5;
        $config['base_url'] = base_url().'index.php/training_frontend/search_training/'.$keywords.'/'.$per_page;
        $config['total_rows'] = $this->Mtraining->count_record_by_title($keywords,$lg);
        $config['per_page']=$per_page;

        $config += config_pagination_style();
        $this->pagination->initialize($config);
        $this->_data['pagination'] = $this->pagination->create_links();
        $this->_data['keywords'] = $keywords;
        $this->_data['page_title']=__("CF_Search_results").'"'.$keywords.'"'.' - '.__("CF_training").' - '.'Confor.tv';
        $this->_data['training'] = $this->Mtraining->search_training($keywords,$lg,$per_page,$offset);
        if($keywords=='5')
        {
            $this->_data['page_title']=__("CF_mess_no_search").' - '.'Confor.tv'; 
            $this->_data['training_search']  =FALSE;  
            $this->_load_view('home/search_training');
            return;
        }
        if($this->_data['training'])
        {
            $this->_data['training_search']  =TRUE;
        }else
        {
            $this->_data['training_search']  =FALSE;    
        } 
        $this->_load_view('home/search_training');    
    }
}
