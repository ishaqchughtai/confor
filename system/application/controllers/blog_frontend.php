<?php
class Blog_frontend extends Frontend_controller {
    var $blog_sidebar = 'most_post';
    function Blog_frontend()
    {
        parent::Frontend_controller();
        $this->_container = 'container';        
        $this->load->model('Mblog');        
        $this->load->helper('date');
        $this->load->helper('string');
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
        $config['base_url'] = base_url().'index.php/blog_frontend/index/';
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
        $this->_data['page_title'] = 'Blog confor';                 
        $this->_load_view('blog/blog_view'); 
    }
    function blog_content($author='',$title='')
    {                     
        $this->_data['path'][] = array(
        'name' => $title,
        'link' => '#'
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
            'link' => '#'
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
     
    //Search
    function search()
    {
        $Keywords = $this->input->post('search_field_blog');
        $config['base_url'] = base_url().'index.php/blog_frontend/search/';
        $config['total_rows'] = $this->Mblog->count_record($Keywords);
        $config['per_page']='3';

        $config['full_tag_open'] = '<li>';
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';

        $this->pagination->initialize($config);
        //$num = !is_nan((double)$this->uri->segment(3))?0:$this->uri->segment(3);
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
    function search_keyword($Keywords='')
    {
        $config['base_url'] = base_url().'index.php/blog_frontend/search/';
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
                        redirect('blog_frontend/blog_content_admin'.'/'.$Name.'/'.$Title);    
                    }else
                    {
                        redirect('blog_frontend/blog_content'.'/'.$Name.'/'.$Title); 
                    }  
                } 
            }  
        }
    } 
}  