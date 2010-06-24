<?php
  /**
   * Subscribe.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: subscribe.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  if ($_POST['rate_id'] == null || !is_numeric($_POST['rate_id'])) {
      die();
  }
?>
<?php
    if ($rate['id'] != $_POST['rate_id']) {
      die('Invalid Membership Rate.');
  }
  
  require_once('paypal.class.php');
  $payPal = new Paypal;
  
  if ($setup->set['sandbox'] == '1') {
      $payPal->useSandBox(true);
  }
  
  $payPal->addVar('business', $setup->set['paypal_id']);
  $payPal->addVar('cmd', '_xclick-subscriptions');
  $payPal->addVar('currency_code', $setup->set['currency']);
  $payPal->addVar('item_name', $setup->set['site_name'] . ' Subscription');
  $payPal->addVar('item_number', $_POST['rate_id'] . '_' . $session->userinfo['id']);
  $payPal->addVar('a3', $rate['amount']);
  $payPal->addVar('p3', $rate['term']);
  $payPal->addVar('t3', $rate['term_c']);
  
  if ($rate['automatic'] == 1) {
      $payPal->addVar('src', '1');
      $payPal->addVar('sr1', '1');
  }
  
  $payPal->addVar('no_note', '1');
  
  $payPal->addVar('rm', '2');
  $payPal->addVar('notify_url', $setup->set['site_url'] . '/payments/paypal/ipn.php');
  $payPal->addVar('cancel_return', $setup->set['site_url'] . '/payments/paypal/ipn.php');
  $payPal->addVar('return', $setup->set['site_url'] . '/index.php?do=profile');
  
  $payPal->showForm();
?>