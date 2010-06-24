<?php
  /**
   * Process.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: process.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  define("_VALID_PHP", true);
  
  require_once("../init.php");
  
  if (!$session->isAdmin())
      redirect_to("../login.php");
?>
<?php
  /* Delete payment */
  if (isset($_POST['deletePay'])):
       if (intval($_POST['deletePay']) == 0 || empty($_POST['deletePay'])):
       redirect_to("../index.php?do=membership&sub=payments");
  endif;
  
  $id = intval($_POST['deletePay']);
  $db->delete("payments", "id='".$id."'");

  endif;
?>
<?php
  /* Delete membership */
  if (isset($_POST['deleteMem'])):
       if (intval($_POST['deleteMem']) == 0 || empty($_POST['deleteMem'])):
       redirect_to("../index.php?do=membership&sub=memsetup");
  endif;
  
  $id = intval($_POST['deleteMem']);
  $db->delete("memberships", "id='".$id."'");
  $db->delete("rates", "membership_id='".$id."'");

  endif;
?>
<?php
  /* Delete rate */
  if (isset($_POST['deleteRate'])):
       if (intval($_POST['deleteRate']) == 0 || empty($_POST['deleteRate'])):
       redirect_to("../index.php?do=membership&sub=memsetup");
  endif;
  
  $id = intval($_POST['deleteRate']);
  $db->delete("rates", "id='".$id."'");

  endif;
?>
<?php
  /* Delete user */
  if (isset($_POST['deleteUser'])):
       if (intval($_POST['deleteUser']) == 0 || intval($_POST['deleteUser']) == 1 || empty($_POST['deleteUser'])):
       redirect_to("../index.php?do=user&sub=user");
  endif;
  
  $id = intval($_POST['deleteUser']);
  $db->delete("users", "id='".$id."'");

  endif;
?>
<?php
  /* Delete custom field */
  if (isset($_POST['deleteField'])):
       if (intval($_POST['deleteField']) == 0 || empty($_POST['deleteField'])):
       redirect_to("../index.php?do=system&sub=fields");
  endif;
  
  $id = intval($_POST['deleteField']);
  $db->delete("userfields", "id='".$id."'");

  endif;
?>
<?php
  /* Get rate list */
  if (isset($_POST['ratelist']))
      : $memid = intval($_POST['ratelist']);
  
  $display = "";
  
  $sql = $db->query("SELECT id, title, amount, term, term_c FROM rates WHERE membership_id = '" . $memid."'");
  
  $display .= "<select name=\"rate_id\" class=\"select\">";
  $display .= "<option value=\"NA\">--- Select Rate ---</option>\n";
  
  while ($row = $db->fetch($sql))
      : $title = $row['title'];
  $id = $row['id'];
  
  $display .= "<option value=\"" . $id . "\">".$title."(".$setup->set['cur_symbol'].$row['amount'].$setup->set['currency']. " Paypable Every ". $row['term']." ".getTerm($row['term_c']).")</option>\n";
  endwhile;
  
  $display .= "</select>\n";
  echo $display;
  endif;
?>
<?php
  /* Add Rate*/
  if (isset($_POST['add_rate']) && $_POST['add_rate'] == 1)
      : $msgs = array();
  if ($_POST['title'] == "")
      $msgs['title'] = "Please enter Rate Title";
  
  if ($_POST['desc'] == "")
      $msgs['desc'] = "Please enter Rate Description";
  
  if ($_POST['amount'] == "")
      $msgs['amount'] = "Please enter Rate Price";
  
  if (empty($msgs))
      : $id = intval($_POST['membership_id']);
  $data = array(
		  'title' => sanitize($_POST['title']), 
		  'desc' => sanitize($_POST['desc']), 
		  'amount' => sanitize($_POST['amount']), 
		  'term' => intval($_POST['term']), 
		  'term_c' => sanitize($_POST['term_c']), 
		  'automatic' => intval($_POST['automatic']), 
		  'membership_id' => $id
  );
  
  $db->insert("rates", $data);
  if ($db->affected())
      : echo "OK";
  else
      : $msgAlert = "<span>Alert!</span>Nothing to update!";
  endif;
  
  else
      : $showMsg = '<div class="msgError"><span>An error occurred while adding rate:</span><ul class="error">';
  foreach ($msgs as $msg)
      : $showMsg .= "<li>" . $msg . "</li>\n";
  endforeach;
  $showMsg .= '</ul></div>';
  endif;
  display_msg();
  endif;
?>
<?php
  /* Update Rate*/
  if (isset($_POST['update_rate']) && $_POST['update_rate'] == 1)
      : $msgs = array();
  if ($_POST['title'] == "")
      $msgs['title'] = "Please enter Rate Title";
  
  if ($_POST['desc'] == "")
      $msgs['desc'] = "Please enter Rate Description";
  
  if ($_POST['amount'] == "")
      $msgs['amount'] = "Please enter Rate Price";
  
  if (empty($msgs))
      : $id = intval($_POST['rateid']);
  $data = array(
		  'title' => sanitize($_POST['title']), 
		  'desc' => sanitize($_POST['desc']), 
		  'amount' => sanitize($_POST['amount']), 
		  'term' => intval($_POST['term']), 
		  'term_c' => sanitize($_POST['term_c']), 
		  'automatic' => intval($_POST['automatic']), 
		  'membership_id' => intval($_POST['membership_id'])
  );
  
  $db->update("rates", $data, "id='" . (int)$id . "'");
  if ($db->affected())
      : echo "OK";
  else
      : $msgAlert = "<span>Alert!</span>Nothing to update!";
  endif;
  
  else
      : $showMsg = '<div class="msgError"><span>An error occurred while adding rate:</span><ul class="error">';
  foreach ($msgs as $msg)
      : $showMsg .= "<li>" . $msg . "</li>\n";
  endforeach;
  $showMsg .= '</ul></div>';
  endif;
  display_msg();
  endif;
?>
<?php
  /* Check Username*/
  if (isset($_POST['username']) && !empty($_POST['username']))
      : $username = sanitize($_POST['username']);
  
  $sql = $db->query("SELECT username FROM users WHERE username = '" . $db->escape($username) . "'");
  
  if ($db->numrows($sql) == 1)
      : echo '<div class="msgAlert"><span>Alert!</span>Username Taken</div>';
  else
      : echo '<div class="msgOk"><span>Success!</span>Username Available</div>';
  endif;
  
  endif;
?>