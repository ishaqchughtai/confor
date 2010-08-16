<?php
/**
 * Vid Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Admin Video
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Email extends Admin_controller {	
	
	function Email()
	{	
		parent::Admin_controller();		
		$this->load->library('email_lib');
		$this->load->helper('date');		
	}
	
	function index()
	{        
		redirect(site_url("email/list_email_template"));
	}  	
	
	function template_list()
	{
		is_admin();            
		$this->email_lib->template_list();
	}
		
	function template_edit()
	{
		is_admin();			
		$this->email_lib->template_edit();
	}
	
	function test()
	{
		$ar_key = array('[SITE_NAME]', '[USERNAME]');
		$ar_value = array('Confor.tv','yugi3000');
		// gold account update
		$x = email_template_parse('en','GAU',$ar_key,$ar_value);
		print_r($x);
	}
	
}