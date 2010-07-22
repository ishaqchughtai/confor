<?php

class Video extends Frontend_controller 
{
	var $num_per_page = 10;
	function Video()
	{
		parent::Frontend_controller();
		$this->load->model('Mvconference');
		$this->_container = 'container';    
		$this->load->helper('date');				      
        $this->load->library('email');
        $this->load->model('Mshowroom');
        $this->load->model('Mshopproduct','mshopproduct');        
		$this->_memberships = array(2,3);
	}

	function speaker()
	{
		$id = $this->uri->segment(3);
		$per_page = $this->uri->segment(4);
		$offset = $this->uri->segment(5);

		$config['uri_segment'] = 5;
		$config['base_url'] = base_url().'index.php/video/speaker/'.$id.'/'.$per_page;
		$config['total_rows'] = $this->Mvconference->count_record_speaker($id);
		$config['per_page']=$per_page;

		$config += config_pagination_style();	
		$this->_data['video_speaker'] = $this->Mvconference->get_video_by_speaker($id,$per_page,$offset); 
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_load_view('home/get_video_by_speaker'); 
	}

    function keyword_check($Keywords)
    {
        $Key = explode(" ", $Keywords);				
        if(count($Key)>4)
        {
            $this->form_validation->set_message('keyword_check', __("CF_the").'%s'.__("CF_field_max")); 
            return FALSE ;           
        }else
        {
            return TRUE ;
        }
    }	
    /*Add function*/
    function play($id='')
    {
        $this->_data['path'][] = array(
        'name' => __("CF_conference_office"),
        'link' => site_url('conference_office')
        );    
        $this->_data['path'][] = array(
        'name' => __("CF_play"),
        'link' => '#'
        );
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
                $this->_data['page_title'] = $row->title;
                $catid=$row->category;
                $page_offset=$this->uri->segment(5);
                $config['base_url'] = 'http://localhost/confor/index.php/video/play/'.$id.'/4/';
            $config['total_rows'] = $this->Mhome->count_video_record($catid);
            $config['per_page']='4';
            $config['uri_segment'] = 5;

			$config += config_pagination_style();

            $this->pagination->initialize($config);
            $this->_data['pagination'] = $this->pagination->create_links();
                $this->_data['video_by_cat'] = $this->Mhome->get_video_by_category($catid,$page_offset,$config['per_page']);
                $this->_data['pagination'] = $this->pagination->create_links();
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
    function search()
    {
    $this->_data['path'][] = array(
      'name' => __("CF_search_video"),
      'link' => '#'
      );    
            if($this->input->post('search'))
            {                
                $num_per_page = 5;    
                $keyword=$this->input->post('search_field');   
				$config += config_pagination_style();	
          

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

    function search_paging($keywords_to_search, $num_per_page) 
    {
    $this->_data['path'][] = array(
      'name' => __("CF_search_video"),
      'link' => '#'
      );          
        $this->load->library('pagination');
        $offset = $this->uri->segment(5);      

        if ($offset == FALSE) $offset=0;

		$config += config_pagination_style(); 

        $config['base_url'] = site_url('home/search_paging').'/'.$keywords_to_search.'/'.$num_per_page.'/';        
        $config['per_page'] = $num_per_page;
        $config['uri_segment'] = 6;
        if ($keywords_to_search == '_') $keywords_to_search = '';
        $config['total_rows'] = $this->Mhome->count_video_search($keywords_to_search);
        $this->pagination->initialize($config);
        $istitle = $this->uri->segment(6);
        $this->_data['search_results']=$this->Mhome->search_paging($keywords_to_search, $num_per_page, $offset,$istitle);     
        $this->_data['link_html'] = $this->pagination->create_links();
        $this->_data['keyword'] = $keywords_to_search;
        $this->_load_view('home/search'); 
    }
	
	function list_archives()
	{		
		$year = $this->uri->segment(3);
		$month = $this->uri->segment(4);
		$page_offset = $this->uri->segment(5);
				
		$this->db->where('lang',$this->_data['lang']);
		$this->db->where('MONTH(FROM_UNIXTIME(date))',$month);
		$this->db->where('YEAR(FROM_UNIXTIME(date))',$year);	
		$this->db->from('videos');
		$config['total_rows'] = $this->db->count_all_results();
		
		$config['uri_segment'] = 5;
		$config['base_url'] = site_url('video/list_archives').'/'.$year.'/'.$month;
		
		$config['per_page'] = $this->_setting['num_per_page_video'];
		$config += config_pagination_style();
		
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();				
		
		$this->db->select('videos.*, users.username');
		$this->db->where('lang',$this->_data['lang']);
		$this->db->where('MONTH(FROM_UNIXTIME(date))',$month);
		$this->db->where('YEAR(FROM_UNIXTIME(date))',$year);	
		$this->db->limit($config['per_page'], $page_offset);
		$this->db->from('videos');		
		$this->db->join('users','users.id=videos.mem_id');
		set_order_from_setting('videos','order_video_field','order_video_sort','date');
		$query = $this->db->get();
		$this->_data['archives'] = $query->result_array();				
		$this->_load_view('home/archive_list');		
	}		
	
}