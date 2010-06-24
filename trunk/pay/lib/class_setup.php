<?php
  /**
   * Class Setup.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_setup.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  class Setup
  {
      public $set = array();
      public $msgs = array();
      
      /**
       * Setup::__construct()
       * 
       * @return
       */
      function __construct()
      {
          $this->set = $this->getSettings();
      }
      
      
      /**
       * Setup::getSettings()
       * 
       * @return
       */
      private function getSettings()
      {
          global $db;
          $sql = "SELECT * FROM settings";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Setup::updateSettings()
       * 
       * @return
       */
      public function updateSettings()
      {
          global $db, $msgAlert, $showMsg;
		  if (isset($_POST['update_config']) && $_POST['update_config'] == 1) {
              if (empty($_POST['site_name']))
                  $this->msgs['site_name'] = "Please enter Site Name!";

              if (empty($_POST['site_url']))
                  $this->msgs['site_url'] = "Please enter Site Url!";
				  
              if (empty($_POST['site_email']))
                  $this->msgs['site_email'] = "Please enter valid Site Email address!";
              
			  if (empty($_POST['paypal_id']))
                  $this->msgs['paypal_id'] = "Please enter valid PayPal email address!";
				  
              if (empty($this->msgs)) {
				  
                  $data = array(
						  'site_name' => sanitize($_POST['site_name']), 
						  'site_url' => sanitize($_POST['site_url']),
						  'site_email' => sanitize($_POST['site_email']),
						  'site_slogan' => sanitize($_POST['site_slogan']), 
						  'paypal_id' => sanitize($_POST['paypal_id']),
						  'sandbox' => intval($_POST['sandbox']),
						  'reg_allowed' => intval($_POST['reg_allowed']),
						  'reg_verify' => intval($_POST['reg_verify']),
						  'user_limit' => intval($_POST['user_limit']),
						  'captcha' => intval($_POST['captcha']),
						  'currency' => sanitize($_POST['currency']),
						  'cur_symbol' => sanitize($_POST['cur_symbol']),
						  'desc' => sanitize($_POST['desc']),
						  'keywords' => sanitize($_POST['keywords'])
				  );
				  
				  $db->update("settings", $data);
				  if ($db->affected())
					  redirect_to("index.php?do=system&sub=config&action=1");

			  } else {
				  $showMsg = '<div class="msgError"><span>An error occurred while adding new transaction:</span><ul class="error">';
				  foreach ($this->msgs as $msg) {
					  $showMsg .= "<li>" . $msg . "</li>\n";
				  }
				  $showMsg .= '</ul></div>';
			  } 
		  }
			  
	  }
	  
      /**
       * Setup::getEmailTemplates()
       * 
       * @return
       */
      public function getEmailTemplates()
      {
          global $db;
          $sql = "SELECT * FROM email_templates";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Setup::getEmailTemplateById()
       * 
       * @param mixed $id
       * @return
       */
      public function getEmailTemplateById($id)
      {
          global $db;
          $sql = "SELECT * FROM email_templates WHERE id = '" . $id . "'";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Setup::updateEmailTemplate()
       * 
       * @param mixed $id
       * @return
       */
      public function updateEmailTemplate($id)
      {
          global $db, $msgAlert, $showMsg;
          
          if (isset($_POST['submit'])) {
              if ($_POST['name'] == "")
                  $this->msgs['name'] = "Template Title is required !";

              if ($_POST['subject'] == "")
                  $this->msgs['subject'] = "Template Subject is required !";

              if ($_POST['body'] == "")
                  $this->msgs['body'] = "Template Body is required !";
				  
              if (empty($this->msgs)) {
                  $data = array(
						  'name' => sanitize($_POST['name']), 
						  'subject' => sanitize($_POST['subject']),
						  'body' => $_POST['body']
				  );
                  
                  $db->update("email_templates", $data, "id='" . (int)$id . "'");
                  if ($db->affected()) {
                      redirect_to("index.php?do=system&sub=email&updated=1");
                  } else
                      $msgAlert = "<span>Alert!</span>Nothing to update.";
              } else {
                  $showMsg = '<div class="msgError"><span>An error occurred while updating template:</span><ul class="error">';
                  foreach ($this->msgs as $msg) {
                      $showMsg .= "<li>" . $msg . "</li>\n";
                  }
                  $showMsg .= '</ul></div>';
              }
          }
      }

	  /**
	   * Setup::sendNewsletter()
	   * 
	   * @return
	   */
	  public function sendNewsletter()
	  {
		  global $db, $msgOk, $msgError, $setup, $mailer;
		  
		  if (isset($_POST['send_newsletter']) && $_POST['send_newsletter'] == 1) {
			  $sql = "SELECT username, email FROM users WHERE notify = '1'";
			  $userrow = $db->fetch_all($sql);
			  
			  require_once("class_mailer.php");
			  
			  $mail_template = $this->getEmailTemplateById(4);
			  
			  $subject = (isset($_POST['subject'])) ? sanitize($_POST['subject']) : $mail_template['subject'];
			  
			  foreach ($userrow as $row) {
				  $body = str_replace(array(
										'[USERNAME]', '[URL]', '[SITE_NAME]'), array(
										$row['username'], $setup->set['site_url'], $setup->set['site_name']), $mail_template['body']
										);
			  
				  $mail = $mailer->sendMail($row['email'], $subject, $body);
			  }
			  unset($row);
			  if ($mail) {
				  $msgOk = "<span>Succes!</span>Newsletter sent successfuly!.";
			  } else {
				  $msgError = "<span>Error!</span>Newsletter was not sent successfuly!.";
			  }
		  }
	  }
	  
      /**
       * Setup::totalIncome()
       * 
       * @return
       */
      public function totalIncome()
      {
          global $db;
          $sql = "SELECT (SELECT SUM(rate_amount) FROM payments) AS total";
          $row = $db->first($sql);
          
          $total_income = number_format($row['total'], 2, '.', ',');
		  
		  return $total_income;
      }
	  
  }
?>