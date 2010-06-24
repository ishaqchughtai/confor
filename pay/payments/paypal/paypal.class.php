<?php
  /**
   * Paypal Class.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: paypal.class.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
   class Paypal
  {
      private $vars;
      private $isTest = false;
      
      /**
       * Paypal::getLink()
       * 
       * @return
       */
      function getLink()
      {
          $url = $this->getPaypal();
          $link = 'https://' . $url . '/cgi-bin/webscr?';
          foreach ($this->vars as $item => $sub) {
              $link .= $sub[0] . '=' . $sub[1] . '&';
          }
          return $link;
      }
      
      /**
       * Paypal::showForm()
       * 
       * @return
       */
      function showForm()
      {
          $url = $this->getPaypal();
          $display = '<form action="https://' . $url . '/cgi-bin/webscr" method="post" target="_blank">' . "\n";
          
          foreach ($this->vars as $item => $sub) {
              $display .= '<input type="hidden" name="' . $sub[0] . '" value="' . $sub[1] . '" />' . "\n";
          }
          
          $display .= '<input type="image" style="width:122;border:0px;"';
          $display .= 'src="https://www.paypal.com/en_US/i/btn/btn_subscribeCC_LG.gif" name="submit"';
          $display .= 'alt="PayPal - The safer, easier way to pay online!" />';
          $display .= '</form>';
          
		  print $display;
      }
      
      /**
       * Paypal::addVar()
       * 
       * @param mixed $varName
       * @param mixed $value
       * @return
       */
      function addVar($varName, $value)
      {
          $this->vars[$varName][0] = $varName;
          $this->vars[$varName][1] = $value;
      }
      
      /**
       * Paypal::useSandBox()
       * 
       * @param mixed $value
       * @return
       */
      function useSandBox($value)
      {
          $this->isTest = $value;
      }
      
      /**
       * Paypal::getPaypal()
       * 
       * @return
       */
      private function getPaypal()
      {
          if ($this->isTest == true) {
              return 'www.sandbox.paypal.com';
          } else {
              return 'www.paypal.com';
          }
      }
  }
?>