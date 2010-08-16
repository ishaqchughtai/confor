<?php
class Blog_frontend extends Frontend_controller {
    var $blog_sidebar = 'most_post';
    function Blog_frontend()
    {
        parent::Frontend_controller();
        $this->_container = 'container';        
        $this->load->model('Mblog');
        $this->load->model('Mmetadata');       
        $this->load->model('Mspamemail'); 
        $this->load->helper('date');
        $this->load->helper('xemmex');
        $this->load->helper('string');
        $this->load->model('send_mail');        
        $this->_data['adv']['category'] = 'blog';        
        $this->load->model('Mshopproduct','mshopproduct');
        $this->_data['path'][] = array(
        'name' => __("CF_blog"),
        'link' => site_url("/blog_frontend")
        );        
    }
    function _before_render() 
    {
        if ($this->blog_sidebar == 'most_post') 
        {
            $side_bar['page'] = "blog/sidebar_pop";    
            $side_bar['pop'] = $this->Mblog->get_most_blog_post($this->_data['lang']);        
        }
        else 
        {
            $side_bar['page'] = "blog/sidebar_bill";                
            $side_bar['bill'] = $this->Mblog->get_most_blog_view($this->_data['lang']);                                
        }
        $side_bar['categories'] = $this->Mhome->get_category($this->_data['lang']);
        $side_bar['dates'] = $this->Mhome->get_dates();
        $side_bar['top_speaker'] = $this->Mhome->get_top_speaker();
        $this->_data['side_bar'] = $side_bar;
    }
    function index()
    {                        
        $lg=$this->_data['lang'];    
        if (! $lg) return;
        if (lang_name_by_short_key($lg,TRUE)==FALSE)
        {
            $this->_message('blog', 'Invaild language', 'error',site_url("blog/blog_list").'/'.$this->_data['lang']);
        }   

        $this->_data['lg'] = $lg;
        $this->_data['query_most_blog'] = $this->Mblog->get_most_blog($this->_data['lang']);
        $config['base_url'] = base_url().'index.php/blog_frontend/index/';
        $config['total_rows'] = $this->Mblog->count_record_blog($lg);
        $config['per_page']=$this->_setting['num_per_page_blog'];

        $config += config_pagination_style();

        $this->pagination->initialize($config);
        $num = $this->uri->segment(3);
        $this->_data['query'] = $this->Mblog->get_all_blog($lg,$num,$config['per_page']);
        $this->_data['pagination'] = $this->pagination->create_links();                

        $lg = $this->_data['lang'];
        $meta = $this->Mmetadata->out_static_meta('blog_list',$lg);
        if ($meta!=FALSE) 
        {
            $title = $meta->title.' - confor.tv';
            $this->_data['meta'] = $meta;  
        }
        else
        {
            $title = __("CF_blog").' - confor.tv';
        }
        $this->_data['page_title'] = $title;
        $this->_load_view('blog/blog_view'); 
    }
    function blog_content($author='',$id='')
    {                     

        $this->blog_sidebar = 'most_view';                
        $query=$this->Mblog->get_blog_by_id_countview($id);
        if($query->num_rows()==1)
        {
            $row=$query->row();
            $id = $row->ID;
            $title = $row->Title;
            $last_viewed=$row->CountView;
            $viewed=$last_viewed+1;
            $this->Mblog->count_view($viewed,$title);
            $this->_data['path'][] = array(
            'name' => $title,
            'link' => '#'
            );
            $this->_data['query'] = $this->Mblog->get_blog_id($id);

            if ( count($this->_data['query'])>0)
            {
                $row = $this->_data['query'][0];
                $this->_data['video_blog_keyword'] = $row['Keywords'];
                //$this->_data['speaker_name'] = $row['FirstName'].' '.$row['Name'];
            }	  	  

            $this->_data['query_show_comment'] = $this->Mblog->show_comment($title);
            $this->_data['query_show_author'] = $this->Mblog->written($author);

            $meta = $this->Mmetadata->out_meta('blog',$id);
            if ($meta!=FALSE) 
            {
                $title1 = $meta->title.' - confor.tv';
                $this->_data['meta'] = $meta;          
            }
            else
            {
                $title1 = $title.' - confor.tv';
            }
            $this->_data['page_title'] = $title1;      
            $this->_load_view('blog/blog_entry_view');
        }else
        {
            redirect(site_url('blog_frontend'));
        }
    }
    function blog_content_admin($author='',$id='')  
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            $this->blog_sidebar = 'most_view';    
            $query=$this->Mblog->get_blog_by_id_countview($id);
            if($query->num_rows()==1)
            {
                $row=$query->row();
                $last_viewed=$row->CountView;
                $viewed=$last_viewed+1;
                $title = $row->Title;
                $this->Mblog->count_view($viewed,$title);       
                $this->_data['path'][] = array(
                'name' => $title,
                'link' => '#'
                );
                $this->_data['query'] = $this->Mblog->get_blog_id($id);
                $this->_data['query_show_comment'] = $this->Mblog->show_comment($title);
                $this->_data['query_show_author'] = $this->Mblog->written($author);
                $meta = $this->Mmetadata->out_meta('blog',$id);
                if ($meta!=FALSE) 
                {
                    $title1 = $meta->title.' - confor.tv';
                    $this->_data['meta'] = $meta;          
                }
                else
                {
                    $title1 = $title.' - confor.tv';
                }
                $this->_data['page_title'] = $title1; 
                $this->_load_view('admin/blog_entry_view_admin');               
            }else
            {
                redirect(site_url('blog_frontend'));
            }
        }
    }

    //Search
    function search()
    {
        $this->_data['page_title'] = __("CF_Blog_search");
        $Title = $this->input->post('search_field_blog');
        $Title = $this->uri->segment(3);
        $per_page = $this->uri->segment(4);
        $offset = $this->uri->segment(5);

        $this->_data['path'][] = array(
        'name' => __("CF_Blog_search"),
        'link' => '#'
        );
        $config['uri_segment'] = 5; 
        $config['base_url'] = base_url().'index.php/blog_frontend/search/'.$Title.'/'.$per_page;
        $config['total_rows'] = $this->Mblog->count_record_blog_title($this->_data['lang'],$Title);
        $config['per_page']=$per_page;
        $config += config_pagination_style();
        $this->pagination->initialize($config);
        $query_search = $this->Mblog->search_blog($this->_data['lang'],$offset,$per_page,$Title);
        if($query_search->num_rows()>0)
        {
            $this->_data['pagination'] = $this->pagination->create_links(); 
            $this->_data['query'] =  $query_search->result_array();
            $this->_load_view('blog/search_blog');                             

        }
        else
        {
            $this->_data['error']=__("CF_mess_no_search");
            $this->_data['query_most_blog_post'] = $this->Mblog->get_most_blog_post($this->_data['lang']);
            $this->_load_view('blog/search_blog');
        }

    }    
    function search_keyword($Keywords='')
    {
        $Keywords = $this->uri->segment(3);
        $per_page = $this->uri->segment(4);
        $offset = $this->uri->segment(5);

        $this->_data['path'][] = array(
        'name' => __("CF_Blog_search"),
        'link' => '#'
        );
        $config['uri_segment'] = 5;
        $config['base_url'] = base_url().'index.php/blog_frontend/search_keyword/'.$Keywords.'/'.$per_page;
        $config['total_rows'] = $this->Mblog->count_record($this->_data['lang'],$Keywords);
        $config['per_page']=$per_page;
        // echo $config['total_rows'];
        //        return;
        $config += config_pagination_style();

        $this->pagination->initialize($config);
        $query_search = $this->Mblog->search_blog_keyword($this->_data['lang'],$offset,$per_page,$Keywords);
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
            $this->_data['query_most_blog_post'] = $this->Mblog->get_most_blog_post($this->_data['lang']);
            $this->_load_view('blog/search_blog');
        } 
    }
    function search_blog_by_date()
    {
        $this->_data['path'][] = array(
        'name' => __("CF_Blog_search"),
        'link' => '#'
        );
        $Date = $this->uri->segment(3);
        $per_page = $this->uri->segment(4);
        $offset = $this->uri->segment(5);
        $config['base_url'] = base_url().'index.php/blog_frontend/search_blog_by_date/'.$Date.'/'.$per_page;
        $config['total_rows'] = $this->Mblog->count_record_date($this->_data['lang'],$Date);
        $config['per_page']=$per_page;
        $config['uri_segment'] = 5;
        $config += config_pagination_style();
        $this->pagination->initialize($config);
        $query_search = $this->Mblog->search_blog_by_date($this->_data['lang'],$offset,$per_page,$Date);
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
            $this->_data['query_most_blog_post'] = $this->Mblog->get_most_blog_post($this->_data['lang']);
            $this->_load_view('blog/search_blog');
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
        if($Website==NULL)
        {
            $Website="http://confor.us";   
        }
        $Website=prep_url($Website);
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
                    $this->blog_content_admin($Name,$Blog);                                            
                }else
                {
                    $this->blog_content($Name,$Blog); 
                }                         
            }else
            {
                $query=$this->Mspamemail->check_spamemail($Email);
                if($query->num_rows()>0)
                {
                    $this->_message('blog_frontend',sprintf(__("CF_checkspamemail_success"),$this->_setting['email']), 'error', site_url('blog_frontend'));
                }else
                {
                    if($this->Mblog->add_comment($Comment,$Blog,$Date,$Author,$Website,$Email,$Status,$CountComment)==TRUE)
                    {
                        if($this->session->userdata('admin'))
                        {                         
                            $this->_message('blog', __("CF_addcommentbyadmin_success"), 'success', site_url('blog_frontend/blog_content_admin'.'/'.$Name.'/'.$Blog.'/'.$Title.'#comments'));
                        }else
                        {
                            $from =$this->_setting['email'];
                            $name_from = '';
                            $to=$Email;
                            $ar_key = array('[NAME]','[TITLE]','[BODY]','[SITE_URL]');
                            $ar_value = array($Author,$Title,$Comment,'HTTP://CONFOR.TV');
                            $x = email_template_parse($this->_data['lang'],'CB',$ar_key,$ar_value);
                            $x_a = email_template_parse($this->_data['lang'],'CBA',$ar_key,$ar_value);
                            $this->send_mail->send('text',$from , $name_from, $to, $x['subject'], $x['body']);
                            $this->send_mail->send('text',$to , $name_from, $from, $x_a['subject'], $x_a['body']);
                            $this->_message('blog_frontend', __("CF_addcomment_success"), 'success', site_url('blog_frontend/blog_content'.'/'.$Name.'/'.$Blog.'/'.$Title.'#comments'));
                        }  
                    } 
                }   
            }  
        }
    } 
}  
