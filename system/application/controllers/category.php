<?php
  class Category extends Frontend_controller
  {
    function Category()
    {
      parent::Frontend_controller();
      $this->load->model('MCategory');
      $this->_container = 'container';    
      $this->load->helper('date');    
      $this->load->model('Mmetadata');
      //$this->load->model('Remember_me');
      $this->load->model('Mshopproduct','mshopproduct');
    }

    function get_category($id)
    {
      $id = $this->uri->segment(3);      
      $offset = $this->uri->segment(5);

      $per_page = $this->_setting['num_per_page_video'];
      $config['uri_segment'] = 5;
      $config['base_url'] = base_url().'index.php/category/get_category/'.$id.'/'.$per_page;
      $config['total_rows'] = $this->MCategory->count_record($id);
      $config['per_page']=$per_page;
      $config += config_pagination_style();

      $this->_data['video_cate'] = $this->MCategory->get_video_by_category($id,$per_page,$offset); 
      $this->pagination->initialize($config);

      $this->_data['pagination'] = $this->pagination->create_links();

      $query =  $this->MCategory->get_category_by_id($id);
      
      $meta = $this->Mmetadata->out_meta('category',$id);
        if ($meta!=FALSE)
        {
          $title = $meta->title.' - confor.tv';
          $this->_data['meta'] = $meta;
        }
        else
        {
          foreach($query as $row)
          {
            $title = __("CF_cate").' '.$row['Name'].' - confor.tv';
          }
        }
        
      $this->_data['page_title'] = $title;
      $this->_load_view('home/get_video_by_category');
    }
  }
?>