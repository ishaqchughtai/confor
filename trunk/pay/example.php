<?php
  /**
   * Example.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: example.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
?>
<?php
  /*
  ---------------------------------------------------------------------------
  This is just an example page to demonstrate how to protect your pages based 
  on membership access.
  
  $membership->checkMembership(2) //number 2 represents membership id
  You can find membership id from your admin panel in Membership Setup >> View Memberships.
  
  What this means is if registered user has been assigned membership ID in this case 2
  He/She will be able to view this page, otherwise "Sorry you dont have privilige to access this page"
  message will appear.
  
  ---------------------------------------------------------------------------
  To protect pages which require user to be registered only, do the following:
  
	if (!$session->logged_in)
		redirect_to("index.php");
		
  This translates into: If user is not logged in redirect him to index.php 
  ---------------------------------------------------------------------------
  
  If you want to redirect logged in user to any other page
  
  Insert this:
  
	if ($session->logged_in)
		redirect_to("index.php");
		
  This translates into: If user is logged in redirect him to index.php 
  */
?>
<?php require_once("init.php");?>
<?php include("header.php");?>
<div id="content">
  <div class="wrap">
    <?php if($membership->checkMembership(2)):?>
    <h3>This is an example page with membership ID 2</h3>
    <?php else:?>
    <h3>Sorry you dont have privilige to access this page.</h3>
    <?php endif;?>
  </div>
</div>
<?php include("footer.php");?>