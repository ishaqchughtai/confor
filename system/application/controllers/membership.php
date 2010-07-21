<?php
/**
 * Membership Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Admin Membership
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Membership extends Admin_controller {
	
	function Membership()
	{	
		parent::Admin_controller();						
		$this->load->helper('date');		
		$this->load->model('Mfunction');
	}
	
	function index()
	{        
		redirect(site_url("membership/function_manager"));
	}  	
	
	function function_manager()
	{		
		is_admin();
		$this->_data['path'][] = array(
		'name' => "Membership",
		'link' => site_url("membership")
		);
		
		$this->_data['path'][] = array(
		'name' => "Functions management",		
		'link' => '#'
		);
		
		$this->_load_view('admin/membership/functions');
	}
	
	function update_membership_ajax()
	{
		if (! is_admin(FALSE)) 
		{
			echo '0';
			return;
		}			
		if (!$this->input->post('function_id')) {echo '0';return;}
		//if (!$this->input->post('memberships')) {echo '0';return;}
		$function_id = $this->input->post('function_id');
		$memberships = $this->input->post('memberships');
		if ($this->Mfunction->add_membership_to_function($function_id, $memberships))
		{	
			echo '1';
		}
		else
		{
			echo '0';
		}
	}
	
	function mem_of_function_ajax($id)
	{		
		if (! is_admin(FALSE)) 
		{
			echo '0';
			return;
		}			
		echo $this->Mfunction->get_memberships_of_function(intval($id));
	}
	
				
}