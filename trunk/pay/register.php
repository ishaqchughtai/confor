<?php
  /**
   * Register.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: register.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
  if ($session->logged_in)
      redirect_to("index.php?do=profile");
	  
  if (isset($_POST['register']) && $_POST['register'] == 1)
      : $username = $_POST['username'];
  $pass = $_POST['password'];
  $pass2 = $_POST['password2'];
  $email = $_POST['email'];
  $pin1 = $_POST['pin_generated'];
  $pin2 = $_POST['pin_submitted'];
  
  $session->register($username, $pass, $pass2, $email, $pin1, $pin2);
  endif;
?>

<?php if($setup->set['reg_allowed'] == 0 or countEntries("users") == $setup->set['user_limit']):?>
<h1>Sorry no more registrations allowed!</h1>
<?php else:?>
<h1><span>Become</span> Registered Member</h1>
<p class="info">Please fill out the form below to become registered member. All fieds are required.</p>
<?php display_msg();?>
<span id="status"></span>
<div class="inner">
  <form action="<?php self();?>" method="post" id="user_form" name="user_form">
  <input type="hidden" name="register" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">User Registration</td>
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
          <td><input name="username" type="text"  id="user_name" class="inputbox" size="45" maxlength="20" />
            <?php required().tooltip("No spaces, more than 4 characters and containing 0-9,a-z,A-Z");?></td>
        </tr>
        <tr>
          <td><strong>Account Password:</strong></td>
          <td><input name="password" type="password"  class="inputbox" size="45" maxlength="20" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Password Repeat:</strong></td>
          <td><input name="password2" type="password" class="inputbox" size="45" maxlength="20" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Your Email:</strong></td>
          <td><input name="email" type="text" class="inputbox" size="45" maxlength="40" />
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
<script type="text/javascript"> 
// <![CDATA[
$(document).ready(function() {
    $("#user_name").change(function() {
        var usr = $("#user_name").val();
        if (usr.length >= 4) {
            $("#status").html('<img src="images/ajax-loader.gif" \/>&nbsp;Checking availability...');

            $.ajax({
                type: "post",
                url: "ajax/process.php",
                data: "username=" + usr,
                success: function(msg) {
                    $("#status").ajaxComplete(function(event, request, settings) {
                            $(this).html(msg);
							
                    });
                }
				
            });
        }
        else {
            $("#status").html('<div class="msgAlert"><span>Alert!<\/span>Username is too short<\/div>');
        }
		
    });
	
});
// ]]>
</script>
<?php endif;?>