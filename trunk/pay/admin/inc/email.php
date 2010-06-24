<?php
  /**
   * Email.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: email.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
    <?php if(get("action") && get('action') == "edit"):?>
    <?php $id = $_GET['id'];?>
    <?php $row = $setup->getEmailTemplateById($id);?>
    <?php if(isset($_POST['submit'])):?>
    <?php $setup->updateEmailTemplate($id);?>
    <?php endif;?>
    <h1><span>Edit</span> Email Templates</h1>
    <p class="info">Below are your email templates. You can modify content of template(s) to suit your needs.<br />
      Do not change variables between [ ].</p>
    <?php display_msg (); ?>
    <div class="inner">
      <form action="" method="post" id="admin_form" name="admin_form">
        <table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td colspan="4">Editing template &rsaquo; <?php echo $row['name'];?></td>
            </tr>
          </thead>
          <tfoot>
            <tr>
              <td colspan="4"><input name="submit" type="submit" value="Update Template"  class="button"/>
                <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=system&amp;sub=email';"/></td>
            </tr>
          </tfoot>
          <tbody>
            <tr>
              <td width="150"><strong>Template Title:</strong></td>
              <td><input name="name" type="text"  class="inputbox" value="<?php echo $row['name'];?>" size="45" />
                <?php required();?></td>
            </tr>
            <tr>
              <td><strong>Email Subject</strong></td>
              <td><input name="subject" type="text"  class="inputbox" value="<?php echo $row['subject'];?>" size="80" />
                <?php required();?></td>
            </tr>
            <tr>
              <td><strong>Email Body:</strong></td>
              <td><textarea class="inputbox" cols="40" id="body" name="body" rows="25" style="width:99%"><?php echo $row['body'];?></textarea></td>
            </tr>
          </tbody>
        </table>
      </form>
    </div>
    <?php else:?>
    <h1><span>Manage</span> Email Templates</h1>
    <p class="info">Below are your email templates. You can modify content of template(s) to suit your needs.</p>
    <?php display_msg (); ?>
    <div class="inner">
      <form action="" method="post" id="itemList" name="itemList">
        <table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td colspan="3">Viewing Email Templates</td>
            </tr>
          </thead>
          <tr>
            <th width="25" nowrap="nowrap">#</th>
            <th>Template Name</th>
            <th class="right">Actions</th>
          </tr>
          <tbody>
            <?php if($emailrow == 0):?>
            <tr>
              <td colspan="3"><div class="msgAlert"><span>Error!</span>Your are missing all email templates. You need to reinstall them manually</div></td>
            </tr>
            <?php else:?>
            <?php foreach ($emailrow as $row):?>
            <tr>
              <td><?php echo $row['id'];?>.</td>
              <td><?php echo $row['name'];?></td>
              <td class="right"><a href="index.php?do=system&amp;sub=email&amp;action=edit&amp;id=<?php echo $row['id'];?>"><img src="images/edit.png" title="Edit Template"/></a></td>
            </tr>
            <?php endforeach;?>
            <?php unset($row);?>
            <?php endif;?>
          </tbody>
        </table>
      </form>
    </div>
    <?php endif;?>