<?php
/* *****************************************
	*****OPEN SOURCE CODE CREDITS:					*
	*****CodeIgniter:	http://codeigniter.com/					*
 	*******************************************/
/*
	Send mail page
*/	
class Send_mail extends Model
{
	function __construct()
	{
		parent::Model();
		$this->load->library('email');	
	}
	
	/*
		$mail_type there are 2 types: html and text
		$name_from: name of sender
		$to: string or single array example $to = array('email1','email2');
	*/
	function send($mail_type='html', $from, $name_from='', $to, $subject, $content)
	{
		$this->email->clear();
		$config['charset'] = $this->config->item('charset');
		$config['mailtype'] =$mail_type;
		$config['validate'] =TRUE;
		$this->email->initialize($config);
		if( $name_from=='' ) $this->email->from($from);
		else $this->email->from($from, $name_from);
		$this->email->to($to);
		$this->email->subject($subject);
		$this->email->message($content);
		if ( ! $this->email->send())  return false;
		return true;
	}
}
?>