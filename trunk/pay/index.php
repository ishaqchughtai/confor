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
<?php require_once("init.php");?>  
<?php include("header.php");?>
<?php
  //Start session captcha 
  $session->unlink_pin();
  $session->set('pin_value', md5(rand(2, 99999999)));
  $generated_pin = $session->generate_pin($session->value('pin_value'));
  $pin_image_output = $session->show_pin($session->value('pin_value'), $generated_pin);
?>
<div id="content">
  <div class="wrap">
    <?php (isset($_GET['do']) && file_exists($_GET['do'].".php")) ? include($_GET['do'].".php") : include("main.php");?>
  </div>
</div>
<?php include("footer.php");?>