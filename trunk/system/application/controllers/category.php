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
      $this->load->model('Mshopproduct','mshopproduct');
    }

    function get_category($id)
    {
      $id = $this->uri->segment(3);
      $per_page = $this->uri->segment(4);
      $offset = $this->uri->segment(5);


      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/category/get_category/'.$id.'/'.$per_page;
      $config['total_rows'] = $this->MCategory->count_record($id);
      $config['per_page']=$per_page;

      $config['full_tag_open'] = '<li>';        
      $config['full_tag_close'] = '</li>'; 
      $config['next_link'] = 'Next >';
      $config['prev_link'] = '< Previous';
      $config['last_link'] = 'Last >>';
      $config['first_link'] = '<< First';
      $this->_data['video_cate'] = $this->MCategory->get_video_by_category($id,$per_page,$offset); 
      $this->pagination->initialize($config);
      $this->_data['pagination'] = $this->pagination->create_links();
      $this->_load_view('home/get_video_by_category');
    }
  }
?>