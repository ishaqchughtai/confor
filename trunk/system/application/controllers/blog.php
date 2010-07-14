<?php

class Blog extends Admin_controller {
    var $blog_sidebar = 'most_post';
    function Blog()
    {
        parent::Admin_controller();
        $this->_container = 'container';        
        $this->load->model('Mblog');        
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
        $this->_data['path'][] = array(
        'name' => __("CF_blog_list"),
        'link' => '#'
        );                        
        $this->_data['query_most_blog'] = $this->Mblog->get_most_blog();
        $config['base_url'] = base_url().'index.php/blog/index/';
        $config['total_rows'] = $this->db->count_all('tblblog');
        $config['per_page']='5';

        $config['full_tag_open'] = '<li>';        
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';

        $this->pagination->initialize($config);
        $num = $this->uri->segment(3);
        $this->_data['query'] = $this->Mblog->get_all_blog($num,$config['per_page']);
        $this->_data['pagination'] = $this->pagination->create_links();                
        $this->_data['page_title'] = __("CF_Blog_Title"); 
        $this->_load_view('admin/blog_view_admin'); 
    }            



    function blog_list()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $this->_data['path'][] = array(
            'name' => __("CF_blog_list"),
            'link' => '#'
            ); 
            $config['base_url'] = base_url().'index.php/blog/blog_list/';
            $config['total_rows'] = $this->db->count_all('tblblog');
            $config['per_page']='5';

            $config['full_tag_open'] = '<li>';    
            $config['full_tag_close'] = '</li>';
            $config['next_link'] = 'Next >';
            $config['prev_link'] = '< Previous';
            $config['last_link'] = 'Last >>';
            $config['first_link'] = '<< First';

            $this->pagination->initialize($config);
            $this->_data['query'] = $this->Mblog->get_all_blog($this->uri->segment(3),$config['per_page']);
            $this->_data['pagination'] = $this->pagination->create_links();
            $this->_data['query_most_blog'] = $this->Mblog->get_most_blog();                               
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
                redirect('blog/blog_list');
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
                    if($this->Mblog->add_blog($Author,$Date,$Title,$Subject,$Keywords,$Text,$this->_data['uname'],$about)==TRUE)
                    {
                        //redirect('blog_frontend/blog_content_admin/'.$FirstName.'/'.$Title);  
                        $this->blog_list();
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
                    if (strlen($this->_data['uname'])>1)
                    {
                        $this->image_upload_lib->remove_image_from_db($id,'ID','Link','tblblog'); 
                        $data = $this->Mblog->edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$this->_data['uname'],$about);
                        redirect('blog_frontend/blog_content_admin/'.$FirstName.'/'.$Title);  
                    }else
                    {
                        $data = $this->Mblog->edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$edit_image,$about);
                        redirect('blog_frontend/blog_content_admin/'.$FirstName.'/'.$Title);
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

    //Search
    function search()
    {
        $Keywords = $this->input->post('search_field_blog');
        $config['base_url'] = base_url().'blog/search/';
        $config['total_rows'] = $this->Mblog->count_record($Keywords);
        $config['per_page']='3';

        $config['full_tag_open'] = '<li>';
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';

        $this->pagination->initialize($config);
        $num = !is_nan((double)$this->uri->segment(3))?0:$this->uri->segment(3);
        $query_search = $this->Mblog->search_blog($this->uri->segment(3),$config['per_page'],$Keywords);
        $this->_data['page_title'] = __("CF_Blog_search");
        if($query_search->num_rows()>0)
        {
            $this->_data['pagination'] = $this->pagination->create_links(); 
            $this->_data['query'] =  $query_search->result_array();
            $this->_load_view('blog/search_blog');                             

        }
        else
        {
            $this->_data['error']=__("CF_mess_no_search");
            $this->_data['query_most_blog_post'] = $this->Mblog->get_most_blog_post();
            $this->_load_view('blog/search_blog');
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

}
