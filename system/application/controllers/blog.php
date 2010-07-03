<?php

class Blog extends Frontend_controller {
    var $blog_sidebar = 'most_post';
    function Blog()
    {
        parent::Frontend_controller();
        $this->_container = 'container';		
        $this->load->model('Mblog');		
        $this->load->helper('date');
        $this->load->helper('string');
        $this->_data['adv']['category'] = 'blog';		
        $this->_data['path'][] = array(
        'name' => __("CF_blog"),
        'link' => site_url("/blog")
        );		
    }	

    function _before_render() 
    {
        if ($this->blog_sidebar == 'most_post') 
        {
            $side_bar['page'] = "blog/sidebar_pop";	
            $side_bar['pop'] = $this->Mblog->get_most_blog_post();		
        }
        else 
        {
            $side_bar['page'] = "blog/sidebar_bill";				
            $side_bar['bill'] = $this->Mblog->get_most_blog_view();								
        }
        $side_bar['categories'] = $this->Mhome->get_category();
        $side_bar['dates'] = $this->Mhome->get_dates();
        $side_bar['top_speaker'] = $this->Mhome->get_top_speaker();
        $this->_data['side_bar'] = $side_bar;
    }

    function index()
    {						
        $this->_data['query_most_blog'] = $this->Mblog->get_most_blog();
        $config['base_url'] = base_url().'blog/';
        $config['total_rows'] = $this->db->count_all('tblblog');
        $config['per_page']='3';

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
        if($this->session->userdata('admin')==TRUE)
        {
            $this->_data['page_title'] = 'Blog confor'; 
            $this->_load_view('admin/blog_view_admin'); 
        }
        else
        {
            $this->_data['page_title'] = 'Blog confor';                 
            $this->_load_view('blog/blog_view'); 
        } 
    }		

    function blog_content($author='',$title='')
    {                 	
        $this->_data['path'][] = array(
        'name' => $title,
        'link' => site_url("/blog/blog_content/".$author.'/'.$title)
        );

        $this->blog_sidebar = 'most_view';		
        $this->_data['query'] = $this->Mblog->get_blog_by_title($title);		
        $this->_data['query_show_comment'] = $this->Mblog->show_comment($title);
        $this->_data['query_show_author'] = $this->Mblog->written($author);

        $query=$this->Mblog->get_blog_by_title_countview($title);
        if($query->num_rows()==1)
        {
            $row=$query->row();
            $last_viewed=$row->CountView;
            $viewed=$last_viewed+1;
            $this->Mblog->count_view($viewed,$title);
            $this->_data['page_title'] = $title;         
            $this->_load_view('blog/blog_entry_view');
        }else
        {
            redirect(site_url('blog'));
        }

    }	

    function blog_content_admin($author='', $title='')
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $this->_data['path'][] = array(
            'name' => $title,
            'link' => site_url("blog/blog_content/".$author.'/'.$title)
            );
            $this->blog_sidebar = 'most_view';    
            $query=$this->Mblog->get_blog_by_title_countview($title);
            if($query->num_rows()==1)
            {
                $row=$query->row();
                $last_viewed=$row->CountView;
                $viewed=$last_viewed+1;
                $this->Mblog->count_view($viewed,$title);       
                $this->_data['query'] = $this->Mblog->get_blog_by_title($title);
                $this->_data['query_show_comment'] = $this->Mblog->show_comment($title);
                $this->_data['query_show_author'] = $this->Mblog->written($author);
                $this->_data['page_title'] = $title; 
                $this->_load_view('admin/blog_entry_view_admin');               
            }else
            {
                redirect(site_url('blog'));
            }

        }
    }

    //Add comment
    function add_comment()
    {                    
        $this->form_validation->set_rules('name',strtolower(__("CF_name")),'trim|required');
        $this->form_validation->set_rules('email',strtolower(__("CF_mail")),'trim|required|valid_email');
        $this->form_validation->set_rules('url',strtolower(__("CF_site_web")),'trim');
        $this->form_validation->set_rules('msg',strtolower(__("CF_blog_body")),'required|max_length[400]');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');

        $datestring = "%Y-%m-%d %h:%m:%s";
        $time = time();
        $Date=mdate($datestring,$time);
        $Author=$this->input->post('name');                                          
        $Email=$this->input->post('email');
        $Website=$this->input->post('url');
        $Comment=$this->input->post('msg');
        $Blog=$this->input->post('blog');
        $Title=$this->input->post('title');
        $Name=$this->input->post('authortemp');
        $countcommenttemp=$this->input->post('countcommenttemp');
        $this->_data['page_title'] = $Title;
        if($this->session->userdata('admin'))
        {
            $CountComment=$countcommenttemp+1;
            $Status=1; 
        }else
        {
            $CountComment=$countcommenttemp; 
            $Status=0;
        }
        if ($this->input->post('submit')){
            if($this->form_validation->run()==FALSE)
            {
                if($this->session->userdata('admin'))
                {
                    $this->blog_content_admin($Name,$Title);    										
                }else
                {
                    $this->blog_content($Name,$Title);
                }                         
            }else
            {
                if($this->Mblog->add_comment($Comment,$Blog,$Date,$Author,$Website,$Email,$Status,$CountComment)==TRUE)
                {
                    if($this->session->userdata('admin'))
                    {
                        redirect('blog/blog_content_admin'.'/'.$Name.'/'.$Title);    
                    }else
                    {
                        redirect('blog/blog_content'.'/'.$Name.'/'.$Title); 
                    }  
                } 
            }  
        }
    }	

    function blog_list()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $config['base_url'] = base_url().'blog/blog_list/';
            $config['total_rows'] = $this->db->count_all('tblblog');
            $config['per_page']='3';

            $config['full_tag_open'] = '<li class="selected">';    
            $config['full_tag_close'] = '</li>';
            $config['cur_tag_open'] = '<li class="selected">';
            $config['cur_tag_close'] = '<li>'; 
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
            if($this->session->userdata('admin')=="")
            {
                redirect(site_url("admin"));
            }
            else
            {          
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

            if($this->input->post('btnsubmit'))
            {          
                $this->form_validation->set_rules('txtTitle',strtolower(__("CF_title")),'trim|required|callback_title_check|max_length[50]');
                $this->form_validation->set_rules('txtSubject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtKeywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
                $this->form_validation->set_rules('txtBody',strtolower(__("CF_blog_body")),'required|max_length[500]');
                $this->form_validation->set_rules('txtLink',strtolower(__("CF_image_link")),'required');
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
                $Link=$this->input->post('txtLink');
                $about=$this->input->post('about');
       
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('admin/add_blog_admin');        
                }
                else
                {                              
                    if($this->Mblog->add_blog($Author,$Date,$Title,$Subject,$Keywords,$Text,$Link,$about)==TRUE)
                    {
                        redirect('blog/blog_content_admin/'.$FirstName.'/'.$Title);  
                    }
                }
            }else
            {
                $this->_load_view('admin/add_blog_admin');
            } 
        }
    }	

    // Do upload  
    function do_upload()
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $config['upload_path'] = './assets/uploads/image/';
            $config['allowed_types'] = 'jpg';
            $config['max_size']    = '300';
            $config['max_width']  = '1024';
            $config['max_height']  = '768';
            $config['overwrite']  = 'TRUE';
            $this->load->library('upload', $config);

            if ( ! $this->upload->do_upload())
            {
                $error = array('error' => $this->upload->display_errors());
                $this->load->view('admin/upload_form', $error);
            }    
            else
            {
                $data = array('upload_data' => $this->upload->data());
                $data['Link_full'] = $this->upload->file_name;
                $this->load->view('admin/upload_success', $data);
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
                $this->form_validation->set_rules('txtTitle',strtolower(__("CF_title")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtSubject',strtolower(__("CF_subject")),'trim|required|max_length[50]');
                $this->form_validation->set_rules('txtKeywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
                $this->form_validation->set_rules('txtBody',strtolower(__("CF_blog_body")),'required|max_length[500]');
                $this->form_validation->set_rules('txtLink',strtolower(__("CF_image_link")),'required');
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
                    $Link=$this->input->post('txtLink');
                    $about=$this->input->post('about');
                    $this->_data['page_title'] = $Title; 
                    $data = $this->Mblog->edit_blog($id,$Author,$Date,$Title,$Subject,$Keywords,$Text,$Link,$about);
                    redirect('blog/blog_content_admin/'.$FirstName.'/'.$Title);  
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
        $query_search = $this->Mblog->search_blog($config['per_page'],$num,$Keywords);
        $this->_data['page_title'] = 'Blog Search';
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
    function search_keyword($Keywords='')
    {
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
        $query_search = $this->Mblog->search_blog($config['per_page'],$this->uri->segment(3),$Keywords);
        $this->_data['page_title'] = 'Blog Search';
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
    function edit_comment($titletemp,$id,$idblog,$countcommenttemp,$authortemp)
    {            

        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {              
            $Status=1;
            $CountComment=$countcommenttemp+1;                                                            
            $data = $this->Mblog->update_comment($id,$Status,$CountComment,$idblog);
            redirect('blog/blog_content_admin'.'/'.$authortemp.'/'.$titletemp);    
        }   
    }

    //Delete comment
    function delete_comment($titletemp, $id,$idblog,$countcommenttemp,$authortemp)
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $CountComment=$countcommenttemp-1;
            $data = $this->Mblog->del_comment($id,$CountComment,$idblog);
            redirect('blog/blog_content_admin'.'/'.$authortemp.'/'.$titletemp);
        }
    }        
}