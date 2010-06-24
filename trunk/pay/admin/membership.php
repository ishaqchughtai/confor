<?php
  /**
   * Membership.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: membership.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php
  if (get('sub'))
      : $do = sanitize($_GET['sub']);
  
  switch ($do)
      : default:
      if (isset($_GET['added']) && $_GET['added'] == 1)
          $msgOk = "<span>Success!</span>New Membership added successfuly!";
  
  $memrow = $membership->getMemberships();
  
  include("inc/memsetup.php");
  break;
  
  case "payments":
      if (isset($_GET['added']) && $_GET['added'] == 1)
          $msgOk = "<span>Success!</span>New payment added successfuly";
      
      if (isset($_GET['sort']))
          : $sort_order = substr($_GET['sort'], 0, 3);
      if ($sort_order == 'DSC')
          $sort_order = 'DESC';
      $sort_query = substr($_GET['sort'], 4) . ' ' . $sort_order;
      
      $payrow = $membership->getPayments($sort_query);
      elseif (isset($_POST['search']))
          : $search = trim($_POST['search']);
      $search = $db->escape($_POST['search'], true);
      $payrow = $membership->getPayments(false, $search);
      else
          : $payrow = $membership->getPayments();
      endif;
      
      include("inc/payments.php");
      break;
      
      endswitch;
      endif;
?>