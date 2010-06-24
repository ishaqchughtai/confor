<?php
  /**
   * Newsletter.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: newsletter.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php $row = $setup->getEmailTemplateById(4);?>
<?php if(isset($_POST['submit'])):?>
<?php $setup->sendNewsletter();?>
<?php endif;?>
<h1><span>Manage</span> Email Templates</h1>
<p class="info">Here you can send newsletter to all users subscribed to it.</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="itemList" name="itemList">
    <input name="send_newsletter" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">Sending Newsletter</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="2"><input name="submit" type="submit" value="Send Newsletter"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150">Newsletter Subject:</td>
          <td><input name="subject" type="text"  class="inputbox" value="<?php echo $row['subject'];?>" size="60" /></td>
        </tr>
        <tr>
          <td>Newsletter Body:</td>
          <td><textarea name="body" cols="50" rows="10" disabled="disabled" class="inputbox" id="textarea" style="width:90%;height:300px"><?php echo $row['body'];?></textarea></td>
        </tr>
        <tr>
          <td colspan="2">You can edit this newsletter template from your System Setup Menu</td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
