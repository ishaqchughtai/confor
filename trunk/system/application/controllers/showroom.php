<?php
class Showroom extends Admin_controller{
	
	function Showroom(){
		parent::Admin_controller();
		$this->load->model('Mshowroom');
		$this->load->helper('url');
		$this->load->library('session'); 
	}
	function add_new_images()
	{
		$this->form_validation->set_rules('txtLink','Images','trim|required');
		$this->form_validation->set_rules('speaker_email','Speaker','required');
		$this->form_validation->set_rules('vid_title','Video','required');
		
		$this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
		if($this->input->post('btnsubmit'))
		{                                         
			$txtLink=$this->input->post('txtLink');
			$this->_data['vid_id'] = $this->input->post('vid_id');
			$this->_data['vid_title'] = $this->input->post('vid_title');
			$this->_data['speaker'] = $this->input->post('speaker');
			if($this->form_validation->run()==FALSE)
			{
				$this->_load_view('admin/add_showroom_images');   
			}
			else
			{
				
				if($this->Mshowroom->add_image($this->_data['vid_id'], $txtLink)==TRUE)
				{                    
					$this->_message('admin', 'New image successfully added', 'success',site_url("showroom/add_new_images"));
				} 
			}
		}else
		{
			$this->_load_view('admin/add_showroom_images');   
		}  		
	}
	
	function add_new_images_for_speaker($Speaker='')
	{
		$this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
		$this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker); 
		$this->_load_view('admin/add_showroom_images'); 
	}
	
	function do_paging() {							
		if (! is_admin(FALSE)) 
		{
			$out['error'] = 'Only Admin can use this function';
			return $out;
		}	
		$num_per_page = $this->uri->segment(3);
		$page_offset = $this->uri->segment(4);
		$keyword = $this->input->post('keyword');
		$speaker_id = $this->input->post('speaker_id');
		
		if ($page_offset==FALSE) 
		{
			$page_offset = 0;
		}
		
		if ($num_per_page>0) 
		{
			$query = $this->Mshowroom->show_paging($speaker_id, $num_per_page, $page_offset, $keyword);
			if ($query->num_rows() > 0)
			{
				$out['vids'] = json_encode($query->result_array());
			} 
			else 
			{
				$out['error'] = 'Your searching did not match any rows. ';
			}
		} 
		else 
		{
			$out['error'] = 'Row each page must > 0';
		}
		
		$this->load->view('admin/get_video_json',$out);
	}
	
	function get_paging_html() {				
		if (! is_admin(FALSE))
		{
			return FALSE;
		}
		$num_per_page = $this->uri->segment(3);
		$page_offset = $this->uri->segment(4);
		$keyword = $this->input->post('keyword');
		$speaker_id = $this->input->post('speaker_id');
		
		$config['base_url'] = base_url()."index.php/showroom/do_paging/".$num_per_page;
		$config['per_page'] = $num_per_page;
		$config['uri_segment'] = 4;		
		
		$this->db->where("videos.mem_id", $speaker_id); 
		
		if (($keyword)&&(strlen($keyword)>0)) {
			$this->db->like("videos.title", $keyword);
			$this->db->from('videos');
			$config['total_rows'] =  $this->db->count_all_results();
		} else {
			$this->db->from('videos');
			$config['total_rows'] = $this->db->count_all_results();
		}
		$this->pagination->initialize($config);
		echo $this->pagination->create_links();	
	}	
	
	function submit_add_new_images($video_name='')
	{
		is_admin(); 
		$this->form_validation->set_rules('txtLink','Images','trim|required');
		$this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
		if($this->input->post('btnsubmit'))
		{                                         
			$txtLink=$this->input->post('txtLink');
			if($this->form_validation->run()==FALSE)
			{
				$this->add_new_images();                             
			}else
			{
				if($this->Mshowroom->add_image($video_name,$txtLink)==TRUE)
				{                    
					$this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
					$this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker=1);
					$this->_data['error'] = 'New image successfully added';         
					$this->_load_view('admin/add_showroom_images'); 
				} 
			}
		}else
		{
			$this->add_new_images();
		}  
	}
	function show_all_images()
	{
		
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
				$this->load->view('admin/upload_form_showroom', $error);
			}    
			else
			{
				$data = array('upload_data' => $this->upload->data());
				$data['Link_full'] = $this->upload->file_name;
				$this->load->view('admin/upload_success_showroom', $data);
			}
		}  
	}
}   
?>