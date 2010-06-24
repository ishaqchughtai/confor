<?php
  /**
   * System.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: system.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php
  if (get('sub'))
      : $do = sanitize($_GET['sub']);
  
  switch ($do)
      : default:
      if (isset($_GET['action']) && $_GET['action'] == 1)
          $msgOk = "<span>Success!</span>System Configuration updated successfuly!";
	  $setup->updateSettings();
	  include("inc/config.php");
	  break;
      
  case "email":
      $emailrow = $setup->getEmailTemplates();
      include("inc/email.php");
      break;

  case "newsletter":
      include("inc/newsletter.php");
      break;
	  
      endswitch;
      endif;
?>