<?php
  /**
   * Login.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: login.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
  include("init.php");
?>
<?php
  if ($session->logged_in)
      redirect_to("index.php");
	  
  if (isset($_POST['submit']))
      : $result = $session->login($_POST['username'], $_POST['password'], "");
  /* Login successful */
  if ($result)
      : redirect_to("index.php");
  endif;
  endif;
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $setup->set['site_name'];?></title>
<link href="assets/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../assets/jquery.js"></script>
<script type="text/javascript" src="../assets/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="assets/global.js"></script>
</head>
<body>
<div id="loginbox">
  <h1>admin panel - Login</h1>
  <div class="body"><strong>Welcome to <?php echo $setup->set['site_name'];?><br />
  Please enter your Account name and Password bellow to login.</strong>
   <div class="formbox">
     <form id="form1" name="form1" method="post" action="">
       <label>Account Username:</label>
         <input name="username" type="text" class="inputbox" id="username" size="40"/>
       <label>Account Password:</label>
         <input name="password" type="password" class="inputbox" id="password" size="40"/>
         <div style="text-align:right; margin-top:20px">
           <input name="submit" type="submit" value="Submit" class="button"/>
         </div>
     </form>
   </div> 
 <div id="footer">
  <div class="wrap">Copyright &copy;<?php echo date('Y').' '.$setup->set['site_name'];?><br />
    Powered by Membership Subscription</div>
</div>  
  </div>
</div>
<div class="msgs">
  <?php display_msg();?>
</div>
<?php $db->close(); ?>
</body>
</html>