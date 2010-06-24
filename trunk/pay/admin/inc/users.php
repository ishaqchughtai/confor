<?php
  /**
   * Users.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: users.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php if(get("action") && get('action') == "edit"):?>
<?php $id = $_GET['id'];?>
<?php $row = $session->getUserById($id);?>
<?php $memlist = $membership->getMemberships();?>
<?php if(isset($_POST['submit'])):?>
<?php $session->updateUser($id);?>
<?php endif;?>

<h1><span>Edit</span> User</h1>
<p class="info">Here you can add new user. Fields marked
  <?php required();?>
  are required.</p>
<?php display_msg (); ?>
<div class="inner">
<form action="" method="post" id="admin_form" name="admin_form">
    <input name="edit_user" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="2">Editing User  &rsaquo; <?php echo $row['username'];?></td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="4"><input name="submit" type="submit" value="Update User"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=users&amp;sub=users';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>User Name:</strong></td>
          <td><input name="username" type="text" disabled="disabled" class="inputbox" value="<?php echo $row['username'];?>" size="45" readonly="readonly"/></td>
        </tr>
        <tr>
          <td><strong>User Password:</strong></td>
          <td><input name="password" type="text"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>User Email:</strong></td>
          <td><input name="email" type="text"  class="inputbox" value="<?php echo $row['email'];?>" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>First and Last Name:</strong></td>
          <td><input name="name" type="text"  class="inputbox" value="<?php echo $row['name'];?>" size="45" />
            <?php required();?></td>
        </tr>
          <td><strong>Membership Type:</strong></td>
          <td><select name="membership_id" id="membership_id" class="select">
              <option value="NA">--- Select Membership ---</option>
              <?php foreach ($memlist as $mlist):?>
              <?php $selected = ($row['membership_id'] == $mlist['id']) ? " selected=\"selected\"" : "";?>
              <option value="<?php echo $mlist['id'];?>"<?php echo $selected;?>><?php echo $mlist['title'];?></option>
              <?php endforeach;?>
              <?php unset($mlist);?>
            </select>
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>In Mailing List:</strong></td>
          <td><input name="notify" type="radio"  value="1" <?php if ($row['notify'] == 1) echo "checked=\"checked\""; ?> />
            Yes
            &nbsp;<input type="radio" name="notify" value="0" <?php if ($row['notify'] == 0) echo "checked=\"checked\""; ?>/>
            No</td>
        </tr>
        <tr>
          <td><strong>User Status:</strong></td>
          <td><input name="status" type="radio"  value="1" <?php if ($row['status'] == 1) echo "checked=\"checked\""; ?> />
            Active
            &nbsp;<input type="radio" name="status" value="0" <?php if ($row['status'] == 0) echo "checked=\"checked\""; ?>/>
            Inactive</td>
        </tr>
        <tr>
          <td><strong>User Level:</strong></td>
          <td>
          <select name="userlevel" id="userlevel" class="select">
          <option value="1"<?php if ($row['userlevel'] == 1) echo "selected=\"selected\""; ?>>--- Registered User ---</option>
          <option value="9"<?php if ($row['userlevel'] == 9) echo "selected=\"selected\""; ?>>--- Administrator ---</option>
          </select>
          </td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php elseif(get("action") && get('action') == "add"):?>
<?php $memlist = $membership->getMemberships();?>
<?php if(isset($_POST['submit'])):?>
<?php $session->addUser();?>
<?php endif;?>
<h1><span>Add</span> User</h1>
<p class="info">Here you can add new user. Fields marked
  <?php required();?>
  are required.</p>
<?php display_msg (); ?>
<div class="inner">
  <form action="" method="post" id="admin_form" name="admin_form">
    <input name="add_user" type="hidden" value="1" />
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="5">Adding New User</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="5"><input name="submit" type="submit" value="Add User"  class="button"/>
            <input name="cancel" type="button" value="Cancel"  class="button-alt" onclick="window.location='index.php?do=users&amp;sub=users';"/></td>
        </tr>
      </tfoot>
      <tbody>
        <tr>
          <td width="150"><strong>User Name:</strong></td>
          <td><input name="username" id="username" type="text" class="inputbox" size="45" onkeyup="this.value" />
            <?php required().tooltip("No spaces, more than 4 characters and containing 0-9,a-z,A-Z");?></td>
          <td><span id="status"></span></td>
        </tr>
        <tr>
          <td><strong>User Password:</strong></td>
          <td colspan="2"><input name="password" type="text"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>User Email:</strong></td>
          <td colspan="2"><input name="email" type="text"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>First and Last Name:</strong></td>
          <td colspan="2"><input name="name" type="text"  class="inputbox" size="45" />
            <?php required();?></td>
        </tr>
          <td><strong>Membership Type:</strong></td>
          <td colspan="2"><select name="membership_id" id="membership_id" class="select">
              <option value="NA">--- Select Membership ---</option>
              <?php foreach ($memlist as $mlist):?>
              <option value="<?php echo $mlist['id'];?>"><?php echo $mlist['title'];?></option>
              <?php endforeach;?>
              <?php unset($mlist);?>
            </select>
            <?php required();?></td>
        </tr>
        <tr>
          <td><strong>In Mailing List:</strong></td>
          <td colspan="2"><input name="notify" type="radio"  value="1" checked="checked" />
            Yes
            &nbsp;<input type="radio" name="notify" value="0" />
            No</td>
        </tr>
        <tr>
          <td><strong>User Status:</strong></td>
          <td colspan="2"><input name="status" type="radio"  value="1" checked="checked" />
            Active
            &nbsp;<input type="radio" name="status" value="0" />
            Inactive</td>
        </tr>
        <tr>
          <td><strong>User Level:</strong></td>
          <td colspan="2">
          <select name="userlevel" id="userlevel" class="select">
          <option value="1">--- Registered User ---</option>
          <option value="9">--- Administrator ---</option>
          </select>
          </td>
        </tr>
        <tr>
          <td><strong>Notify User:</strong></td>
          <td colspan="2"><input type="checkbox" name="send_notify" id="send_notify" value="1" />
            <?php tooltip("Send welcome email to user");?></td>
        </tr>
      </tbody>
    </table>
  </form>
</div>
<?php else:?>
<?php $session->setActiveInactive("users", "index.php?do=users&sub=users");?>
<h1><span>Manage</span> Users</h1>
<p class="info">Below are your registered users. You can add remove or activate.</p>
<?php display_msg (); ?>

<div class="inner">
  <div class="utility">
    <table border="0" cellspacing="0" cellpadding="0" class="box">
      <tr>
        <td><!--<a href="index.php?do=users&amp;sub=users&amp;action=add" class="button-alt">Add New User</a>--></td>
        <td><form action="" method="post">
            <input name="search" type="text" class="inputbox" id="search-input"  onfocus="if(this.value=='Find username...'){this.value=''};" onblur="if(this.value==''){this.value='Find username...'};" value="Find username..." size="40"/>
            <input name="submit" type="submit" class="button" value="Find" />
          </form></td>
        <td align="right"><!--<form action="" method="get" name="filter_browse" id="filter_browse">
            <strong>User Filter:&nbsp;</strong> <?php echo $session->getUserFilter();?>
          </form>--></td>
      </tr>
    </table>
  </div>
  <form action="" method="post" id="itemList" name="itemList">
    <table cellspacing="0" cellpadding="0" class="box">
      <thead>
        <tr>
          <td colspan="7">Viewing Registered Users</td>
        </tr>
      </thead>
      <tfoot>
        <tr>
          <td colspan="7"><div class="pagination"><?php echo $pager->display_pages();?></div></td>
        </tr>
      </tfoot>
      <tr>
        <th width="25" nowrap="nowrap">#</th>
        <th>Username</th>
        <th>Fullname</th>
        <th>Email</th>
        <th>Registered</th>
        <!--<th>Last Active</th>-->
        <th class="right">Actions</th>
      </tr>
      <tbody>
        <?php foreach ($usrow as $row):?>
        <?php $memrow = $membership->getMembershipById($row['membership_id']);?>
        <tr<?php echo ($row['id'] == 1) ? " class=\"admin\"" : "";?>>
          <td><?php echo $row['id'];?>.</td>
          <td><?php echo $row['username'];?></td>
          <td><?php echo $row['name'];?></td>
          <td><?php echo $row['email'];?></td>
          <td><?php echo $row['created'];?></td>
          <!--<td><?php echo $row['last_access'];?></td>-->
          <!--<td class="right"><?php $status = ($row['status'] == 0) ? 1:0;?>
            <?php $image = ($row['status'] == 0) ? "inactive":"active";?>
            <?php $paid = ($memrow['free'] == 0) ? "free":"paid";?>
            <a href="index.php?do=users&amp;sub=users&amp;publish=<?php echo $status;?>&amp;id=<?php echo $row['id'];?>"> <img src="images/<?php echo $image;?>.png" class="tooltip" title="Set Active/inactive" /></a> <img src="images/<?php echo $paid;?>.png" class="tooltip" title="Membership Type: <?php echo $memrow['title'];?>"/> <a href="index.php?do=users&amp;sub=users&amp;action=edit&amp;id=<?php echo $row['id'];?>"><img src="images/edit.png" class="tooltip" title="Edit User: <?php echo $row['username'];?>"/></a>
            <?php if($row['id'] != 1):?>
            <a href="#" class="delete-user" id="item_<?php echo $row['id'];?>"><img src="images/delete.png" class="tooltip" title="Delete User: <?php echo $row['username'];?>" /></a>
            <?php endif;?></td>-->
            <td class="right">
            	<?php if($row['userlevel']!=1): ?>
                <a href="index.php?do=users&amp;sub=users&amp;action=edit&amp;id=<?php echo $row['id'];?>"><img src="images/edit.png" class="tooltip" title="Edit User: <?php echo $row['username'];?>"/></a>
	            <?php endif;?>
            </td>
        </tr>
        <?php endforeach;?>
        <?php unset($row);?>
      </tbody>
    </table>
  </form>
</div>
<?php endif;?>
<script type="text/javascript">
// <![CDATA[
    $(document).ready(function() {
		// Delete User
        $('a.delete-user').click(function(e) {
            if (confirm("Are you sure you want to delete this user?")) {
                e.preventDefault();
                var parent = $(this).parent().parent();
                $.ajax({
                    type: 'post',
                    url: "ajax/process.php",
                    data: 'deleteUser=' + $(this).attr('id').replace('item_', ''),
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

		//Username check
        $("#username").change(function() {
            var usr = $("#username").val();

            if (usr.length >= 4) {
                $("#status").html('<img src="images/ajax-loader.gif">&nbsp;Checking availability...');

                $.ajax({
                    type: "POST",
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