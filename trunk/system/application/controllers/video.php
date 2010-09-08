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
    $this->load->model('Mhome');
    $this->load->model('Mmetadata');
    $this->load->model('Mshopproduct','mshopproduct');        
    $this->_memberships = array(2,3);
    $this->load->model('Mxmlvideo');
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
	
	$speaker_query = $this->db->get_where('users',array('id'=>$id));
	$speaker_name = '';	
	if ($speaker_query->num_rows()==1)
	{
		$row = $speaker_query->row();
		$speaker_name = $row->first_name.' '.$row->name;
	}
	
	$this->_data['page_title'] = __("CF_show").' : '.$speaker_name. ' - Confor.tv';	
	
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
	  if ( $this->_data['video_url']->num_rows()>0)
	  {
		$row = $this->_data['video_url']->row();
		$this->_data['video_blog_keyword'] = $row->tags;
		$this->_data['speaker_name'] = $row->first_name.' '.$row->name;
	  }	  	  
	  
      $query=$this->Mhome->get_view_by_id($id);
      if($query->num_rows()>0)
      {
        $row=$query->row();
        $title=$row->title;
        $last_viewed=$row->viewed;
        $viewed=$last_viewed+1;
        $this->Mhome->update_view_time($id,$viewed);
        $this->_data['page_title'] = $row->title . ' - confor.tv';
        $catid=$row->category;
        $page_offset=$this->uri->segment(5);
        $config['base_url'] = base_url().'index.php/video/play/'.$id.'/4/';
        $config['total_rows'] = $this->Mhome->count_video_record($catid);
        $config['per_page']='4';
        $config['uri_segment'] = 5;

        $config += config_pagination_style();

        $this->pagination->initialize($config);
        $this->_data['pagination'] = $this->pagination->create_links();
        $this->_data['video_by_cat'] = $this->Mhome->get_video_by_category($catid,$page_offset,$config['per_page']);
		
        $this->_data['pagination'] = $this->pagination->create_links();
        $meta = $this->Mmetadata->out_meta('video',$id);
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
    $keyword = '_';
    if($this->input->post('search'))
    {
      $keyword=$this->input->post('search_field');
    }

    //if($this->input->post('search'))
    //{                
    $num_per_page = $this->_setting['num_per_page_video'];
    //$keyword=$this->input->post('search_field');   				          
	$keyword=mysql_escape_string($keyword);
	
    $config['per_page'] = $num_per_page;
    $config['uri_segment'] = 5;            
    $config['total_rows'] = $this->Mhome->count_video_search($this->_data['lang'],$keyword);
    $config += config_pagination_style();	
    $this->_data['search_results']=$this->Mhome->search_paging($this->_data['lang'],$keyword, $num_per_page, 0);
	$keyword=stripcslashes($keyword);
    if (($keyword) && strlen($keyword)>0)
    {
      $config['base_url'] = site_url('video/search_paging').'/'.$keyword.'/'.$num_per_page.'/';  
    } else {
      $keyword = '_';
      $config['base_url'] = site_url('video/search_paging').'/'.$keyword.'/'.$num_per_page.'/';
    }

    $this->pagination->initialize($config);  
    $this->_data['link_html'] = $this->pagination->create_links();  	
    $this->_data['keyword'] = $keyword; 
    $title = $keyword .' - '.__("CF_search_vid").' - confor.tv';
    $this->_data['page_title'] = $title;
    $this->_load_view('home/search');                         
    //}
    // else
    // {                
    // $this->_load_view('home/search');   
    // }
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
    $config['base_url'] = site_url('video/search_paging').'/'.$keywords_to_search.'/'.$num_per_page.'/';        
    $config['per_page'] = $this->_setting['num_per_page_video'];	
    $config['uri_segment'] = 5;
    $config += config_pagination_style(); 
	$keywords_to_search=mysql_escape_string($keywords_to_search);
    if ($keywords_to_search == '_') $keywords_to_search = '';	
    $config['total_rows'] = $this->Mhome->count_video_search($this->_data['lang'],$keywords_to_search);		
    $this->pagination->initialize($config);
    $this->_data['search_results']=$this->Mhome->search_paging($this->_data['lang'],$keywords_to_search, $config['per_page'], $offset);     
    $this->_data['link_html'] = $this->pagination->create_links();
	$keywords_to_search=stripcslashes($keywords_to_search);
    $this->_data['keyword'] = $keywords_to_search;
    $title = $keywords_to_search .' - '.__("CF_search_vid").' - confor.tv';
    $this->_data['page_title'] = $title;
    $this->_load_view('home/search'); 
  }

  function search_tag()
  {
    $keyword = $this->uri->segment(3);
    $offset = $this->uri->segment(4);
    $config['per_page'] = $this->_setting['num_per_page_video'];				
    $config['uri_segment'] = 4;			
    $config['base_url'] = base_url().'index.php/video/search_tag/'.$keyword.'/';

	$keyword=mysql_escape_string($keyword);
    if ($keyword == '_') $keyword = '';
    $config += config_pagination_style();					

    $config['total_rows'] = $this->Mhome->count_video_search($this->_data['lang'],$keyword,true);
    $this->_data['search_results'] = $this->Mhome->search_paging($this->_data['lang'],$keyword, $config['per_page'], $offset, true);     
    $this->pagination->initialize($config);
    $this->_data['link_html'] = $this->pagination->create_links();
	$keyword=stripcslashes($keyword);
    $this->_data['keyword'] = $keyword;
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

    $this->db->select('videos.*, users.*');
    $this->db->where('lang',$this->_data['lang']);
    $this->db->where('MONTH(FROM_UNIXTIME(date))',$month);
    $this->db->where('YEAR(FROM_UNIXTIME(date))',$year);
    $this->db->limit($config['per_page'], $page_offset);
    $this->db->from('videos');		
    $this->db->join('users','users.id=videos.mem_id');
    set_order_from_setting('videos','order_video_field','order_video_sort','date');
    $query = $this->db->get();
    $this->_data['archives'] = $query->result_array();			

	$month_name_fr = array(
		'Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre'
	);	
	$month_name_en = array(
		'January','February','March','April','May','June','July','August','September','October','November','December'
	);	
	
	
	if ($this->_data['lang']=='fr')
	{
		$title = $month_name_fr[intval($month)-1].' '.$year;
	}
	else
	{
		$title = $month_name_en[intval($month)-1].' '.$year;				
	}	
	$this->_data['page_title'] = __("CF_arch").' - '.$title. ' - Confor.tv';
    $this->_load_view('home/archive_list');		
  }		
  function xmlvid($id)
  {
    header('Content-Transfer-Encoding: binary');    
    header('Content-Type: text/xml');
    header('Content-Disposition: filename="config.xml"');
    $setting = $this->Mxmlvideo->get_xmlvid();
    foreach($setting as $row)
    {
        $id_setting=$row['id'];
        $data['watermark_resource']=$row['watermark_resource'];
        $data['watermark_align_top']=$row['watermark_align_top'];
        $data['watermark_align_rl']=$row['watermark_align_rl'];
        $data['controls_show']=$row['controls_show'];
        $data['controls_hd']=$row['controls_hd'];
        $data['fullscreen_resizable']=$row['fullscreen_resizable'];
        $data['fullscreen_hideCursor']=$row['fullscreen_hideCursor'];
        $data['style_global']=$row['style_global'];
        $data['embed']=$row['embed'];
    }
    $video_path = $this->Mhome->get_video_by_id($id);
            if($video_path->num_rows()>0)
            {
                $row = $video_path->row();
                $data['vid_id']=$row->vid_id;
                $data['mem_id']=$row->mem_id;                
                $data['top_view_video'] = $row->vhash;
                $data['video_image']=$row->shash;
                $data['video_title']=$row->title;
                $data['description']=$row->description;
            } 
    $this->load->view('home/xmlvid',$data);
  }
}