<?php
  /**
   * Users.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: users.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
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
          $msgOk = "<span>Success!</span>You have successfuly added a new user!";
  
  if (isset($_GET['sort']))
      : $sort_order = substr($_GET['sort'], 0, 3);
  if ($sort_order == 'DSC')
      $sort_order = 'DESC';
  $sort_query = substr($_GET['sort'], 4) . ' ' . $sort_order;
  
  $usrow = $session->getUsers($sort_query);
  elseif (isset($_POST['search']))
      : $search = trim($_POST['search']);
  $search = $db->escape($_POST['search'], true);
  $usrow = $session->getUsers(false, $search);
  else
      : $usrow = $session->getUsers();
  endif;
  
  
  include("inc/users.php");
  break;
  
  endswitch;
  endif;
?>