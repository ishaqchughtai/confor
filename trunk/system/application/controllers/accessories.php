<?php
    class Accessories extends Frontend_controller {
        var $blog_sidebar = 'most_post';
        function Accessories()
        {
            parent::Frontend_controller();
            $this->_container = 'container';        
            $this->load->model('Maccessories');        
            $this->load->helper('date');       
        }        
        function show_element($ElementName)
        {   
            $admin_data = is_admin(FALSE);
            $query = $this->Maccessories->get_element($ElementName);  
            if($query->num_rows()==1)
            {
                if ($admin_data == FALSE) 
                {
                    $this->_data['query'] = $query->result_array();
                    $this->_load_view('home/page');               
                }else
                {
                    $this->_data['query'] = $query->result_array();
                    $this->_load_view('admin/page_admin');    
                }
            }else
            {
                redirect('home/index');
            }      
        }
        function get_element($ElementName)
        {
            is_admin();          
            $query = $this->Maccessories->get_element($ElementName);
            $this->_data['query'] = $query->result_array();
            $this->_load_view('admin/add_new_page');
        }    
        function update_element($ElementName)
        {
            is_admin();
            $this->form_validation->set_rules('ElementContent','Element Content','required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            $query = $this->Maccessories->get_element($ElementName);
            $this->_data['query'] = $query->result_array();                                          
            $ElementContent=$this->input->post('ElementContent');
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('admin/add_new_page'); 
            }
            else
            {
                if($this->Maccessories->update_element($ElementName,$ElementContent)==TRUE)
                {
                    redirect(site_url('accessories/show_element/'.$ElementName));  
                }else
                {
                    echo 'asdasd';
                }
            }        
        }

    } 
?>
