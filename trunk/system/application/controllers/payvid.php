<?php
/**
 * Vid Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Admin Video
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Payvid extends Admin_controller {
	var $vid_per_page = 10;
	
	function Payvid()
	{	
		parent::Admin_controller();		
		$this->load->library('video_upload_lib');
		$this->load->model('MPayvid'); 
		$this->load->helper('date');		
		$this->video_upload_lib->ajax_link = site_url('payvid/do_upload_ajax');
		$this->video_upload_lib->video_table_name = 'payvideos';
		$this->video_upload_lib->upload_folder = './payvids/';
	}
	
	function index()
	{        
		redirect(site_url("payvid/list_payvideo"));
	}  	
	
	function list_payvideo()
	{
		is_admin();            
				
		$this->_data['path'][] = array(
		'name' => __("CF_list_vid"),
		'link' => site_url("payvid/list_pay_video/")
		);   
								
		$page_offset = $this->uri->segment(3);
		
		$config['base_url'] = site_url('payvid/list_payvideo/').'/';
		$config['uri_segment'] = 3;
		$config['per_page']=$this->vid_per_page;
		$config += config_pagination_style();

		$config['total_rows'] = $this->db->count_all('payvideos');
		$this->_data['videos'] = $this->MPayvid->get_all($this->vid_per_page,$page_offset);
		
		$this->pagination->initialize($config);
		$this->_data['pagination'] = $this->pagination->create_links();
		$this->_data['video_cate'] = $category;
		$this->_load_view('vid/payvideo_list'); 
	}
		
	function new_payvideo()
	{
		is_admin();	
		
		$this->_data['path'][] = array(
		'name' => 'Paying video list',
		'link' => site_url("payvid/list_payvideo/")
		);  
		
		$this->_data['path'][] = array(
		'name' => 'Add new',
		'link' => '#'
		);				
				
		$this->video_upload_lib->init();		
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required');		
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
				
		if($this->input->post('submit'))
		{				
			$this->_data['uname'] = $this->input->post('uname');
			if($this->form_validation->run()==FALSE)
			{								
				$this->_load_view('vid/payvideo_new'); 
			}
			else
			{				
				if (strlen($this->_data['uname']) <= 1)
				{
					$this->_data['error'] = __("CF_havent_upload");
					$this->_load_view('vid/payvideo_new'); 			
					return;
				}				
				
				$data = array(	
					'code' => $this->video_upload_lib->make_unique_name(),
					'title'=>$this->input->post('title'),
					'description'=>$this->input->post('description'),					
					'tags'=>$this->input->post('keywords'),					
					'Date'=>time(),
					'approved'=>'1',
					'viewed'=>0
				);                    
				if ($this->video_upload_lib->add_new_video($data, $this->_data['uname']))
				{
					$this->_message('payvid', __("CF_upload_success"), 'success',site_url("payvid/list_payvideo").'/'.$lg);
				}
				else
				{
					$this->_data['error'] = __("CF_upload_expired");					
					$this->_load_view('vid/payvideo_new');
					return;
				}
			}
		}
		else
		{	
			$this->_load_view('vid/payvideo_new');
		}						           
	}
		
	function edit_payvideo($id)
	{
		is_admin();
								
		$this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');		
		$this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 		
		$this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');	
		
		$query=$this->MPayvid->get_by_vid($id);		
		if($query->num_rows()>0)
		{
			$this->_data['row'] = $query->row(); 
			$this->_data['path'][] = array(
			'name' => 'Video for sale',
			'link' => site_url("payvid/list_payvideo/")
			);  	
		}
		
		$this->_data['path'][] = array(
		'name' => 'Update paying video',
		'link' => '#'
		);
		
		if($this->input->post('submit')){
			if($this->form_validation->run()==FALSE)
			{				
				$this->_load_view('vid/payvideo_edit');
			}
			else
			{												
				$data = array(					
					'title'=>$this->input->post('title'),					
					'description'=>$this->input->post('description'),									
					'tags'=>$this->input->post('keywords'),			
					'approved'=>$this->input->post('approved')					
				);
				$this->MPayvid->update($data,$id);					
				$this->_message('payvid', __("CF_save_info"), 'success',site_url("payvid/list_payvideo/"));
			}
		}
		else
		{
			$this->_load_view('vid/payvideo_edit');
		}		 
	}	
	
	function delete_payvideo($id){
		is_admin();				
		if ($this->video_upload_lib->remove_video_by_vid_id($id))
		{			
			$this->_message('admin', __("CF_delete_vid"), 'success',site_url("payvid/list_payvideo/").'/'.$this->_data['lang']);			
		}
		else
		{
			$this->_message('admin', __("CF_error_occurred"), 'error', site_url("payvid/list_payvideo/").'/'.$this->_data['lang']);			
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

	function html_out($code)
	{
		is_admin();
		$data['row'] = $this->MPayvid->get_by_code($code);
		$this->load->view('vid/payvideo_html',$data);
	}
			
	function save_as_html($code)
	{
		is_admin();
		header("Content-Type: application/octet-stream;");
		header("Content-Transfer-Encoding: binary");
		header('Content-Disposition: filename="'.$code.'.html"');
		$data['row'] = $this->MPayvid->get_by_code($code);
		$this->load->view('vid/payvideo_html',$data);
	}
		
}