<?php
  /**
   * Profile.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: profile.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
  if (!$session->logged_in)
      redirect_to("index.php");

  if (isset($_POST['edit']) && $_POST['edit'] == 1)
      $session->editAccount($session->username, $_POST['password']);
  
  if (isset($_GET['updated']))
      $msgOk = '<span>Succes!</span>You have successfully updated your profile';
?>
<?php $memrow = $membership->getMembershipById($session->userinfo['membership_id']);?>

<h1><span>Manage</span> Your account</h1>
<div class="inner">
  <form action="<?php self();?>" method="post" id="user_form" name="user_form">
  <input type="hidden" name="edit" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <tfoot>
        <tr>
          <td align="left"><input name="cancel" type="button" value="Upgrade Membership"  class="button-alt" onclick="window.location='index.php?do=upgrade';"/></td>
        </tr>
      </tfoot>
      <thead>
        <tr>
          <td >Membership Info</td>
        </tr>
        </thead>
        <?php echo $membership->getmeMembershipInfo();?>
    </table>
  </form>
</div>