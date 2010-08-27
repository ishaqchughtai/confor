<?php
  class Accessories extends Frontend_controller {
    var $blog_sidebar = 'most_post';
    function Accessories()
    {
      parent::Frontend_controller();
      $this->_container = 'container';        
      $this->load->model('Maccessories');
      $this->load->model('Mmetadata');        
      $this->load->helper('date');
      $this->load->helper('xemmex');
      $this->load->model('Mshopproduct','mshopproduct');           
    }        
    function show_element($Code='')
    {  
      if(!$Code)
      {
        redirect('home/index');
      }else
      {
          $x=out_static_page($Code,FALSE);
          $this->_data['path'][] = array(
          'name' => $x['name'],
          'link' => '#'
          );
          $query = $this->Maccessories->get_element($x['name']); 
        if($query->num_rows()==1)
        {
           
          $this->_data['query'] = $query->result_array();
          $type_source = $this->uri->segment(3);
          $meta = $this->Mmetadata->out_meta($type_source,1);
          if ($meta!=FALSE) 
          {
            $title = $meta->title.' - confor.tv';
            $this->_data['meta'] = $meta;  
          }
          else
          {
             $title=$x['name'];
          }
          $this->_data['page_title'] = $title;
          $this->_data['content'] = $x['body'];
          $this->_load_view('home/page');               
        }else
        {
          redirect('home/index');
        }
      }         
    }
  } 
?>
