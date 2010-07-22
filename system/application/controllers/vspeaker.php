<?php
/**
 * VSpeaker Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class VSpeaker extends Speaker_controller
{
	var $vid_per_page = 10;
	
	function VSpeaker()	{
		parent::Speaker_controller();
		$this->load->helper(array('date', 'JSON'));	
		$this->load->model('Mshopproduct','mshopproduct');    	  
		$this->load->library('video_upload_lib');
		$this->load->model('Mvid');
		$this->video_upload_lib->ajax_link = site_url('vspeaker/do_upload_ajax');
		//$this->_memberships = array(2,3);
	}	  
	
	function index() 
	{
		redirect(site_url("vspeaker/list_video_conference"));
	}
	
	
	function list_video_conference()
	{
		$user_data = is_speaker();
		
		$this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
		$this->_data['header']['page'] = '/speaker/header_panel';		
		
		$lg = $this->uri->segment(3);			
		if (! $lg)
		{
			$lg = $this->_data['lang'];
		}
		$this->_data['lg'] = $lg;
		
		if (lang_name_by_short_key($lg,TRUE)==FALSE)
		{
			$this->_message('vspeaker', __("CF_invaild_lang"), 'error',site_url("vspeaker/list_video_conference").'/'.$this->_data['lang']);
		}		
		
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("vspeaker/list_video_conference/".$lg)
		);   
						
		$category = $this->uri->segment(4);
		$page_offset = $this->uri->segment(5);

		if (!$category)
		{
			$category = 0;							
		}

		$config['base_url'] = site_url('vspeaker/list_video_conference').'/'.$lg.'/'.$category.'/';		
		$config += config_pagination_style();		
		$config['uri_segment'] = 5;
		$config['per_page']=$this->vid_per_page; 

		if($category == 0)
		{
			$config['total_rows'] = $this->Mvid->count_by_category($lg, 0, $user_data['speaker_id']); 
			$this->_data['videos'] = $this->Mvid->get_all_by_speaker_id($lg,$this->vid_per_page,$page_offset,$user_data['speaker_id'],0);
		}
		else
		{
			$config['total_rows'] = $this->Mvid->count_by_category($lg, $category, $user_data['speaker_id']);
			$this->_data['videos'] = $this->Mvid->get_by_category_speaker($lg, $category,$this->vid_per_page,$page_offset,$user_data['speaker_id'],0);
		} 
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_data['video_cate'] = $category;
		$this->_load_view('vspeaker/video_conference_list'); 
	}
		
	function new_video_conference()
	{
		$user_data = check_membership();
		$lg = $this->input->post('lg');
		if (! $lg)
		{
			$lg = $this->_data['lang'];
		}
		$this->_data['lg'] = $lg;
		
		if (lang_name_by_short_key($lg,TRUE)==FALSE)
		{
			$this->_message('vspeaker', __("CF_invaild_lang"), 'error',site_url("vspeaker/list_video_conference"));
		}
		
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("vspeaker/list_video_conference/".$lg)
		);  
		
		$this->_data['path'][] = array(
		'name' => __("CF_admin_new_vid"),
		'link' => '#'
		);				
				
		$this->video_upload_lib->init();
		
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required');
		$this->form_validation->set_rules('video_cate',strtolower(__("CF_cate_vid")),'required');
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
				
		if($this->input->post('submit'))
		{				
			$this->_data['uname'] = $this->input->post('uname');
			$this->_data['video_cate'] = $this->input->post('video_cate');			

			if($this->form_validation->run()==FALSE)
			{								
				$this->_load_view('vspeaker/new_video'); 
			}
			else
			{				
				if (strlen($this->_data['uname']) <= 1)
				{
					$this->_data['error'] = __("CF_havent_upload");
					$this->_load_view('vspeaker/new_video'); 			
					return;
				}				
				
				$data = array(
					'mem_id'=>$user_data['speaker_id'],
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
					$this->_message('vspeaker', __("CF_upload_success"), 'success',site_url("vspeaker/list_video_conference").'/'.$lg);
				}
				else
				{
					$this->_data['error'] = __("CF_upload_expired");
					$this->_load_view('vspeaker/new_video');
					return;
				}
			}
		}
		else
		{	
			$this->_load_view('vspeaker/new_video');
		}						           
	}
		
	function edit_video_conference($id)
	{		
		$user_data = check_membership();					
				
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');		
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 		
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
				
		//$this->_data['vid_edit']=$this->Mvid->get_info_by_vid_speaker($id, $user_data['speaker_id']);
		$query=$this->Mvid->get_info_by_vid_speaker($id, $user_data['speaker_id']);
		if($query->num_rows()>0)
		{
			$this->_data['row'] = $query->row(); 
			$this->_data['path'][] = array(
			'name' => __("CF_list_vid"),
			'link' => site_url("vspeaker/list_video_conference/".$this->_data['row']->lang)
			);  			
		}
		
		$this->_data['path'][] = array(
		'name' => __("CF_edit_video_admin"),
		'link' => '#'
		);		
		
		
		if($this->input->post('submit')){
			if($this->form_validation->run()==FALSE)
			{				
				$this->_load_view('vspeaker/edit_video_conference');
			}
			else
			{												
				$data = array(
					'mem_id'=>$user_data['speaker_id'],
					'title'=>$this->input->post('title'),					
					'description'=>$this->input->post('description'),				
					'category'=>$this->input->post('video_cate'),
					'tags'=>$this->input->post('keywords'),			
					'approved'=>$this->input->post('approved'),
					'lang'=>$this->input->post('lg')
				);
				$this->Mvid->update_conference($data,$id);									
				$this->_message('vspeaker', __("CF_save_info"), 'success',site_url("vspeaker/list_video_conference").'/'.$this->input->post('lg'));
			}
		}
		else
		{
			$this->_load_view('vspeaker/edit_video_conference');
		}		 
	}	
	
	function delete_video_conference($id){
		//$user_data = is_speaker();				
		$user_data = check_membership();
		if ($this->video_upload_lib->remove_video_by_vid_id($id, $user_data['speaker_id']))
		{			
			$this->_message('vspeaker', __("CF_delete_vid"), 'success',site_url("vspeaker/list_video_conference"));			
		}
		else
		{
			$this->_message('vspeaker', __("CF_error_occurred"), 'error', site_url("vspeaker/list_video_conference"));
		}		
	}	
	
	function do_upload_ajax()
	{		
		if (! is_speaker(FALSE)) 
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
?>
