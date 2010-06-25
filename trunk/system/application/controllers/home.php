<?php

class Home extends Frontend_controller {


    function Home()
    {
        parent::Frontend_controller();
        $this->load->helper('date');
        $this->load->library('email');
    }


    function index()
    {
        // home page has image banner
        $this->_data['page_title'] = 'Confor.ca - homepage';
        $this->_data['video_path'] = $this->Mhome->get_top_viewed_video();
        $this->_data['header']['page'] = '/home/home_header';	
        $this->_load_view('home/index');
    }

    function contact()
    {		
        $this->_data['path'][] = array(
        'name' => __("CON_contact"),
        'link' => site_url("home/contact")
        );
            $this->form_validation->set_rules('name','Name','required');
            $this->form_validation->set_rules('email','Email','required|valid_email');
            $this->form_validation->set_rules('message','Message','required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>'); 
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('home/contact');    
            }else
            {

                $name_from=$this->input->post('name');
                $from=$this->input->post('email');
                $content=$this->input->post('message');
                $to='admin@conferences-formations.com';
                $subject='Contact message from '.$name_from;

                $this->email->clear();

                $config['protocol'] = 'sendmail';
                $config['mailpath'] = '/usr/sbin/sendmail';
                $config['charset'] = 'utf-8';
                $config['wordwrap'] = TRUE;
                $config['validate'] =TRUE;
                $this->email->initialize($config);

                $this->email->from($from, $name_from);
                $this->email->to($to);
                $this->email->subject($subject);
                $this->email->message($content);    
                $this->email->send();
                $this->_data['error']='Contact send successfully';
                $this->_load_view('home/contact');
            }
    }

    function login() 
    {
        $this->_data['path'][] = array(
        'name' => __("CON_login"),
        'link' => site_url("home/login")
        );	
        //$this->load->library('speaker_lib'); 
        //$this->speaker_lib->login();
        $this->user_lib->login();
    }

    function register() 
    {
        $this->_data['path'][] = array(
        'name' => 'Register',
        'link' => site_url("home/register")
        );	
        //$this->load->library('speaker_lib'); 
        //$this->speaker_lib->login();		
        $this->user_lib->register();
    }    

    function is_username_exists($username)
    {
        if ( $this->MUser->is_username_exists($username))
        {
            $this->form_validation->set_message('is_username_exists', 'The %s already exists');
            return FALSE;
        }
        return TRUE;
    }

    function is_email_exists($email)
    {
        if ( $this->MUser->is_email_exists($email))
        {
            $this->form_validation->set_message('is_email_exists', 'The %s already exists');
            return FALSE;
        }
        return TRUE;
    }	  

    function is_correct_captcha($captcha)
    {
        if (! $this->Mhome->is_correct_captcha($captcha))
        {
            $this->form_validation->set_message('is_correct_captcha', 'Invalid code');
            return FALSE;
        }
        return TRUE;		
    }	 	

    // function admin_login() 
    // {
    // $this->_data['path'][] = array(
    // 'name' => __("CON_login"),
    // 'link' => site_url("home/login")
    // );	
    // $this->load->library('speaker_lib'); 
    // $this->speaker_lib->login();
    // }	

    function search()
    {
        if($this->input->post('search'))
        {
            if($this->input->post('search'))
            {
                $num_per_page = 2;    
                $keyword=$this->input->post('search_field');   

                $config['full_tag_open'] = '<li>';        
                $config['full_tag_close'] = '</li>'; 
                $config['next_link'] = 'Next >';
                $config['prev_link'] = '< Previous';
                $config['last_link'] = 'Last >>';
                $config['first_link'] = '<< First';			

                $config['per_page'] = $num_per_page;
                $config['uri_segment'] = 5;            
                $config['total_rows'] = $this->Mhome->count_video_search($keyword);
                $this->_data['search_results']=$this->Mhome->search_paging($keyword, $num_per_page, 0);

                if (($keyword) && strlen($keyword)>0)
                {
                    $config['base_url'] = site_url('home/search_paging').'/'.$keyword.'/'.$num_per_page.'/';  
                } else {
                    $keyword = '_';
                    $config['base_url'] = site_url('home/search_paging').'/'.$keyword.'/'.$num_per_page.'/';
                }

                $this->pagination->initialize($config);  
                $this->_data['link_html'] = $this->pagination->create_links();  
                $this->_data['keyword'] = $keyword;
                $this->_load_view('home/search');                         
            }
            else
            {
                $this->_load_view('home/search');   
            }
        }
    }


    function search_paging($keywords_to_search, $num_per_page) 
    {  		
        $this->load->library('pagination');
        $offset = $this->uri->segment(5);      

        if ($offset == FALSE) $offset=0;

        $config['full_tag_open'] = '<li>';        
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';	

        $config['base_url'] = site_url('home/search_paging').'/'.$keywords_to_search.'/'.$num_per_page.'/';        
        $config['per_page'] = $num_per_page;
        $config['uri_segment'] = 5;
        if ($keywords_to_search == '_') $keywords_to_search = '';
        $config['total_rows'] = $this->Mhome->count_video_search($keywords_to_search);
        $this->pagination->initialize($config);
        $this->_data['search_results']=$this->Mhome->search_paging($keywords_to_search, $num_per_page, $offset);       
        $this->_data['link_html'] = $this->pagination->create_links();
        $this->_data['keyword'] = $keywords_to_search;
        $this->_load_view('home/search'); 
    }	

    function play($id)
    {
        $id=(double)$id;
        if(is_nan($id)==FALSE)
        {
            $this->_data['video_url']=$this->Mhome->get_video_by_id($id);
            $query=$this->Mhome->get_view_by_id($id);
            if($query->num_rows()>0)
            {
                $row=$query->row();
                $last_viewed=$row->viewed;
                $viewed=$last_viewed+1;
                $this->Mhome->update_view_time($id,$viewed);
                $this->_load_view('home/play_video');
            }
            else
            {
                redirect(site_url());
            }
        }
        else
        {
            redirect(site_url());
        }
    }	
    //------------------------------------------------------------------
    //BLOG FRONTEND
    //------------------------------------------------------------------	
    // function _block_sidebar() 
    // {
    // $side_bar['page'] = "blog/sidebar";		
    // $side_bar['popular_video'] = $this->Mhome->get_popular_video();
    // $side_bar['recent_video'] = $this->Mhome->get_recent_video();	
    // $this->_data['side_bar'] = $side_bar;		
    // }

    function blog()
    {
        $config['base_url'] = base_url().'index.php/home/blog/';
        $config['total_rows'] = $this->db->count_all('tblblog');
        $config['per_page']='3';

        $config['full_tag_open'] = '<li>';        
        $config['full_tag_close'] = '</li>'; 
        $config['next_link'] = 'Next >';
        $config['prev_link'] = '< Previous';
        $config['last_link'] = 'Last >>';
        $config['first_link'] = '<< First';

        $this->pagination->initialize($config);
        $this->data['query'] = $this->Mblog->get_all_blog($this->uri->segment(3),$config['per_page']);

        $this->data['pagination'] = $this->pagination->create_links();
        $this->data['query_most_blog'] = $this->Mblog->get_most_blog();
        $this->data['get_most_blog_post'] = $this->Mblog->get_most_blog_post();  
        $this->load->view('blog_view',$this->data);    
    }    
}