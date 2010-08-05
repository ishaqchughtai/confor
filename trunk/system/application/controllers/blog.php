<?php

class Blog extends Admin_controller {
    var $blog_sidebar = 'most_post';
    function Blog()
    {
        parent::Admin_controller();
        $this->_container = 'container';        
        $this->load->model('Mblog');   
        $this->load->model('Mspamemail');     
        $this->load->helper('date');
        $this->load->helper('string');
        $this->_data['adv']['category'] = 'blog';        
        $this->load->library('image_upload_lib'); 
        $this->load->model('Mshopproduct','mshopproduct');
        $this->image_upload_lib->ajax_link = site_url('blog/do_upload_ajax');        
        $this->_data['path'][] = array(
        'name' => __("CF_blog"),
        'link' => site_url("/blog")
        );        
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

    function index()
    { 
        redirect(site_url('blog/blog_list'.'/'.$this->_data['lang'])); 
    }            

    function blog_list()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $lg = $this->uri->segment(3);
            //$lg=$this->_data['lang'];    
            if (! $lg) return;
            if (lang_name_by_short_key($lg,TRUE)==FALSE)
            {
                $this->_message('blog', 'Invaild language', 'error',site_url("blog/blog_list").'/'.$this->_data['lang']);
            }   

            $this->_data['path'][] = array(
            'name' => __("CF_blog_list"),
            'link' => '#'
            ); 

            $this->_data['lg'] = $lg;
            $config['base_url'] = base_url().'index.php/blog/blog_list/'.$lg;
            $config['total_rows'] = $this->Mblog->count_record_blog($lg);
            $config['per_page']=5;

            $config += config_pagination_style();
            $config['uri_segment'] = 4;

            $this->pagination->initialize($config);
            $this->_data['query'] = $this->Mblog->get_all_blog($lg,$this->uri->segment(4),$config['per_page']);
            $this->_data['pagination'] = $this->pagination->create_links();
            //$this->_data['query_most_blog'] = $this->Mblog->get_most_blog();                               
            $this->_load_view('admin/blog_view_admin'); 
        }
    }     

    //Delete Blog
    function delete_blog()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $id = $this->uri->segment(3);
            if($this->Mblog->del_blog($id) == TRUE)
            {
                $this->_message('blog', __("CF_delete_blog"), 'success', site_url("blog/blog_list/".$this->_data['lang']));
            }
        }
    }

    //Get Blog
    function get_blog($id='')
    {
        if($id==NULL)
        {
            $this->blog_list();
        }else
        {
            $this->image_upload_lib->init();
            if($this->session->userdata('admin')=="")
            {
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_edit_blog"),
                'link' => '#'
                );         
                $this->_data['query'] = $this->Mblog->get_blog_by_id($id);
                $this->_load_view('admin/edit_blog_admin');
            }   
        }
    }

    //Add Blog
    function add_blog()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $this->_data['path'][] = array(
            'name' => __("CF_add_new_blog"),
            'link' => '#'
            );

            $lg = $this->input->post('lg');
            if (! $lg)
            {
                $lg = $this->_data['lang'];
            }

            $this->_data['lg'] = $lg;
            $this->image_upload_lib->init();  
            if($this->input->post('btnsubmit'))
            { 

                $this->form_validation->set_rules('txtTitle',strtolower(__("CF_title")),'trim|required|callback_title_check|max_length[50]');
                $this->form_validation->set_rules('txtSubject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtKeywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
                $this->form_validation->set_rules('txtBody',strtolower(__("CF_blog_body")),'required');
                $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');

                $Author=$this->session->userdata('admin_id');
                $FirstName = $this->session->userdata('admin_name'); 
                $datestring = "%Y-%m-%d";
                $time = time();
                $Date=mdate($datestring,$time);
                $Title=$this->input->post('txtTitle');
                $Title=strip_quotes($Title);

                $Subject=$this->input->post('txtSubject');
                $Keywords=$this->input->post('txtKeywords');
                $Text=$this->input->post('txtBody');
                $about=$this->input->post('about');
                $this->_data['uname'] = $this->input->post('uname'); 
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('admin/add_blog_admin');        
                }
                else
                {                              
                    if($this->Mblog->add_blog($Author,$Date,$Title,$Subject,$Keywords,$Text,$this->_data['uname'],$about,$lg)==TRUE)
                    { 
                        $this->_message('blog', __("CF_addblog_success"), 'success', site_url("blog/blog_list".'/'.$lg));
                    }
                }
            }else
            {
                $this->_load_view('admin/add_blog_admin');
            } 
        }
    }    

    // Edit Blog
    function edit_blog_submit($id='')
    {
        if($id==NULL)
        {
            $this->blog_list();   
        }else
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_edit_blog"),
                'link' => '#'
                );
                //$this->image_upload_lib->init();                    
                $this->form_validation->set_rules('txtTitle',strtolower(__("CF_title")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtSubject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtKeywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
                $this->form_validation->set_rules('txtBody',strtolower(__("CF_blog_body")),'required');
                $this->form_validation->set_rules('about',strtolower(__("CF_about")),'required');
                $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
                if($this->form_validation->run()==FALSE)
                {
                    $this->get_blog($id='');
                }else
                {
                    $Author=$this->session->userdata('admin_id');
                    $FirstName = $this->session->userdata('admin_name');
                    $datestring = "%Y-%m-%d";
                    $time = time();
                    $Date=mdate($datestring,$time);
                    $Title=$this->input->post('txtTitle');
                    $Title=quotes_to_entities($Title);                                          
                    $Subject=$this->input->post('txtSubject');
                    $Keywords=$this->input->post('txtKeywords');
                    $Text=$this->input->post('txtBody');
                    $about=$this->input->post('about');
                    $this->_data['page_title'] = $Title;
                    $edit_image=$this->input->post('edit_image');
                    $this->_data['uname'] = $this->input->post('uname');
                    $lang_temp = $this->input->post('lg');
                    if (strlen($this->_data['uname'])>1)
                    {
                        $this->image_upload_lib->remove_image_from_db($id,'ID','Link','tblblog'); 
                        $data = $this->Mblog->edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$this->_data['uname'],$about,$lang_temp);
                        $this->_message('blog', __("CF_editblog_success"), 'success', site_url("blog/blog_list/".$this->_data['lang']));  
                    }else
                    {
                        $data = $this->Mblog->edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$edit_image,$about,$lang_temp);
                        $this->_message('blog', __("CF_editblog_success"), 'success', site_url("blog/blog_list/".$this->_data['lang']));
                    }
                }
            }            
        }
    }
    //Title check
    function title_check($Title)
    {
        if($this->Mblog->is_blog_exist($Title)!=TRUE)
        {
            return TRUE;    
        }else
        {
            $this->form_validation->set_message('title_check', '__("CF_the") %s __("CF_already_exist")'); 
            return FALSE;    
        }    
    }    

    //Keyword check
    function keyword_check($Keywords)
    {
        $Key = explode(" ", $Keywords);
        for($i=0;$i<count($Key);)
        {
            $i++;    
        }
        if($i > 4)
        {
            $this->form_validation->set_message('keyword_check', '__("CF_the") %s __("CF_already_exist")'); 
            return FALSE ;           
        }else
        {
            return TRUE ;
        }
    }    

    function search()
    {

        $this->_data['page_title'] = __("CF_Blog_search");
        $Title = $this->input->post('search_field_blog_admin');
        $lg = $this->uri->segment(3);

        if (! $lg) return;$lg=$this->_data['lang'];
        if (lang_name_by_short_key($lg,TRUE)==FALSE)
        {
            $this->_message('blog', 'Invaild language', 'error',site_url("blog/blog_list").'/'.$this->_data['lang']);
        }
        $Title = $this->uri->segment(4);
        $per_page = $this->uri->segment(5);
        $offset = $this->uri->segment(6);

        $this->_data['path'][] = array(
        'name' => __("CF_Blog_search"),
        'link' => '#'
        );
        $config['uri_segment'] = 6; 
        $config['base_url'] = base_url().'index.php/blog/search/'.$lg.'/'.$Title.'/'.$per_page;
        $config['total_rows'] = $this->Mblog->count_record_blog_title($this->_data['lang'],$Title);
        $config['per_page']=$per_page;
        $config += config_pagination_style();
        $this->pagination->initialize($config);
        $query_search = $this->Mblog->search_blog_by_title($this->_data['lang'],$offset,$per_page,$Title);
        if($query_search->num_rows()>0)
        {
            $this->_data['pagination'] = $this->pagination->create_links(); 
            $this->_data['query'] =  $query_search->result_array();
            $this->_load_view('admin/search_blog');                             

        }
        else
        {
            $this->_data['error']=__("CF_mess_no_search");
            $this->_load_view('admin/search_blog');
        }

    }
    //edit comment
    function edit_comment($id,$idblog,$status_temp,$countcommenttemp)
    {            

        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            if($status_temp==1)
            {
                $Status=0;
                $CountComment=$countcommenttemp-1;                                                            
                $data = $this->Mblog->update_comment($id,$Status,$CountComment,$idblog);
                redirect('blog/comment_agree');
            }else
            {
                $Status=1;
                $CountComment=$countcommenttemp+1;                                                            
                $data = $this->Mblog->update_comment($id,$Status,$CountComment,$idblog);
                redirect('blog/comment_not_agree');
            }                  
        }   
    }

    //Delete comment
    function delete_comment($id,$idblog,$status_temp,$countcommenttemp)
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $CountComment=$countcommenttemp-1;
            $data = $this->Mblog->del_comment($id,$CountComment,$idblog);
            if($status_temp==1)
            {
                redirect('blog/comment_agree');
            }else
            {
                redirect('blog/comment_not_agree');
            }            
        }
    }

    //Comments List
    function comment_agree()
    {
        $this->_data['path'][] = array(
        'name' => __("CF_blog_approved"),
        'link' => "#"
        );
        $this->_data['query_show_comment_agree'] = $this->Mblog->show_comment_agree();
        $this->_load_view('blog/comment');
    }    
    function comment_not_agree()
    {
        $this->_data['path'][] = array(
        'name' => __("CF_blog_not_approved"),
        'link' => "#"
        );
        $this->_data['query_show_comment_not_agree'] = $this->Mblog->show_comment_not_agree();
        $this->_load_view('blog/comment_not_show');
    }
    function comment_entry($id)
    {
        is_admin();
        $this->_data['path'][] = array(
        'name' => __("CF_cm_entry"),
        'link' => '#'
        );
        $this->_data['query_comment_entry']=$this->Mblog->select_comment_admin($id);
        $this->_load_view("blog/comment_entry");    
    }
}
