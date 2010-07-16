<?php
/**
 * Vid Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Admin Video
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Vid extends Admin_controller {
	var $vid_per_page = 10;
	
	function Vid()
	{	
		parent::Admin_controller();		
		$this->load->library('video_upload_lib');
		$this->load->model('Mvid'); 
		$this->load->helper('date');		
		$this->video_upload_lib->ajax_link = site_url('vid/do_upload_ajax');
	}
	
	function index()
	{        
		redirect(site_url("vid/list_video_conference"));
	}  	
	
	function list_video_conference()
	{
		is_admin();            
		
		$lg = $this->uri->segment(3);	
		if (! $lg)
		{
			$lg = $this->_data['lang'];
		}
		if (lang_name_by_short_key($lg,TRUE)==FALSE)
		{
			$this->_message('admin', __("CF_invaild_lang"), 'error',site_url("vid/list_video_conference").'/'.$this->_data['lang']);
		}
		
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("vid/list_video_conference/".$lg)
		);   
		
		$this->_data['lg'] = $lg;
		
		$category = $this->uri->segment(4);		
		$page_offset = $this->uri->segment(5);

		if (!$category)
		{
			$category = 0;							
		}

		$config['base_url'] = base_url().'index.php/vid/list_video_conference/'.$lg.'/'.$category.'/';
		$config['full_tag_open'] = '<li>';        
		$config['full_tag_close'] = '</li>'; 
		$config['next_link'] = __("CF_next");
		$config['prev_link'] = __("CF_previous");
		$config['last_link'] = __("CF_last");
		$config['first_link'] = __("CF_first");	
		$config['uri_segment'] = 5;
		$config['per_page']=$this->vid_per_page;
		// $config['cur_tag_open'] = '<li class="selected">';
		// $config['cur_tag_close'] = '</li>'; 

		if($category == 0)
		{
			$config['total_rows'] = $this->Mvid->count_by_category($lg); 
			$this->_data['videos'] = $this->Mvid->get_all($lg,$this->vid_per_page,$page_offset,0);
		}
		else
		{
			$config['total_rows'] = $this->Mvid->count_by_category($lg,$category);
			$this->_data['videos'] = $this->Mvid->get_by_category($lg, $category,$this->vid_per_page,$page_offset,0);
		} 
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_data['video_cate'] = $category;
		$this->_load_view('vid/video_conference_list'); 
	}
		
	function new_video_conference()
	{
		is_admin();	
		$lg = $this->input->post('lg');
		if (! $lg)
		{
			$lg = $this->_data['lang'];
		}
		
		// if (lang_name_by_short_key($lg,TRUE)==FALSE)
		// {
			// $this->_message('admin', __("CF_invaild_lang"), 'error',site_url("vid/list_video_conference"));
		// }
		
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("vid/list_video_conference/".$lg)
		);  
		
		$this->_data['path'][] = array(
		'name' => __("CF_admin_new_vid"),
		'link' => '#'
		);				
		
		$this->_data['lg'] = $lg;
		$this->video_upload_lib->init();

		$this->form_validation->set_rules('speaker_email',strtolower(__("CF_one_speaker")),'required');
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required');
		$this->form_validation->set_rules('video_cate',strtolower(__("CF_cate_vid")),'required');
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
				
		if($this->input->post('submit'))
		{				
			$this->_data['uname'] = $this->input->post('uname');
			$this->_data['video_cate'] = $this->input->post('video_cate');
			$this->_data['speaker_id'] = $this->input->post('speaker');

			if($this->form_validation->run()==FALSE)
			{								
				$this->_load_view('vid/new_video_admin'); 
			}
			else
			{				
				if (strlen($this->_data['uname']) <= 1)
				{
					$this->_data['error'] = __("CF_havent_upload");
					$this->_load_view('vid/new_video_admin'); 			
					return;
				}				
				
				$data = array(
					'mem_id'=>$this->input->post('speaker'),
					'title'=>$this->input->post('title'),					
					'description'=>$this->input->post('description'),
					'category'=>$this->input->post('video_cate'),
					'tags'=>$this->input->post('keywords'),
					'lang'=>$lg,
					'Date'=>time(),
					'approved'=>'1',
					'viewed'=>0
				);                    
				if ($this->video_upload_lib->add_new_video($data, $this->_data['uname']))
				{
					$this->_message('admin', __("CF_upload_success"), 'success',site_url("vid/list_video_conference").'/'.$lg);
				}
				else
				{
					$this->_data['error'] = __("CF_upload_expired");					
					$this->_load_view('vid/new_video_admin');
					return;
				}
			}
		}
		else
		{	
			$this->_load_view('vid/new_video_admin');
		}						           
	}
		
	function edit_video_conference($id)
	{
		is_admin();
								
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');		
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 		
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');	
		
		$query=$this->Mvid->get_info_by_id($id);		
		if($query->num_rows()>0)
		{
			$this->_data['row'] = $query->row(); 
			$this->_data['path'][] = array(
			'name' => __("CF_list_vid"),
			'link' => site_url("vid/list_video_conference/".$this->_data['row']->lang)
			);  	
		}
		
		$this->_data['path'][] = array(
		'name' => __("CF_edit_video_admin"),
		'link' => '#'
		);
		
		if($this->input->post('submit')){
			if($this->form_validation->run()==FALSE)
			{				
				$this->_load_view('vid/edit_video_conference');
			}
			else
			{												
				$data = array(
					'mem_id'=>$this->input->post('speaker'),
					'title'=>$this->input->post('title'),					
					'description'=>$this->input->post('description'),				
					'category'=>$this->input->post('video_cate'),
					'tags'=>$this->input->post('keywords'),			
					'approved'=>$this->input->post('approved'),
					'lang'=>$this->input->post('lg')
				);
				$this->Mvid->update_conference($data,$id);									
				$this->_message('admin', __("CF_save_info"), 'success',site_url("vid/list_video_conference").'/'.$this->input->post('lg'));
			}
		}
		else
		{
			$this->_load_view('vid/edit_video_conference');
		}		 
	}	
	
	function delete_video_conference($id){
		is_admin();				
		if ($this->video_upload_lib->remove_video_by_vid_id($id))
		{			
			$this->_message('admin', __("CF_delete_vid"), 'success',site_url("vid/list_video_conference").'/'.$this->_data['lang']);			
		}
		else
		{
			$this->_message('admin', __("CF_error_occurred"), 'error', site_url("vid/list_video_conference").'/'.$this->_data['lang']);			
		}		
	}	
	
	function setting()
	{
		is_admin();
		
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("vid/list_video_conference").'/'.$this->_data['lang']
		);
		
		$this->_data['path'][] = array(
		'name' => __("CF_video_setting"),		
		'link' => '#'
		);

		$this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
		$this->form_validation->set_rules('allowed_ext','('.__("CF_allowed_ext").')','required');
		$this->form_validation->set_rules('resize_w','('.__("CF_resize_w").')','required|numeric');
		$this->form_validation->set_rules('resize_h','('.__("CF_resize_h").')','required|numeric');
		$this->form_validation->set_rules('thumb_w','('.__("CF_thumb_w").')','required|numeric');
		$this->form_validation->set_rules('thumb_h','('.__("CF_thumb_h").')','required|numeric');
		
		$this->form_validation->set_rules('max_upload_size','('.__("CF_max_size").')','required|numeric');		
		$this->form_validation->set_rules('vbrate','(vbrate)','required|numeric');
		$this->form_validation->set_rules('sbrate','(sbrate)','required|numeric');
		$this->form_validation->set_rules('srate','(srate)','required|numeric');
		
		if($this->input->post('update'))
		{
			$this->_data['ratio'] = $this->input->post('ratio');
			$this->_data['keep_ratio'] = $this->input->post('keep_ratio');
			$this->_data['is_resize'] = $this->input->post('is_resize');
			if($this->form_validation->run()==FALSE)
			{				
				$this->_load_view('vid/setting');				
			}
			else
			{												
				$save_data = array(
					'allowed_ext' => $this->input->post('allowed_ext'),					
					'ratio' => $this->input->post('ratio'),
					'max_upload_size' => $this->input->post('max_upload_size'),
					'vbrate' => $this->input->post('vbrate'),
					'sbrate' => $this->input->post('sbrate'),
					'srate' => $this->input->post('srate'),
					'resize_w' => $this->input->post('resize_w'),
					'resize_h' => $this->input->post('resize_h'),
					'thumb_w' => $this->input->post('thumb_w'),
					'thumb_h' => $this->input->post('thumb_h'),
					'keep_ratio' => $this->input->post('keep_ratio'),
					'is_resize' => $this->input->post('is_resize')
				);		
				$this->video_upload_lib->set_video_setting($save_data);
				$this->_message('admin',__("CF_save_setting"), 'success',site_url("vid/list_video_conference").'/'.$this->_data['lang']);
			}			
		}
		else
		{		
			$settings = $this->video_upload_lib->get_video_setting();
			$this->_data += $settings;
			$this->_load_view('vid/setting');
		}
	}
	
	function do_upload_ajax()
	{
		if (! is_admin(FALSE)) 
		{
			echo '0';
			return;
		}		
		$this->video_upload_lib->init();
		$this->video_upload_lib->do_upload_ajax();
	}
	
	function keyword_check($Keywords)
	{
		$Key = explode(" ", $Keywords);					
		if(count($Key)>4)
		{
			$this->form_validation->set_message('keyword_check', __("CF_the").'%s'.__("CF_field_max")); 
			return FALSE ;           
		}
		else
		{
			return TRUE ;
		}
	}		
		
}