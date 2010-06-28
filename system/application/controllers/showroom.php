<?php
    class Showroom extends Controller{
        function Showroom(){
            parent::Controller();
            $this->load->model('Mshowroom');
            $this->load->helper('url');
            $this->load->library('session'); 
        }
        function add_new_images()
        {
            
        }
    }   
?>
