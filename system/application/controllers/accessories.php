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
        function show_element($ElementName='')
        {
            if(!$ElementName)
            {
                redirect('home/index');
            }else
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
        }
        function convert_element_name($ElementName='')
        {
            if($ElementName == 'About')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_about_us"),
                'link' => '#'
                );
                $StrElementName = __("CF_about_us");
            }elseif($ElementName == 'How')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_how"),
                'link' => '#'
                );
                $StrElementName = __("CF_how");    
            }elseif($ElementName == 'Rules')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_rules"),
                'link' => '#'
                );
                $StrElementName = __("CF_rules");
            }elseif($ElementName == 'About_fr')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_about_us"),
                'link' => '#'
                );
                $StrElementName = __("CF_about_us");
            }elseif($ElementName == 'How_fr')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_how"),
                'link' => '#'
                );
                $StrElementName = __("CF_how");    
            }elseif($ElementName == 'Rules_fr')
            {
                $this->_data['path'][] = array(
                'name' => __("CF_rules"),
                'link' => '#'
                );
                $StrElementName = __("CF_rules");       
            }else
            {
                $StrElementName = '';
            }
            return $StrElementName;    
        }
    } 
?>
