<?php
    class Conference_office extends Admin_controller {
        var $office_per_page = 4;
        function Conference_office()
        {
            parent::Admin_controller();
            $this->_container = 'container';               
            $this->load->helper('date');
            $this->load->helper('string');
            $this->load->model('Mcoffice');
            $this->load->model('Mshopproduct','mshopproduct');
            $this->load->library('image_upload_lib');
            $this->image_upload_lib->ajax_link = site_url('blog/do_upload_ajax');   
        }    

        function index()
        {              
            $this->list_all();
        }
        function do_upload_ajax()
        {
            if (! is_admin(FALSE)) 
            {
                echo '0';
                return;
            }
            $this->image_upload_lib->init();
            $this->image_upload_lib->do_upload_ajax();
        }
        function get_all()
        {
            if (is_admin())      
            {
                $lg = $this->uri->segment(3);  
                if (! $lg) return;
                if (lang_name_by_short_key($lg,TRUE)==FALSE)
                {
                    $this->_message('admin', 'Invaild language', 'error',site_url("conference_office/get_all").'/'.$this->_data['lang']);
                }

                $this->_data['path'][] = array(
                'name' => __("CF_conference_office"),
                'link' => '#'
                );
                //echo 'abc';
                $this->_data['lg'] = $lg;
                $per_page = $this->uri->segment(4);
                $page_offset = $this->uri->segment(5);

                $config['base_url'] = base_url().'index.php/conference_office/get_all/'.$lg.'/'.$per_page;
                $config['total_rows'] = $this->Mcoffice->count_office_by_lang($lg);            
                $config['per_page']=$per_page;
                $this->_data['lang'];
                $config['uri_segment'] = 5;
                $config += config_pagination_style();
                $this->pagination->initialize($config);
                $this->_data['query'] = $this->Mcoffice->get_all_office($lg,$per_page, $page_offset);
                $this->_data['pagination'] = $this->pagination->create_links();        
                $this->_load_view('admin/office_view_admin');    
            } 
        }

        //add new conference office
        function add()
        {
            is_admin();
            $lg = $this->_data['lang'];
            $this->_data['path'][] = array(
            'name' => __("CF_list_ar"),
            'link' => '#'
            );
            $this->_data['lg'] = $lg;
            $this->image_upload_lib->init(); 
            if($this->input->post('btnsubmit'))
            {
                $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
                $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('admin/add_conference_office');
                }
                else
                {    
                    $date = date('Y-m-d');
                    $title = $this->input->post('title');
                    $content = $this->input->post('content');
                    $lg = $this->input->post('lg');
                    $this->_data['uname'] = $this->input->post('uname');
                    $query = $this->Mcoffice->get_no($lg);
                    $query_count_no = $this->Mcoffice->count_no($lg);
                    if($query_count_no->num_rows()>0)                   
                    {
                        $query = $this->Mcoffice->get_no($lg);
                        foreach($query as $row)
                        {
                            $no = $row->max_no;
                        }
                        $no_temp=$no+1;    
                    }else
                    {
                        $no_temp=1;        
                    }
                    if(!$this->_data['uname']) 
                        $this->_data['uname']='noimage.gif';
                    if($this->Mcoffice->add_conference_office($date,$title,$content,$lg,$this->_data['uname'],$no_temp)==TRUE)
                    {
                        $this->_message('conference_office', __("CF_addarticle_success"), 'success', site_url('conference_office/list_all/'.$this->_data['lang']));
                    }
                }  
            } 
            else
            {
                $this->_load_view('admin/add_conference_office');    
            }   
        }

        //get office admin
        function get_office_admin($id)
        { 
            is_admin();
            $query = $this->Mcoffice->get_data_to_form($id);   
            $this->image_upload_lib->init(); 
            foreach($query as $row)    
            {
                $lg = $row->lang;
            }
            $this->_data['path'][] = array(
            'name' => __("CF_list_ar"),
            'link' => site_url("conference_office/list_all/".$lg.'/'.$this->office_per_page)
            ); 

            $this->_data['path'][] = array(
            'name' => __("CF_edit_ar"),
            'link' => '#'
            );      
            $this->_data['query'] = $this->Mcoffice->get_data_to_form($id);
            $this->_load_view('admin/get_office_admin');    
        }


        function edit($id)
        {   
            is_admin();
            $query = $this->Mcoffice->get_data_to_form($id);   
            foreach($query as $row)    
            {
                $lg = $row->lang;
            }

            if($this->input->post('btnsubmit'))
            {
                $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
                $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
                if($this->form_validation->run()==FALSE)
                {
                    $this->get_office_admin($id);
                }
                else
                {
                    $title = $this->input->post('title');
                    $content = $this->input->post('content');
                    $edit_image=$this->input->post('edit_image'); 
                    $this->_data['uname'] = $this->input->post('uname');
                    if (strlen($this->_data['uname'])>1)
                    {
                        $query_search= $this->Mcoffice->count_record_image($id);
                        if($query_search->num_rows()>0)
                        {
                            $data = $this->Mcoffice->edit_office($id,$title,$content,$this->_data['uname']);
                            $this->_message('conference_office', __("CF_editarticle_success"), 'success', site_url('conference_office/list_all/'.$lg));                            
                        }else
                        {
                            $this->image_upload_lib->remove_image_from_db($id,'ID','Image','tbloffice');                    
                            $data = $this->Mcoffice->edit_office($id,$title,$content,$this->_data['uname']);
                            $this->_message('conference_office', __("CF_editarticle_success"), 'success', site_url('conference_office/list_all/'.$lg));

                        }
                    }else
                    {
                        $data = $this->Mcoffice->edit_office($id,$title,$content,$edit_image);
                        $this->_message('conference_office', __("CF_editarticle_success"), 'success', site_url('conference_office/list_all/'.$lg));

                    }
                }   
            }
        }

        //Delete office admin
        function delete($id)
        {
            $query = $this->Mcoffice->get_data_to_form($id);
            foreach($query as $row)    
            {
                $lg = $row->lang;
            }
            is_admin();
            $this->Mcoffice->delete($id);
            $this->_message('conference_office', __("CF_delete_ar"), 'success', site_url('conference_office/list_all/'.$lg));
        }

        function list_all()
        {
            is_admin();
            $lg = $this->uri->segment(3);	
            if (! $lg)
            {
                $lg = $this->_data['lang'];
            }
            if (lang_name_by_short_key($lg,TRUE)==FALSE)
            {
                $this->_message('admin', __("CF_invaild_lang"), 'error',site_url("vid/list_video_conference").'/'.$this->_data['lang']);
            }
            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => '#'
            );			
            $this->_data['lg'] = $lg;

            $page_offset = $this->uri->segment(4);			
            if (!$page_offset) $page_offset = 0;

            $config['base_url'] = site_url('conference_office/list_all').'/'.$lg.'/';		
            $config['uri_segment'] = 4;
            $config['per_page']=$this->office_per_page;
            $config['total_rows'] = $this->Mcoffice->count_office_by_lang($lg); 
            $config += config_pagination_style();		
            $this->pagination->initialize($config);
            $query = $this->Mcoffice->get_no($lg);
            foreach($query as $row)
            {
                $no = $row->max_no;
            }
            $this->_data['max_no']=$no;
            $this->_data['pagination'] = $this->pagination->create_links();        			
            $this->_data['articles'] = $this->Mcoffice->get_all_by_order($lg,$page_offset,$config['per_page']);

            $is_first_page = FALSE;
            $is_last_page = FALSE;						
            if ($page_offset==0) $is_first_page = TRUE;
            if (($config['total_rows']-$page_offset)<=$this->office_per_page) $is_last_page = TRUE;

            $this->_data['is_first_page'] = $is_first_page;
            $this->_data['is_last_page'] = $is_last_page;

            $this->_load_view('admin/office_list');

        }

        //order
        function order_by_no($no_temp_1='',$no_temp_2='',$lg)
        {
            // $lg = $this->uri->segment(3);
            if($this->Mcoffice->update_one($no_temp_2,$lg)==TRUE)
            {
                if($this->Mcoffice->update_temp($no_temp_1,$no_temp_2,$lg)==TRUE)
                {
                    if($this->Mcoffice->update_two($no_temp_1,$lg)==TRUE)
                    {
                        redirect(site_url('conference_office/index'.'/'.$lg));    
                    }   
                }    
            }
        }
        function swap_by_no($no_temp_1,$no_temp_2,$lg)
        {
            is_admin();
            if($no_temp_2<=0 || !is_numeric($no_temp_2))
            {
                $this->_message('training', __("CF_Invaild_format"), 'error',site_url("conference_office/index").'/'.$lg);   
            }else
            {
                $query = $this->Mcoffice->get_no($lg);
                foreach($query as $row)
                {
                    $max_no = $row->max_no;
                }
                if($no_temp_2>$max_no)
                {
                    $this->_message('training', __("CF_Invaild_format"), 'error',site_url("conference_office/index").'/'.$lg);
                }else
                {
                    $no_temp_2=$max_no-($no_temp_2-1);
                    if($this->Mcoffice->update_one($no_temp_2,$lg)==TRUE)
                    {
                        if($this->Mcoffice->update_temp($no_temp_1,$no_temp_2,$lg)==TRUE)
                        {
                            if($this->Mcoffice->update_two($no_temp_1,$lg)==TRUE)
                            {
                                redirect(site_url('conference_office/index'.'/'.$lg));    
                            }   
                        }    
                    }   
                }   
            }
        }
        //Delete Training
        function delete_article($id,$no,$lg)
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                if($this->Mcoffice->del_article($id,$no,$lg) == TRUE)
                {
                    redirect('conference_office/index/'.$lg.'/');
                }
            }
        }
    }
?>
