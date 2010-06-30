<?php
  /**
   * Main.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: main.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
  if ($session->logged_in)
  {
      redirect_to("index.php?do=profile");
	}
	else
	{
	redirect_to("../");
	}
  
  if (isset($_POST['submit']))
      : $result = $session->login($_POST['username'], $_POST['password'], isset($_POST['remember']));
  /* Login successful */
  if ($result)
      : redirect_to("index.php?do=profile");
  endif;
  endif;
  
  /* Let's do the activation */
  if (isset($_GET['mail']) && isset($_GET['key']))
      : $email = sanitize($_GET['mail']);
  $token = sanitize($_GET['key']);
  $session->activateUser($email, $token);
  endif;
  
  
  if (isset($_GET['activation']) && $_GET['activation']== "ok")
      $msgOk = "<span>Succes!</span>Thank you. Your account is now active. You may now log in.";
?>

<h1><span>Please Login</span> to enter your account!</h1>
<?php display_msg();?>
<div class="inner">
  <form action="<?php self();?>" method="post" id="user_form" name="user_form">
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">User Login</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="2"><input name="submit" type="submit" value="Login Now"  class="button"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>Account Username:</strong></td>
          <td><input name="username" type="text"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Account Password:</strong></td>
          <td><input name="password" type="password"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Remember Me:</strong></td>
          <td><input name="remember" type="checkbox" class="checkbox" value="1" /></td>
        </tr>
        <!--<tr>
          <td colspan="2"><strong>Not yet registered? <a href="index.php?do=register">Sign-Up!</a><br />
            Forgot your password? <a href="index.php?do=recover">Recover Here?</a></strong></td>
        </tr>-->
      </tbody>
    </table>
  </form>
</div>
