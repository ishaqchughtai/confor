<?php
  class Category extends Frontend_controller
  {
    function Category()
    {
      parent::Frontend_controller();
      $this->load->model('MCategory');
      $this->_container = 'container';    
      $this->load->helper('date');    
      $this->load->model('Remember_me');
    }



    function get_category($id)
    {
      $this->_data['video_cate'] = $this->MCategory->get_video_by_category($id);
      $this->_load_view('home/get_video_by_category');
    }
  }
?>