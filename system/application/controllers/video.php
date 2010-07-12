<?php

class Video extends Frontend_controller 
{

	function Video()
	{
		parent::Frontend_controller();
		$this->load->model('Mvconference');
		$this->_container = 'container';    
		$this->load->helper('date');
		$this->load->model('Remember_me');
		$this->load->library('vid_lib');		
		$this->_memberships = array(2,3);
	}

	function do_upload_ajax()
	{
		$this->vid_lib->init_uploader();
		$this->vid_lib->do_upload_ajax_user();	
	}
	
	//add new video
	function add_video()
	{
		//$userData = is_speaker();
		//$userData = check_membership(array(2,3));
        
		$userData = check_membership();
		$speaker_id = $userData['speaker_id'];

		$this->_data['path'][] = array(
			'name' => __("CF_your_vid"),
			'link' => site_url("video/your_video").'/'.$speaker_id.'/5'
		);			
		$this->_data['path'][] = array(
			'name' => __("CF_add_vid"),
			'link' => site_url("video/add_video")
        );		
		
		$this->vid_lib->init_uploader();		
		
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 
		$this->form_validation->set_rules('video_cate',strtolower(__("CF_cate_vid")),'required');
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->_data['query']=$this->Mvconference->get_category();                  

		if($this->input->post('submit'))
		{
			$this->_data['vname'] = $this->input->post('vname');
			$this->_data['video_cate'] = $this->input->post('video_cate');			
			if (strlen($this->_data['vname']) <= 1)
			{
				$this->_data['error'] = __("CF_havent_upload");
			}
				
			if($this->form_validation->run()==FALSE)
			{

				//$this->_data['error'] = "Can not create new video !";
				$this->_load_view('speaker/add_video');   
			}
			else
			{				 
				if (strlen($this->_data['vname']) <= 1)
				{					
					$this->_load_view('speaker/add_video');
					return;
				}        
				$dateupload= NOW();
				$data = array(
					'mem_id'=>$speaker_id,
					'title'=>$this->input->post('title'),
					'description'=>$this->input->post('description'),
					'category'=>$this->input->post('video_cate'),
					'tags'=>$this->input->post('keywords'),
					'Date'=>$dateupload,
					'vhash'=>$this->_data['vname'].'.flv',
					'shash'=>$this->_data['vname'].'.jpg',
					'approved'=>1,
					'viewed'=>0          
				);
				$this->Mvconference->add_new_video($data);
				//$this->list_video_conference();      
				$this->_message('video', __("CF_upload_success"), 'success',site_url("video/your_video").'/'.$speaker_id."/5");
			}
		}
		else
		{  
			$this->_load_view('speaker/add_video');
		}                       
	}
	
    function delete_video_conference($speaker, $id){
		$userData = is_speaker();
		$speaker_id = $userData['speaker_id'];
		if ($speaker_id != $speaker) redirect('/');
		if(is_nan((float)$id)) redirect(site_url("/"));
		
		$delete_data = $this->Mvconference->delete_video($id);
		if ($delete_data)
		{
			$this->vid_lib->delete_old_data($delete_data['vhash'],$delete_data['shash']);
			$this->_message('video', __("CF_delete_vid"), 'success',site_url("video/your_video").'/'.$speaker_id."/5");
		}
		else
		{
			$this->_message('video', __("CF_error_occurred"), 'error',site_url("video/your_video").'/'.$speaker_id."/5");
		}
    }	

	//get all video of a speaker
	function your_video()
	{                    
		$userData = is_speaker();		
		
		$this->_data['path'][] = array(
			'name' => __("CF_your_vid"),
			'link' => '#'
        );	
		
		$id = $this->uri->segment(3);
		$per_page = $this->uri->segment(4);
		$offset = $this->uri->segment(5);

		$config['uri_segment'] = 5;
		$config['base_url'] = base_url().'index.php/video/your_video/'.$id.'/'.$per_page;
		$config['total_rows'] = $this->Mvconference->count_video_speaker($id);
		$config['per_page']=$per_page;

		$config['full_tag_open'] = '<li>';        
		$config['full_tag_close'] = '</li>'; 
		$config['next_link'] = 'Next >';
		$config['prev_link'] = '< Previous';
		$config['last_link'] = 'Last >>';
		$config['first_link'] = '<< First';

		$this->pagination->initialize($config);
		$this->_data['your_vid'] = $this->Mvconference->video_speaker($id,$per_page,$offset);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_load_view('speaker/your_video');
	}

	//edit video of user
	function edit_video_conference($speaker,$id) 
	{        
		$userData = check_membership();
		$speaker_id = $userData['speaker_id'];
		if ($speaker_id != $speaker) redirect('/');
		if(is_nan((float)$id)) redirect(site_url("/"));
	
		$this->_data['path'][] = array(
			'name' => __("CF_your_vid"),
			'link' => site_url("video/your_video").'/'.$speaker.'/5'
		);	
		$this->_data['path'][] = array(
			'name' => __("CF_edit_your_vid"),
			'link' => '#'
		);		
		
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->_data['query']=$this->Mvconference->get_video_conference_by_id($id);	
		$this->_data['speaker_id'] = $speaker_id;
		
		if($this->input->post('submit')){					
			if($this->form_validation->run()==FALSE)
			{				
				$this->_load_view('speaker/edit_video_conference');
			}
			else
			{												
				$data = array(
				'title'=>$this->input->post('title'),
				'description'=>$this->input->post('description'),
				'category'=>$this->input->post('video_cate'),
				'tags'=>$this->input->post('keywords')				
				);
				$this->Mvconference->update_conference($data,$id);
				$this->_message('video', __("CF_mess_reg"), 'success',site_url("video/your_video").'/'.$speaker_id."/5");
			}
		}
		else
		{
			$this->_load_view('speaker/edit_video_conference');
		}		
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

		$config['full_tag_open'] = '<li>';        
		$config['full_tag_close'] = '</li>'; 
		$config['next_link'] = 'Next >';
		$config['prev_link'] = '< Previous';
		$config['last_link'] = 'Last >>';
		$config['first_link'] = '<< First';
		$this->_data['video_speaker'] = $this->Mvconference->get_video_by_speaker($id,$per_page,$offset); 
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_load_view('home/get_video_by_speaker'); 
	}

	function archives($month,$year)
	{
		$month = $this->uri->segment(3);
		$year = $this->uri->segment(4);
		$per_page = $this->uri->segment(5);
		$offset = $this->uri->segment(6);


		$config['uri_segment'] = 6;
		$config['base_url'] = base_url().'index.php/video/archives/'.$month.'/'.$year.'/'.$per_page;
		$config['total_rows'] = $this->MVideo->count_record_archives($month,$year);
		$config['per_page']=$per_page;

		$config['full_tag_open'] = '<li>';        
		$config['full_tag_close'] = '</li>'; 
		$config['next_link'] = 'Next >';
		$config['prev_link'] = '< Previous';
		$config['last_link'] = 'Last >>';
		$config['first_link'] = '<< First';
		$this->_data['video_archives'] = $this->MVideo->get_video_by_archives($month,$year,$per_page,$offset); 
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_load_view('home/archives');
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


}