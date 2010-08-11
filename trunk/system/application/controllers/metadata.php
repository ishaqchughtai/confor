<?php
  class Metadata extends Admin_controller {
    var $meta_per_page = 10;
    function Metadata()
    {
      parent::Admin_controller();
      $this->_container = 'container';    
      $this->load->model('MMetadata');    
      $this->load->helper('date');    
      $this->load->model('Mshopproduct','mshopproduct');     
      $this->_data['adv']['category'] = 'event';
    }

    function get_metadata()
    {
      is_admin(); 
      $type_resource = $this->uri->segment(3);
      $id_resource = $this->uri->segment(4);
      $this->_data['type_sources'] = $type_resource;
      $this->_data['id_sources'] = $id_resource;
      $this->_data['meta'] = $this->MMetadata->get_to_form($type_resource,$id_resource);
      $this->_load_view('admin/get_metadata');    
    }


    //edit metadata
    function edit($id)
    {
      is_admin();
      $title = $this->input->post('title');      
      $keywords = $this->input->post('keywords');
      $description = $this->input->post('description');
      $author = $this->input->post('author');
      $data = $this->MMetadata->edit_meta($id,$title,$keywords,$description,$author);
      $this->_message('metadata', __("CF_edit_meta_suc"), 'success', site_url('/admin'));    
    }


    //add new metadata
    function add($type_resource,$id_resource)
    {

      is_admin();
      $type_resource = $this->uri->segment(3);
      $id_resource = $this->uri->segment(4);
      $this->_data['type_sources'] = $type_resource;
      $this->_data['id_sources'] = $id_resource;
      if($this->input->post('btnsubmit'))
      {
        $title = $this->input->post('title');      
        $keywords = $this->input->post('keywords');
        $description = $this->input->post('description');
        $author = $this->input->post('author');
        if($this->MMetadata->add_meta($title,$keywords,$description,$author,$type_resource,$id_resource)==TRUE)
        {
          $this->_message('metadata', __("CF_add_meta_suc"), 'success', site_url('/admin'));    
        }
      }
      else
      {
        $this->_load_view('admin/add_metadata');    
      }          
    }

    function add_static($type_resource,$lg)
    {

      is_admin();
      $type_resource = $this->uri->segment(3);
      $id_resource = $this->uri->segment(4);
      $this->_data['type_sources'] = $type_resource;
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg;
      if($this->input->post('btnsubmit'))
      {
        $title = $this->input->post('title');
        $keywords = $this->input->post('keywords');
        $description = $this->input->post('description');
        $author = $this->input->post('author');
        $lg = $this->input->post('lg');
        if($this->MMetadata->add_static_meta($title,$keywords,$description,$author,$type_resource,$lg)==TRUE)
        {
          $this->_message('metadata', __("CF_add_meta_suc"), 'success', site_url('/admin'));    
        }
      }
      else
      {
        $this->_load_view('admin/add_static_metadata');    
      }          
    }

    function get_metadata_static()
    {

      is_admin();
      $lg = $this->_data['lang'];
      $this->_data['lg'] = $lg; 
      $type_resource = $this->uri->segment(3);
      $lg = $this->uri->segment(4);
      $this->_data['type_sources'] = $type_resource;
      $this->_data['meta'] = $this->MMetadata->get_static_to_form($type_resource,$lg);
      $this->_load_view('admin/get_static_metadata');    
    }
    
    function edit_static($id)
    {
      is_admin();
      $title = $this->input->post('title');      
      $keywords = $this->input->post('keywords');
      $description = $this->input->post('description');
      $author = $this->input->post('author');
      $lg = $this->input->post('lg');
      $data = $this->MMetadata->edit_static_meta($id,$title,$keywords,$description,$author,$lg);
      $this->_message('metadata', __("CF_edit_meta_suc"), 'success', site_url('/admin'));    
    }
  }
?>
