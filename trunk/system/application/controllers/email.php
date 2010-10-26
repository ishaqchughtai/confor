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
        $this->load->model('send_mail');
        $this->load->helper('xemmex');
        $this->load->helper('string');	
    }

    function index()
    {        
        redirect(site_url("email/template_list"));
    }  	

    function template_list()
    {
        is_admin();            
        $this->_data['path'][] = array(
        'name' => __("CF_email_tem"),
        'link' => '#'
        );
        $this->email_lib->template_list();
    }

    function template_edit()
    {
        is_admin();		
        $this->email_lib->template_edit();
    }	
}