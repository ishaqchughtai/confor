<?php
  /**
   * Config.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: config.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
    <h1><span>System</span> Configuration</h1>
    <p class="info">Here you can manage your site system configuration. Fields <?php required();?> marked are required.</p>
    <?php display_msg (); ?>
    <div class="inner">
      <form action="<?php self();?>" method="post" id="admin_form" name="admin_form">
      <input name="update_config" type="hidden" value="1" />
        <table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td colspan="4">Update System Configuration</td>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <td colspan="4"><input name="submit" type="submit" value="Update"  class="button"/>
                <input name="cancel" type="button" value="Cancel" class="button-alt" onclick="window.location='index.php';"/></td>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td width="200" nowrap="nowrap"><strong>Site Name:</strong></td>
              <td><input name="site_name" type="text"  class="inputbox" value="<?php echo $setup->set['site_name'];?>" size="45" />
                <?php required();?></td>
            </tr>
            <tr>
              <td><strong>Site Slogan:</strong></td>
              <td><input name="site_slogan" type="text"  class="inputbox" value="<?php echo $setup->set['site_slogan'];?>" size="45" /></td>
            </tr>
            <tr>
              <td><strong>Site Url:</strong></td>
              <td><input name="site_url" type="text"  class="inputbox" value="<?php echo $setup->set['site_url'];?>" size="45" /><?php required().tooltip("Insert full URL to your install folder<br />WITHOUT any trailing slash  (e.g http://www.yourdomain.com)");?></td>
            </tr>
            <tr>
              <td><strong>Site Email:</strong></td>
              <td><input name="site_email" type="text"  class="inputbox" value="<?php echo $setup->set['site_email'];?>" size="45" /><?php required().tooltip("This is the main email notices will be sent to. It is also used as the from 'email'<br />when emailing other automatic emails.");?></td>
            </tr>
            <tr>
              <td><strong>PayPal Email Adress:</strong></td>
              <td><input name="paypal_id" type="text"  class="inputbox" value="<?php echo $setup->set['paypal_id'];?>" size="45" /><?php required().tooltip("This is your PayPal business account email address.");?></td>
            </tr>
            <tr>
              <td><strong>Use SandBox Testing:</strong></td>
              <td><input name="sandbox" type="radio" value="1" <?php if ($setup->set['sandbox'] == 1) echo "checked=\"checked\""; ?> />
                Yes
                &nbsp;&nbsp;
                <input name="sandbox" type="radio" value="0" <?php if ($setup->set['sandbox'] == 0) echo "checked=\"checked\""; ?> />
                No <?php tooltip("PayPal sandbox is used for testing only");?></td>
            </tr>
            <tr>
              <td><strong>Paypal IPN  URL:</strong></td>
              <td><?php echo $setup->set['site_url'];?>/payments/paypal/ipn.php</td>
            </tr>
            <tr>
              <td><strong>Allow Registration:</strong></td>
              <td><input name="reg_allowed" type="radio" value="1" <?php if ($setup->set['reg_allowed'] == 1) echo "checked=\"checked\""; ?> />
                Yes
                &nbsp;&nbsp;
                <input name="reg_allowed" type="radio" value="0" <?php if ($setup->set['reg_allowed'] == 0) echo "checked=\"checked\""; ?> />
                No </td>
            </tr>
            <tr>
              <td><strong>Require Email Verification: </strong></td>
              <td><input name="reg_verify" type="radio" value="1" <?php if ($setup->set['reg_verify'] == 1) echo "checked=\"checked\""; ?> />
                Yes
                &nbsp;&nbsp;
                <input name="reg_verify" type="radio" value="0" <?php if ($setup->set['reg_verify'] == 0) echo "checked=\"checked\""; ?> />
                No </td>
            </tr>
            <tr>
              <td><strong>Enable Captcha: </strong></td>
              <td><input name="captcha" type="radio" value="1" <?php if ($setup->set['captcha'] == 1) echo "checked=\"checked\""; ?> />
                Yes
                &nbsp;&nbsp;
                <input name="captcha" type="radio" value="0" <?php if ($setup->set['captcha'] == 0) echo "checked=\"checked\""; ?> />
                No <?php tooltip("CAPTCHA (Completely Automated Public Turing test to tell Computers and Humans Apart)<br />is a technique to used to generate images with characters <br />which users need to mimic in a form field in order to submit a form. <br />This technique prevents automated scripts from posting spam. <br />This setting is recommended.");?></td>
            </tr>
            <tr>
              <td><strong>User Limit: </strong></td>
              <td><input name="user_limit" type="text"  class="inputbox" value="<?php echo $setup->set['user_limit'];?>" size="2" /><?php tooltip("Limit number of users that are allowed to register<br /> 0 = Unlimited.");?></td>
            </tr>
            <tr>
              <td><strong>PayPal Currency:</strong></td>
              <td><input name="currency" type="text"  class="inputbox" value="<?php echo $setup->set['currency'];?>" size="3" maxlength="3" /></td>
            </tr>
            <tr>
              <td><strong>Currency Symbol:</strong></td>
              <td><input name="cur_symbol" type="text"  class="inputbox" value="<?php echo $setup->set['cur_symbol'];?>" size="3" maxlength="3" /></td>
            </tr>
            <tr>
              <td><strong>Meta Description:</strong></td>
              <td><textarea name="desc" id="desc" cols="42" rows="5" class="inputbox"><?php echo $setup->set['desc'];?></textarea></td>
            </tr>
            <tr>
              <td><strong>Meta Keywords:</strong></td>
              <td><textarea name="keywords" id="keywords" cols="42" rows="5" class="inputbox"><?php echo $setup->set['keywords'];?></textarea></td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>