<?php
  /**
   * Upgrade.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: upgrade.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
	  
  if (!$session->logged_in)
      redirect_to("index.php?do=profile");
?>
<?php $memrow = $membership->getPublicMemberships();?>
<?php $raterow = $membership->getRatesByMembershipId(post('membership_id'));?>
<?php $rate = $membership->getRateById(post('rate_id'));?>

<h1><span>Upgrade</span> Your account</h1>
<p class="info">Here you can upgrade your membership.</p>
<div class="inner">
  <form action="<?php self();?>" method="post" id="user_form" name="user_form">
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">Current Membership</td>
        </tr>
      </thead>
      <tbody>
        <?php echo $membership->getmeMembershipInfo();?>
      </tbody>
      <thead>
        <tr>
          <td colspan="2">Avaiable Memberships</td>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><strong>Membership Types:</strong></td>
          <td><select name="membership_id" id="membership_id" class="select" onChange="document.user_form.submit();">
              <option value="NA">--- Select Membership ---</option>
              <?php foreach($memrow as $mrow):?>
              <?php if ($mrow['id']!=2):?>
              <?php $selected = ($mrow['id'] == post('membership_id')) ? "selected=\"selected\"" : "";?>
              <option value="<?php echo $mrow['id'];?>"<?php echo $selected;?>><?php echo $mrow['title'];?></option>
              <?php endif;?>
              <?php endforeach;?>
              <?php unset($mrow);?>
            </select></td>
        </tr>
        <tr>
          <td><strong>Membership Rates:</strong></td>
          <td><select name="rate_id" class="select" id="rate_id" onChange="document.user_form.submit();">
              <option value="NA">--- Select Membership Rate---</option>
              <?php if ($raterow !=0):?>
              <?php foreach($raterow as $rrow):?>
              <?php $selected = ($rrow['id'] == post('rate_id')) ? " selected=\"selected\"" : "";?>
              <option value="<?php echo $rrow['id'];?>"<?php echo $selected;?>><?php echo $rrow['title']."(".$setup->set['cur_symbol'].$rrow['amount'].$setup->set['currency']. " Paypable Every ". $rrow['term']." ".getTerm($rrow['term_c']).")";?></option>
              <?php endforeach;?>
              <?php unset($rrow);?>
              <?php endif;?>
            </select></td>
        </tr>
      </tbody>
    </table>
  </form>
  <?php if(intval(isset($_POST['rate_id'])) and $_POST['rate_id'] != "NA"):?>
  <table cellspacing="0" cellpadding="0" class="box">
    <thead>
      <tr>
        <td colspan="2">Membership Info </td>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="2" align="center"><?php include("payments/paypal/subscribe.php");?></td>
      </tr>
    </tfoot>
    <tbody>
      <tr>
        <td><strong>Membership Title:</strong></td>
        <td><?php echo $rate['title'];?></td>
      </tr>
      <tr>
        <td><strong>Membership Description:</strong></td>
        <td><?php echo $rate['desc'];?></td>
      </tr>
      <tr>
        <td><strong>Membership Rate:</strong></td>
        <td><?php echo 'Payment Of: '.$rate['amount']. ' (Payable Every: '. $rate['term'].' '.getTerm($rate['term_c']).')'; ?></td>
      </tr>
      <tr>
        <td><strong>Renewal:</strong></td>
        <td><?php echo ($rate['automatic'] == '1') ? 'Automatic' : 'Not Automatic';?></td>
      </tr>
    </tbody>
  </table>
  <?php endif;?>
</div>