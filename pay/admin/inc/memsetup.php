<?php
  /**
   * Membership Setup.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: memsetup.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php if(get("action") && get('action') == "edit"):?>
<?php $id = $_GET['id'];?>
<?php $row = $membership->getMembershipById($id);?>
<?php $raterow = $membership->getRatesByMembershipId($id);?>
<?php if(isset($_POST['submit'])):?>
<?php $membership->updateMembership($id);?>
<?php endif;?>

<h1><span>Edit</span> Membership</h1>
<p class="info">Below are your membership types. You can add remove or activate.</p>
<?php display_msg (); ?>
<span id="msg"></span>
<div class="inner">
  <form action="" method="post" id="admin_form" name="admin_form">
    <input name="update_membership" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="4">Editing Membership &rsaquo; <?php echo $row['title'];?></td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="Update Membership"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=membership&amp;sub=memsetup';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>Membership Title:</strong></td>
          <td><input name="title" type="text"  class="inputbox" value="<?php echo $row['title'];?>" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Membership Free:</strong></td>
          <td><input name="free" type="radio" value="0" <?php if ($row['free'] == 0) echo "checked=\"checked\""; ?> />
            Yes
            &nbsp;&nbsp;
            <input name="free" type="radio" value="1" <?php if ($row['free'] == 1) echo "checked=\"checked\""; ?> />
            No
            <?php tooltip("Is Membership free? Will skip rates");?></td>
        </tr>
        <tr>
          <td><strong>Membership Public:</strong></td>
          <td><input name="public" type="radio" value="1" <?php if ($row['public'] == 1) echo "checked=\"checked\""; ?> />
            Yes
            &nbsp;&nbsp;
            <input name="public" type="radio" value="0" <?php if ($row['public'] == 0) echo "checked=\"checked\""; ?> />
            No
            <?php tooltip("Is Membership public? User can join it?");?></td>
        </tr>
        <tr>
          <td><strong>Membership Description:</strong></td>
          <td><textarea class="inputbox" cols="50" id="desc" name="desc" rows="5"><?php echo $row['desc'];?></textarea>
            <?php required();?></td>
        </tr>
      </tbody>
    </table>
  </form>
  <table cellspacing="0" cellpadding="0" class="box">
    <thead>
      <tr>
        <td colspan="5">Viewing Rates For Membership &rsaquo; <?php echo $row['title'];?></td>
      </tr>
    </thead>
    <tr>
      <th width="25" nowrap="nowrap">#</th>
      <th>Rate Title</th>
      <th>Rate Description</th>
      <th>Membership Rate</th>
      <th class="right">Actions</th>
    </tr>
    <tfoot>
      <tr>
        <td colspan="5" class="utility">Bellow you can add new rates which will be assigned under current membership.</td>
      </tr>
    </tfoot>
    <tbody>
      <?php if($raterow == 0):?>
      <tr>
        <td colspan="5"><div class="msgAlert"><span>Alert!</span>There are no rates assigned under this membership.</div></td>
      </tr>
      <?php else:?>
      <?php foreach ($raterow as $rate):?>
      <tr>
        <td><?php echo $rate['id'];?>.</td>
        <td><?php echo $rate['title'];?></td>
        <td><?php echo $rate['desc'];?></td>
        <td><?php echo $setup->set['cur_symbol'].$rate['amount'].$setup->set['currency']. ' Payable Every '. $rate['term'].' '.getTerm($rate['term_c'])?></td>
        <td class="right"><a href="index.php?do=membership&amp;sub=rate&amp;action=edit&amp;id=<?php echo $row['id'];?>&amp;rate=<?php echo $rate['id'];?>"><img src="images/edit.png" title="Edit Rate"/></a><a href="#" class="delete-rate" id="item_<?php echo $rate['id'];?>"><img src="images/delete.png" class="tooltip" title="Delete Rate" /></a></td>
      </tr>
      <?php endforeach;?>
      <?php unset($rate);?>
      <?php endif;?>
    </tbody>
  </table>
  <?php $rates = $membership->getRateById(get('rate'));?>
  <form action="" method="post" id="addrate" name="addrate">
    <?php if(get('rate')): ?>
    <input name="update_rate" type="hidden" value="1" />
    <input name="rateid" type="hidden" value="<?php echo $rates['id'];?>" />
    <input name="membership_id" type="hidden" value="<?php echo $id;?>" />
    <?php else:?>
    <input name="add_rate" type="hidden" value="1" />
    <input name="membership_id" type="hidden" value="<?php echo $id;?>" />
    <?php endif;?>
    <table cellspacing="0" cellpadding="0" class="box">
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="<?php echo (get('rate')) ? "Update Rate" : "Add Rate";?>" class="button"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>Rate Title:</strong></td>
          <td><input name="title" type="text" value="<?php echo (get('rate')) ? $rates['title'] : "";?>" class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Rate Description:</strong></td>
          <td><input name="desc" type="text"  value="<?php echo (get('rate')) ? $rates['desc'] : "";?>" class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Rate Price:</strong></td>
          <td><input name="amount" type="text" value="<?php echo (get('rate')) ? $rates['amount'] : "";?>" class="inputbox" size="10" />
            <?php required().tooltip("Enter amount in 00.00 format.");?></td>
        </tr>
        <tr>
          <td><strong>Rate Term:</strong></td>
          <td><?php if(get('rate')): ?>
            <input name="term" type="text" value="<?php echo $rates['term'];?>" class="inputbox" size="2" />
            <?php echo ($rates['term_c'] == "D") ? "selected=\"selected\"" : "";?>
            <select name="term_c" class="select">
              <option value="D" <?php echo ($rates['term_c'] == "D") ? "selected=\"selected\"" : "";?>>Days</option>
              <option value="W" <?php echo ($rates['term_c'] == "W") ? "selected=\"selected\"" : "";?>>Weeks</option>
              <option value="M" <?php echo ($rates['term_c'] == "M") ? "selected=\"selected\"" : "";?>>Months</option>
              <option value="Y" <?php echo ($rates['term_c'] == "Y") ? "selected=\"selected\"" : "";?>>Years</option>
            </select>
            <?php else:?>
            <select name="term" class="select">
              <option value="1">1</option>
              <option value="2">2</option>
              <option value="3">3</option>
              <option value="4">4</option>
              <option value="5">5</option>
              <option value="6">6</option>
              <option value="7">7</option>
              <option value="8">8</option>
              <option value="9">9</option>
              <option value="10">10</option>
              <option value="11">11</option>
              <option value="12">12</option>
              <option value="13">13</option>
              <option value="14">14</option>
              <option value="15">15</option>
              <option value="16">16</option>
              <option value="17">17</option>
              <option value="18">18</option>
              <option value="19">19</option>
              <option value="20">20</option>
              <option value="21">21</option>
              <option value="22">22</option>
              <option value="23">23</option>
              <option value="24">24</option>
              <option value="25">25</option>
              <option value="26">26</option>
              <option value="27">27</option>
              <option value="28">28</option>
              <option value="29">29</option>
              <option value="30">30</option>
            </select>
            <select name="term_c" class="select">
              <option value="D">Days</option>
              <option value="W">Weeks</option>
              <option value="M">Months</option>
              <option value="Y">Years</option>
            </select>
            <?php endif;?>
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Automatic Renewal:</strong></td>
          <td><?php if(get('rate')) :?>
            <input name="automatic" type="radio" value="1" <?php if ($rates['automatic'] == 1) echo "checked=\"checked\""; ?> />
            Yes
            &nbsp;&nbsp;
            <input name="automatic" type="radio" value="0" <?php if ($rates['automatic'] == 0) echo "checked=\"checked\""; ?> />
            No
            <?php else:?>
            <input name="automatic" type="radio" value="1" checked="checked" />
            Yes
            &nbsp;&nbsp;
            <input name="automatic" type="radio" value="0" />
            No
            <?php tooltip("Is Membership public? User can join it?");?>
            <?php endif;?></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php elseif(get("action") && get('action') == "add"):?>
<?php if(isset($_POST['submit'])):?>
<?php $membership->addMembership();?>
<?php endif;?>
<h1><span>Add</span> Membership</h1>
<p class="info">Below are your membership types. You can add remove or activate. Fields marked
  <?php required();?>
  are required.</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="admin_form" name="admin_form">
    <input name="add_membership" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="4">Adding New Membership</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="Add Membership"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=membership&amp;sub=memsetup';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>Membership Title:</strong></td>
          <td><input name="title" type="text"  class="inputbox" value="<?php echo post('title');?>" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>Membership Free:</strong></td>
          <td><input name="free" type="radio" value="0" checked="checked" />
            Yes
            &nbsp;&nbsp;
            <input name="free" type="radio" value="1" />
            No
            <?php tooltip("Is Membership free? Will skip rates");?></td>
        </tr>
        <tr>
          <td><strong>Membership Public:</strong></td>
          <td><input name="public" type="radio" value="1" checked="checked" />
            Yes
            &nbsp;&nbsp;
            <input name="public" type="radio" value="0" />
            No
            <?php tooltip("Is Membership public? User can join it?");?></td>
        </tr>
        <tr>
          <td><strong>Membership Description:</strong></td>
          <td><textarea class="inputbox" cols="50" id="desc" name="desc" rows="5"><?php echo post('desc');?></textarea>
            <?php required();?></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php else:?>
<?php $membership->setActiveInactive("memberships", "index.php?do=membership&sub=memsetup");?>
<h1><span>Manage</span> Memberships</h1>
<p class="info">Below are your membership types. You can add remove or activate.</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="itemList" name="itemList">
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="4">Viewing Membership Types</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><a href="index.php?do=membership&amp;sub=memsetup&amp;action=add" class="button">Add New Membership</a></td>
        </tr>
      </tfoot>
      <tr>
        <th width="25" nowrap="nowrap">#</th>
        <th>Title</th>
        <th>Description</th>
        <th class="right">Actions</th>
      </tr>
      <tbody>
        <?php if($memrow == 0):?>
        <tr>
          <td colspan="4"><div class="msgAlert"><span>Alert!</span>There are no membership. Please create some...</div></td>
        </tr>
        <?php else:?>
        <?php foreach ($memrow as $row):?>
        <tr>
          <td><?php echo $row['id'];?>.</td>
          <td><?php echo $row['title'];?></td>
          <td><?php echo $row['desc'];?></td>
          <td class="right"><?php $status = ($row['status'] == 0) ? 1:0;?>
            <?php $image = ($row['status'] == 0) ? "inactive":"active";?>
            <a href="index.php?do=membership&amp;sub=memsetup&amp;publish=<?php echo $status;?>&amp;id=<?php echo $row['id'];?>"> <img src="images/<?php echo $image;?>.png" class="tooltip" title="Status: <?php echo $image;?>"/></a> <a href="index.php?do=membership&amp;sub=payments&amp;action=view&amp;id=<?php echo $row['id'];?>"><img src="images/paid.png" class="tooltip" title="View Payments for: <?php echo $row['title'];?>"/></a> <a href="index.php?do=membership&amp;sub=memsetup&amp;action=edit&amp;id=<?php echo $row['id'];?>"><img src="images/edit.png" class="tooltip" title="Edit Membership: <?php echo $row['title'];?>"/></a> <a href="#" class="delete-mem" id="item_<?php echo $row['id'];?>"><img src="images/delete.png" class="tooltip" title="Delete Membership" /></a></td>
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
        $('a.delete-mem').click(function(e) {
            if (confirm("Deleting membership will also delete all Rates assigned under it.")) {
                e.preventDefault();
                var parent = $(this).parent().parent();
                $.ajax({
                    type: 'post',
                    url: "ajax/process.php",
                    data: 'deleteMem=' + $(this).attr('id').replace('item_', ''),
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

        $('a.delete-rate').click(function(e) {
            if (confirm("Are you sure you want to delete this rate?.")) {
                e.preventDefault();
                var parent = $(this).parent().parent();
                $.ajax({
                    type: 'post',
                    url: "ajax/process.php",
                    data: 'deleteRate=' + $(this).attr('id').replace('item_', ''),
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
		
        $("#addrate").submit(function() {
            var str = $(this).serialize();
			<?php if(get("action") && get('action') == "edit"):?>
            var url = "index.php?do=membership&sub=memsetup&action=edit&id=<?php echo $id;?>";
			<?php endif;?>
            $.ajax({
                type: "post",
                url: "ajax/process.php",
                data: str,
                success: function(msg) {
                    $("#msg").ajaxComplete(function(event, request, settings) {
                        if (msg == 'OK') {
                            $(location).attr('href', url);
                        } else {
                            result = msg;
                        }
                        $(this).html(result);
                    });

                }

            });
            return false;
        });

    });
    // ]]>
</script>