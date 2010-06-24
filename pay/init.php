<?php
  /**
   * Init.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: init.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php error_reporting(E_ALL);

  $MSBASE = str_replace("init.php", "", realpath(__FILE__));
  
  define("MSPATH", $MSBASE);
  require_once(MSPATH . "lib/config.ini.php");

  //Include Classes
  require_once(MSPATH . "lib/class_db.php");
  require_once(MSPATH . "lib/class_users.php");
  require_once(MSPATH . "lib/class_session.php");
  require_once(MSPATH . "lib/class_paginate.php");

  //Include Functions
  require_once(MSPATH . "lib/functions.php");
  
  //Start the database
  $db = new Database(DB_SERVER, DB_USER, DB_PASS, DB_DATABASE);
  
  //connect here
  $db->connect();

  //Start Configuration Class 
  require_once(MSPATH . "lib/class_setup.php");
  $setup = new Setup();

  //Start membership Class 
  require_once(MSPATH . "lib/class_membership.php");
  $membership = new Membership();
  
  define("SITEURL", $setup->set['site_url']);
  define("ADMINURL", SITEURL."/admin");
	
  //Start user sessions
  $session = new Session();
?>