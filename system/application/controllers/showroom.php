<?php
    class Showroom extends Admin_controller{
        function Showroom(){
            parent::Admin_controller();
            $this->load->model('Mshowroom');
            $this->load->helper('url');
            $this->load->library('session'); 
        }
        function add_new_images()
        {
            $this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
            $Speaker=1;
            $this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker);         
            $this->_load_view('admin/add_showroom_images');   
        }
        function add_new_images_for_speaker($Speaker='')
        {
            $this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
            $this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker);            
            $this->_load_view('admin/add_showroom_images');   
        }
    }   
?>
