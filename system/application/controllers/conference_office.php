<?php
    class Conference_office extends Frontend_controller {
        var $blog_sidebar = 'most_post';
        var $per_page = 2;
        function Conference_office()
        {
            parent::Frontend_controller();
            $this->_container = 'container';               
            $this->load->helper('date');
            $this->load->helper('string');
            $this->load->model('Mcoffice');
            $this->load->model('Mshopproduct','mshopproduct');           
            $this->_data['path'][] = array(
            'name' => __("CF_conference"),
            'link' => site_url("/conference_office")
            );    
        }    

        function index()
        {              
            $this->_data['page_title'] = 'Conference Office';                
            $this->_load_view('conference_office/conference_office_view'); 
        }
    }
?>
