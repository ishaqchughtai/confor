<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Email library Class
 *
 * @package		Confor
 * @subpackage	Libraries
 * @category	Email
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
 
class Email_lib 
{ 	
	
	function Email_lib()
	{
		$this->CI =& get_instance();
		//$this->CI->load->model('MUser');
	}

	function template_list()
	{
		$lg = $this->CI->uri->segment(3);
		if ($lg===FALSE)
		{
			$lg = $this->CI->_data['lang'];
		}
		if (lang_name_by_short_key($lg,TRUE)==FALSE)
		{
			$this->CI->_message('admin', __("CF_invaild_lang"), 'error');
		}
		$this->CI->_data['lg'] = $lg;
		$query = $this->CI->db->get_where('confor_email_templates',array('lang'=>$lg));
		$this->CI->_data['email_templates'] = $query->result_array();
		$this->CI->_load_view('admin/email/email_template_list'); 		
	}
	
	function template_edit()
	{
		$id = $this->CI->uri->segment(3);
		if ($id===FALSE)
		{
			$this->CI->_message('email', __("CF_error_occurred"), 'error');
		}
		
		$this->CI->form_validation->set_rules('name','template name','required');		
		$this->CI->form_validation->set_rules('subject','email subject','required'); 		
		$this->CI->form_validation->set_rules('body','email body','required');
		$this->CI->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');			
		
		$query = $this->CI->db->get_where('confor_email_templates',array('id'=>intval($id)));
		if ($query->num_rows()==1)
		{
			$this->CI->_data['row'] = $query->row();
			
			$this->CI->_data['path'][] = array(
			'name' => __("CF_email_tem"),
			'link' => site_url("email/template_list/".$this->CI->_data['row']->lang)
			);   
			$this->CI->_data['path'][] = array(
			'name' => __("CF_edit_email_tem"),
			'link' => '#'
			);	
			
			if($this->CI->input->post('submit')){
				if($this->CI->form_validation->run()==FALSE)
				{				
					$this->CI->_load_view('admin/email/email_template_edit');					
				}
				else
				{												
					$data = array(
						'name'=>$this->CI->input->post('name'),
						'subject'=>$this->CI->input->post('subject'),					
						'body'=>$this->CI->input->post('body')
					);
					$this->CI->db->where('id',$id);
					$this->CI->db->update('confor_email_templates',$data);									
					$this->CI->_message('email', __("CF_save_info_email_tem"), 'success',site_url("email/template_list").'/'.$this->CI->_data['row']->lang);
				}
			}
			else
			{
				$this->CI->_load_view('admin/email/email_template_edit');
			}
		}				
		else
		{
			$this->CI->_message('email', __("CF_error_occurred"), 'error');
		}
	}
	
}

/* End of file user_lib.php */ 
/* Location: ./system/application/libraries/user_lib.php */ 