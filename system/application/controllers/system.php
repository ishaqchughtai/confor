<?php
/**
 * System Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Setting
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class System extends Admin_controller {
		
	function System()
	{	
		parent::Admin_controller();		
		$this->load->helper('date');		
	}
	
	function index()
	{        
		redirect(site_url("system/setting"));
	}  	
	
	function setting()
	{
		is_admin();       
		
		$this->_data['path'][] = array(
		'name' => "System settings",
		'link' => '#'
		);
		
		$this->_data['order_conf_option'] = $this->MSystem->list_fields('tbloffice');
		$this->_data['order_video_option'] = $this->MSystem->list_fields('videos');
        $this->_data['order_blog_option'] = $this->MSystem->list_fields('tblblog');
		$this->_data['email'] = $this->_setting['email'];

		$this->form_validation->set_error_delimiters('<p class="not_error large"><span class="img"></span>','<span class="close"></span></p>');
		$this->form_validation->set_rules('num_per_page_video','('.'Videos per page'.')','required|numeric');
		$this->form_validation->set_rules('num_per_page_conf','('.'Conference per page'.')','required|numeric');
        $this->form_validation->set_rules('num_per_page_blog','('.'Blog per page'.')','required|numeric');        
		$this->form_validation->set_rules('email','('.'Email'.')','required|valid_email|trim');		
		
		if($this->input->post('update'))
		{
			// $this->_data['ratio'] = $this->input->post('ratio');
			// $this->_data['keep_ratio'] = $this->input->post('keep_ratio');
			//$this->_data['site_off'] = $this->input->post('site_off');					
			if($this->form_validation->run()==FALSE)
			{				
				$this->_data += $this->_setting;
				$this->_load_view('admin/system_setting');				
			}
			else
			{												
				$save_data = array(
					'site_off' => $this->input->post('site_off'),	
					'num_per_page_video' => $this->input->post('num_per_page_video'),					
					'num_per_page_conf' => $this->input->post('num_per_page_conf'),
					'num_per_page_blog' => $this->input->post('num_per_page_blog'),
					'order_conf_field' => $this->input->post('order_conf_field'),
					'order_video_field' => $this->input->post('order_video_field'),
					'order_blog_field' => $this->input->post('order_blog_field'),
					'order_conf_sort' => $this->input->post('order_conf_sort'),
					'order_video_sort' => $this->input->post('order_video_sort'),
                    'order_blog_sort' => $this->input->post('order_blog_sort'),
					'email' => $this->input->post('email')
				);		
				$this->MSystem->save($save_data);
				$this->_message('admin',__("CF_your_setting_saved"), 'success',site_url("system/setting"));
			}			
		}
		else
		{	
			//$settings = $this->MSystem->get_setting();
			//$this->_data += $settings;
			$this->_data += $this->_setting;
			$this->_load_view('admin/system_setting');
		}				
	}
		
}