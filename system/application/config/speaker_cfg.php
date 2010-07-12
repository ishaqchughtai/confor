<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
/**
 * Speaker cofig
 *
 * @package		Confor
 * @subpackage	Config
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
/*
|-----------------------------------------------------------------------------
| User Authenication Configuration
|-----------------------------------------------------------------------------
|
| 'login_expiration' = number of seconds inactive before a login expires.
| 'remember_me_life' = number of seconds a "Remember Me" cookie lasts
|
*/
$config['login_expiration'] = 3600;		// 20 minutes
$config['remember_me_life'] = 7257600;	// 12 weeks

$config['spk_password_rule'] = 'trim|required|min_length[3]|max_length[12]|xss_clean';
$config['spk_email_rule'] = 'trim|required|valid_email|xss_clean';
$config['spk_user_rule'] = 'trim|required|min_length[3]|max_length[12]|xss_clean';



?>