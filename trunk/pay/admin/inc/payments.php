<?php
  /**
   * Payments Setup.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: payments.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php if(get("action") && get('action') == "edit"):?>
<?php $id = $_GET['id'];?>
<?php $row = $membership->getPaymentById($id);?>
<?php $username = $session->getUserById($row['id']);?>
<?php $userlist = $session->getUserList();?>
<?php $memlist = $membership->getMemberships();?>
<?php $ratelist = $membership->getRatesByMembershipId(get("memid"));?>
<?php if(isset($_POST['submit'])):?>
<?php $membership->updatePayment($id);?>
<?php endif;?>

<h1><span>Edit</span> Payment</h1>
<p class="info">Below is your payment.Fields marked
  <?php required();?>
  are required</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="admin_form" name="admin_form">
    <input name="update_payment" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="4">Editing Payment for username &rsaquo; <?php echo $username['username'];?></td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="Update Payment"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=membership&amp;sub=payments';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>User:</strong></td>
          <td><select name="user_id" id="user_id" class="select">
              <?php foreach ($userlist as $ulist):?>
              <?php $selected = ($ulist['id'] == $row['user_id']) ? "selected=\"selected\"" : "";?>
              <option value="<?php echo $ulist['id'];?>" <?php echo $selected;?>><?php echo $ulist['username'];?>(<?php echo $ulist['email'];?>)</option>
              <?php endforeach;?>
              <?php unset($ulist);?>
            </select></td>
        </tr>
        <tr>
          <td><strong>Membership Type:</strong></td>
          <td><select name="membership_id" id="membership_id" class="select" onchange=" window.location='index.php?do=membership&amp;sub=payments&amp;action=edit&amp;memid='+this[this.selectedIndex].value+'&amp;id=<?php echo $row['id']; ?>';">
              <?php foreach ($memlist as $mlist):?>
              <?php $selected = (get('memid') && get('memid') == $mlist['id']) ? " selected=\"selected\"" : "" ;?>
              <option value="<?php echo $mlist['id'];?>" <?php echo $selected;?>><?php echo $mlist['title'];?></option>
              <?php endforeach;?>
              <?php unset($mlist);?>
            </select></td>
        </tr>
        <tr>
          <td><strong>Membership Rate:</strong></td>
          <td>
          <?php if($ratelist != 0):?>
          <select name="rate_id" id="rate_id" class="select">
              <?php foreach ($ratelist as $rlist):?>
              <?php $selected = ($rlist['id'] == $row['rate_id']) ? "selected=\"selected\"" : "";?>
              <option value="<?php echo $rlist['id'];?>" <?php echo $selected;?>><?php echo $rlist['title'];?>(<?php echo $setup->set['cur_symbol'].$rlist['amount'].$setup->set['currency']. ' Paypable Every '. $rlist['term'].' '.getTerm($rlist['term_c'])?>)</option>
              <?php endforeach;?>
              <?php unset($rlist);?>
            </select>
            <?php endif;?>
            </td>
        </tr>
        <tr>
          <td><strong>Payment Date:</strong></td>
          <td><input name="date" type="text" class="inputbox" value="<?php echo $row['date'];?>" size="40" /></td>
        </tr>
        <tr>
          <td><strong>Payment Amount:</strong></td>
          <td><input name="rate_amount" type="text" class="inputbox" value="<?php echo $row['rate_amount'];?>" size="10" />
            <?php echo $setup->set['currency'];?></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php elseif(get("action") && get('action') == "add"):?>
<?php $userlist = $session->getUserList();?>
<?php $memlist = $membership->getMemberships();?>
<?php if(isset($_POST['submit'])):?>
<?php $membership->addPayment();?>
<?php endif;?>
<h1><span>Add</span> Manual Payment</h1>
<p class="info">Below is your payment.Fields marked
  <?php required();?>
  are required</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="admin_form" name="admin_form">
    <input name="add_payment" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="4">Adding New Payment</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="Add Payment"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=membership&amp;sub=payments';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>User:</strong></td>
          <td><select name="user_id" id="user_id" class="select">
              <option value="NA">--- Select User ---</option>
              <?php foreach ($userlist as $ulist):?>
              <option value="<?php echo $ulist['id'];?>"><?php echo $ulist['username'];?>(<?php echo $ulist['email'];?>)</option>
              <?php endforeach;?>
              <?php unset($ulist);?>
            </select>
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Membership Type:</strong></td>
          <td><select name="membership_id" id="membership_id" class="select">
              <option value="NA">--- Select Membership ---</option>
              <?php foreach ($memlist as $mlist):?>
              <option value="<?php echo $mlist['id'];?>"><?php echo $mlist['title'];?></option>
              <?php endforeach;?>
              <?php unset($mlist);?>
            </select>
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Membership Rate:</strong></td>
          <td><span id="rateId">
            <select name="rate_id" class="select" id="rate_id">
              <option value="0">--- none ---</option>
            </select>
            <?php echo required();?> </span></td>
        </tr>
        <tr>
          <td><strong>Payment Amount:</strong></td>
          <td><input name="rate_amount" type="text" class="inputbox" size="10" />
            <?php required().tooltip("Paymant Amount should match Membership Rate amount<br />Enter amount in 00.00 format.");?></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php elseif(get("action") && get('action') == "view"):?>
<?php $userlist = $session->getUserList();?>
<?php $memlist = $membership->getMemberships();?>
<?php $payrow = $membership->getPaymentsByMembershipId(get("id"));?>
<h1><span>Viewing</span> Payments</h1>
<p class="info">Below are your payments.</p>
<?php display_msg (); ?>
<div class="inner">
  <table cellspacing="0" cellpadding="0" class="box">
    <thead>
      <tr>
        <td colspan="6">Viewing Payments</td>
      </tr>
    </thead>
    <tfoot>
      <tr>
        <td colspan="6"><div class="pagination"><?php echo $pager->display_pages();?></div></td>
      </tr>
    </tfoot>
    <tr>
      <th width="25" nowrap="nowrap">#</th>
      <th>Membership</th>
      <th>User</th>
      <th>Payment Amount</th>
      <th>Payment Date</th>
      <th class="right">Actions</th>
    </tr>
    <tbody>
      <?php if($payrow == 0):?>
      <tr>
        <td colspan="6"><div class="msgAlert"><span>Alert!</span>There are no payments yet...</div></td>
      </tr>
      <?php else:?>
      <?php foreach ($payrow as $row):?>
      <?php $memid = $membership->getMembershipById($row['membership_id']);?>
      <?php $userid = $session->getUserById($row['user_id']);?>
      <tr>
        <td><?php echo $row['id'];?>.</td>
        <td><?php echo $memid['title'];?></td>
        <td><?php echo $userid['username'];?></td>
        <td><?php echo $setup->set['cur_symbol'].number_format($row['rate_amount'],2).$setup->set['currency'];?></td>
        <td><?php echo $row['date'];?></td>
        <td class="right"><?php $status = ($row['status'] == 0) ? 1:0;?>
          <?php $image = ($row['status'] == 0) ? "inactive":"active";?>
          <a href="index.php?do=membership&amp;sub=payments&amp;publish=<?php echo $status;?>&amp;id=<?php echo $row['id'];?>"> <img src="images/<?php echo $image;?>.png" class="tooltip" title="Status: <?php echo $image;?>"/></a> <a href="index.php?do=membership&amp;sub=payments&amp;action=edit&amp;id=<?php echo $row['id'];?>&amp;memid=<?php echo $row['membership_id'];?>"><img src="images/edit.png" class="tooltip" title="Edit Payment"/></a> <a href="#" class="delete-pay" id="item_<?php echo $row['id'];?>"><img src="images/delete.png" class="tooltip" title="Delete Payment" /></a></td>
      </tr>
      <?php endforeach;?>
      <?php unset($row);?>
      <?php endif;?>
    </tbody>
  </table>
</div>
<?php else:?>
<?php $membership->setActiveInactive("payments", "index.php?do=membership&sub=payments");?>
<h1><span>Manage</span> Payments</h1>
<p class="info">Below are your payments. You can add remove or activate.</p>
<?php display_msg (); ?>
<div class="inner">
  <div class="utility">
    <table border="0" cellspacing="0" cellpadding="0" class="box">
      <tr>
        <td><a href="index.php?do=membership&amp;sub=payments&amp;action=add" class="button">Add Manual Payment</a></td>
        <td><form action="" method="post">
            <input name="search" type="text" class="inputbox" id="search-input"  onfocus="if(this.value=='Payment Amount...'){this.value=''};" onblur="if(this.value==''){this.value='Payment Amount...'};" value="Payment Amount..." size="40"/>
            <input name="submit" type="submit" class="button" value="Find" />
          </form></td>
        <td align="right"><form action="" method="get" name="filter_browse" id="filter_browse">
            <strong>Payment Filter:&nbsp;</strong> <?php echo $membership->getPaymentFilter();?>
          </form></td>
      </tr>
    </table>
  </div>
  <form action="" method="post" id="itemList" name="itemList">
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="6">Viewing Payments</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="6"><div class="pagination"><?php echo $pager->display_pages();?></div></td>
        </tr>
      </tfoot>
      <tr>
        <th width="25" nowrap="nowrap">#</th>
        <th>Membership</th>
        <th>User</th>
        <th>Payment Amount</th>
        <th>Payment Date</th>
        <th class="right">Actions</th>
      </tr>
      <tbody>
        <?php if($payrow == 0):?>
        <tr>
          <td colspan="6"><div class="msgAlert"><span>Alert!</span>There are no payments yet...</div></td>
        </tr>
        <?php else:?>
        <?php foreach ($payrow as $row):?>
        <?php $memid = $membership->getMembershipById($row['membership_id']);?>
        <?php $userid = $session->getUserById($row['user_id']);?>
        <tr>
          <td><?php echo $row['id'];?>.</td>
          <td><?php echo $memid['title'];?></td>
          <td><?php echo $userid['username'];?></td>
          <td><?php echo $setup->set['cur_symbol'].number_format($row['rate_amount'],2).$setup->set['currency'];?></td>
          <td><?php echo $row['date'];?></td>
          <td class="right"><?php $status = ($row['status'] == 0) ? 1:0;?>
            <?php $image = ($row['status'] == 0) ? "inactive":"active";?>
            <a href="index.php?do=membership&amp;sub=payments&amp;publish=<?php echo $status;?>&amp;id=<?php echo $row['id'];?>"> <img src="images/<?php echo $image;?>.png" class="tooltip" title="Status: <?php echo $image;?>"/></a> <a href="index.php?do=membership&amp;sub=payments&amp;action=edit&amp;id=<?php echo $row['id'];?>&amp;memid=<?php echo $row['membership_id'];?>"><img src="images/edit.png" class="tooltip" title="Edit Payment"/></a> <a href="#" class="delete-pay" id="item_<?php echo $row['id'];?>"><img src="images/delete.png" class="tooltip" title="Delete Payment" /></a></td>
        </tr>
        <?php endforeach;?>
        <?php unset($row);?>
        <?php endif;?>
      </tbody>
    </table>
  </form>
</div>
<?php endif;?>
<script type="text/javascript">
    // <![CDATA[
    $(document).ready(function() {
        $('a.delete-pay').click(function(e) {
            if (confirm("Are you sure you want to delete this payment?")) {
                e.preventDefault();
                var parent = $(this).parent().parent();
                $.ajax({
                    type: 'post',
                    url: "ajax/process.php",
                    data: 'deletePay=' + $(this).attr('id').replace('item_', ''),
                    beforeSend: function() {
                        parent.animate({
                            'backgroundColor': '#FFBFBF'
                        }, 400);
                    },
                    success: function() {
                        parent.fadeOut(400, function() {
                            parent.remove();
                        });
                    }
                });
            }
        });

    $('#membership_id').change(function() {
        var option = $(this).val();
        $.post('ajax/process.php', {
            ratelist: option
        },
        function(data) {
            $('#rateId').html(data).show();
        });
    });
});
    // ]]>
</script>
