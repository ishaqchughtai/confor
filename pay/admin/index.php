<?php
  /**
   * Index.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: index.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
?>
<?php 
  require_once("init.php");
  
  if (!$session->isAdmin())
      redirect_to("login.php");
?>  
<?php include("header.php");?>
<div id="content">
  <div class="wrap">
    <?php (isset($_GET['do'])) ? include($_GET['do'].".php") : include("main.php");?>
  </div>
</div>
<?php include("footer.php");?>