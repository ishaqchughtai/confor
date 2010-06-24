<?php
  /**
   * Recover.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: recover.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
  if ($session->logged_in)
      redirect_to("index.php?do=profile");
	  
  if (isset($_POST['reset']) and $_POST['reset'] == 1)
	  : $username = $_POST['username'];
		$pin1 = $_POST['pin_generated'];
		$pin2 = post('pin_submitted');
  
  $session->forgotPass($username, $pin1, $pin2);
  endif;
?>

<h1><span>Lost</span> Password Recovery</h1>
<p class="info">A new password will be generated for you and sent to the email address<br />
  associated with your account, all you have to do is enter your
  username.</p>
  <?php display_msg();?>
<div class="inner">
  <form action="<?php self();?>" method="post" id="user_form" name="user_form">
  <input type="hidden" name="reset" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">Forgot Password?</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="2"><input name="submit" type="submit" value="Submit"  class="button"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>Account Username:</strong></td>
          <td><input name="username" type="text"  class="inputbox" size="45" maxlength="20" />
            <?php required();?></td>
        </tr>
        <?php if($setup->set['captcha'] == 1): ?>
        <tr>
          <td><strong>Enter Capcha Code:</strong></td>
          <td><input name="pin_submitted" type="text" id="pin_submitted" class="inputbox" size="15"  />
            <?php echo $pin_image_output;?>
            <input type="hidden" name="pin_generated" value="<?php echo $session->value('pin_value');?>" /></td>
        </tr>
        <?php endif;?>
        <tr>
          <td colspan="2"><a href="index.php"><strong>Back to login page</strong></a></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>