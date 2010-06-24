<?php
  /**
   * Process.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: process.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
  
  require_once("../init.php");
?>
<?php
  /* Check Username*/
  if (isset($_POST['username']) && !empty($_POST['username']))
      : $username = sanitize($_POST['username']);
  
  $sql = $db->query("SELECT username FROM users WHERE username = '" . $db->escape($username) . "'");
  
  if ($db->numrows($sql) == 1)
      : echo '<div class="msgAlert"><span>Alert!</span>Username Taken</div>';
  else
      : echo '<div class="msgOk"><span>Success!</span>Username Available</div>';
  endif;
  
  endif;
?>