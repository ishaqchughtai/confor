<?php
  /**
   * Logout.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: logout.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
  include("init.php");
?>
<?php
  if ($session->logged_in)
      $session->logout();
  
      $db->close();
	  
  redirect_to("login.php");
?>