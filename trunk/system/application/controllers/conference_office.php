<?php
    class Conference_office extends Frontend_controller {
        var $blog_sidebar = 'most_post';
        function Conference_office()
        {
            parent::Frontend_controller();
            $this->_container = 'container';               
            $this->load->helper('date');
            $this->load->helper('string');       
            $this->_data['path'][] = array(
            'name' => 'conference_office',
            'link' => site_url("/conference_office")
            );    
        }    

        function index()
        {              
            $this->_data['page_title'] = 'Confor.ca - homepage';
            $this->_data['video_path'] = $this->Mhome->get_top_viewed_video();              
            $config['base_url'] = base_url();
            $this->_data['page_title'] = 'Video Conference';
            $this->_load_view('conference_office/conference'); 
        }        
    }
?>
