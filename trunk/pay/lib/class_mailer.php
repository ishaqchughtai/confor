<?php
  /**
   * Class Mailer.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_mailer.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');

  class Mailer
  {
      private $sitename;
      private $sitemail;
      
      /**
       * Mailer::__construct()
       * 
       * @return
       */
      function __construct()
      {
          global $setup;
		  
          $this->sitemail = $setup->set['site_email'];
          $this->sitename = $setup->set['site_name'];
      }
	  
	  
      /**
       * Mailer::sendMail()
       * 
	   * Sends a various messages to users
       * @param mixed $to
       * @param mixed $subject
       * @param mixed $body
       * @return
       */
      function sendMail($to, $subject, $body)
      {
          $from = "From: " . $this->sitemail . " <" . $this->sitename . ">";
		  $headers = "MIME-Version: 1.0" . "\r\n";
		  $headers .= "Content-type:text/html;charset=iso-8859-1" . "\r\n";
		  $headers .= "From: <" . $this->sitemail . "> " . $this->sitename . "" . "\r\n";
		  $body = nl2br($body);
		
          return mail($to, $subject, $body, $headers);
      }
  }
  /* Initialize mailer object */
  $mailer = new Mailer();
?>