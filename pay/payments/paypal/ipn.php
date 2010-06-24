<?php
  /**
   * Ipn.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: ipn.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
  
  if (isset($_POST['payment_status'])) {
      require_once("../../init.php");
      
      $req = 'cmd=_notify-validate';
      
      foreach ($_POST as $key => $value) {
          $value = urlencode(stripslashes($value));
          $req .= '&' . $key . '=' . $value;
      }
      
      $url = ($setup->set['sandbox'] == '1') ? 'www.sandbox.paypal.com' : 'www.paypal.com';
      
      $header = "POST /cgi-bin/webscr HTTP/1.0\r\n";
      $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
      $header .= "Content-Length: " . strlen($req) . "\r\n\r\n";
      $fp = fsockopen($url, 80, $errno, $errstr, 30);
      
      
      $payment_status = $_POST['payment_status'];
      $receiver_email = $_POST['business'];
      $payment_gross = $_POST['mc_gross'];
      $payment_currency = $_POST['mc_currency'];
      $item_number = $_POST['item_number'];
      $mc_gross = $_POST['mc_gross'];
      $txn_id = $_POST['txn_id'];
      
      list($rateID, $userID) = explode('_', $item_number);
      
      $rate = $membership->getRateById($rateID);
      $getxn_id = $membership->verifyTxnId($txn_id);
      $user = $session->getUserById($userID);
      
      if (!$fp) {
          echo $errstr . ' (' . $errno . ')';
      } else {
          fputs($fp, $header . $req);
          
          while (!feof($fp)) {
              $res = fgets($fp, 1024);
              
              if (strcmp($res, "VERIFIED") == 0) {
                  if (preg_match('/Completed/', $payment_status)) {
                      if ($receiver_email == $setup->set['paypal_id'] && $payment_gross == $rate['amount'] && $getxn_id == true) {
                          
						  $sql = "SELECT * FROM rates WHERE id='" . $rateID . "'";
                          $row = $db->first($sql);
                          
                          $data = array(
										'membership_id' => $row['membership_id'], 
										'txn_id' => $txn_id, 
										'user_id' => $userID, 
										'rate_id' => $rateID, 
										'rate_amount' => $mc_gross, 
										'date' => "NOW()", 
										'status' => 1
										);
                          
                          $db->insert("payments", $data);
						  
						  $udata['membership_id'] = $row['membership_id'];
						  $db->update("users", $udata, "id='" . (int)$userID . "'");
						  
						  require_once(MSPATH . "lib/class_mailer.php");
						  $mail_template = $setup->getEmailTemplateById(5);
                          
                          $body = str_replace(array('[USERNAME]', '[ITEMNAME]', '[PRICE]', '[STATUS]', '[URL]'), array($user['username'], $rate['title'], $setup->set['cur_symbol'] . $rate['amount'] . $setup->set['currency'], $payment_status, $setup->set['site_url'] . "/admin"), $mail_template['body']);
                          
						  $mail = $mailer->sendMail($setup->set['site_email'], $mail_template['subject'], $body);
                      }
                  }
              } elseif (strcmp($res, "INVALID") == 0) {
				  
                  $sql = "SELECT * FROM rates WHERE id='" . $rateID . "'";
                  $row = $db->first($sql);
                  
                  $data = array(
								'membership_id' => $row['membership_id'], 
								'txn_id' => $txn_id, 
								'user_id' => $userID, 
								'rate_id' => $rateID, 
								'rate_amount' => $mc_gross, 
								'date' => "NOW()", 
								'status' => 0
								);
                  
                  $db->insert("payments", $data);
				  
				  require_once(MSPATH . "lib/class_mailer.php");
				  $mail_template = $setup->getEmailTemplateById(6);
                  
                  $body = str_replace(array('[USERNAME]', '[ITEMNAME]', '[PRICE]', '[STATUS]'), array($user['username'], $rate['title'], $setup->set['cur_symbol'] . $rate['amount'] . $setup->set['currency'], $payment_status), $mail_template['body']);
                  
                  $mail = $mailer->sendMail($setup->set['site_email'], $mail_template['subject'], $body);
              }
          }
          fclose($fp);
      }
  }
?>