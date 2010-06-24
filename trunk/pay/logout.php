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
  require_once("init.php");
?>
<?php
  if ($session->logged_in)
      $session->logout();
	  
  redirect_to("index.php");
      
  $db->close();
?>