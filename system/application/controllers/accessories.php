<?php
  class Accessories extends Frontend_controller {
    var $blog_sidebar = 'most_post';
    function Accessories()
    {
      parent::Frontend_controller();
      $this->_container = 'container';        
      $this->load->model('Maccessories');        
      $this->load->helper('date');
      $this->load->model('Mshopproduct','mshopproduct');           
    }        
    function show_element($ElementName)
    {   
      $query = $this->Maccessories->get_element($ElementName); 
      if($query->num_rows()==1)
      {
          $this->_data['page_title'] = $this->convert_element_name($ElementName); 
          $this->_data['query'] = $query->result_array();
          $this->_load_view('home/page');               
      }else
      {
        redirect('home/index');
      }      
    }
    function convert_element_name($ElementName)
    {
      if($ElementName == 'about')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_about_us"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'About us';
      }elseif($ElementName == 'how')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_how"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'How it works';    
      }elseif($ElementName == 'rules')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_rules"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'The rules';
      }elseif($ElementName == 'how_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_about_us"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'About us';
      }elseif($ElementName == 'how_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_how"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'How it works';    
      }elseif($ElementName == 'rules_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_rules"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'The rules';       
      }else
      {
        $StrElementName = '';
      }
      return $StrElementName;    
    }
  } 
?>
