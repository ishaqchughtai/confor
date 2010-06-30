<?php
    class Conference_office extends Frontend_controller {
        var $blog_sidebar = 'most_post';
        function Conference_office()
        {
            parent::Frontend_controller();
            $this->_container = 'container';               
            $this->load->helper('date');
            $this->load->helper('string');
            $this->load->model('Mcoffice');       
            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => site_url("/conference_office")
            );    
        }    

        function index()
        {              
            $this->_data['page_title'] = 'Confor.ca - homepage';
            $this->_data['video_path'] = $this->Mhome->get_top_viewed_video();        
            $this->_data['page_title'] = 'Video Conference';

            $config['base_url'] = base_url().'index.php/conference_office/index/';
            $config['total_rows'] = $this->db->count_all('videos');
            $config['per_page']='3';

            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = 'Next >';
            $config['prev_link'] = '< Previous';
            $config['last_link'] = 'Last >>';
            $config['first_link'] = '<< First';

            $this->pagination->initialize($config);
            $this->_data['conference_list'] = $this->Mcoffice->list_conference_office($this->uri->segment(3),$config['per_page']);
            $this->_data['pagination'] = $this->pagination->create_links();                
            
            $this->_load_view('conference_office/conference'); 
        }
    }
?>
