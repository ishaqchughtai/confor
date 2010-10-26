<?php
  /**
   * Configuration.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: config.ini.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  /**
   * Database Constants - these constants refer to
   * the database configuration settings.
   */
  define('DB_SERVER', "localhost");
  define('DB_USER', "root");
  define('DB_PASS', "");
  define('DB_DATABASE', "conforus_conforus");

  define("COOKIE_EXPIRE", 60 * 60 * 24 * 60); //60 days by default
  define("COOKIE_PATH", "/"); //Avaible in whole domain
  
    /**
   * Show MySql Errors.
   * Not recomended for live site. true/false
   */
  $WOJODebug = true;
?>