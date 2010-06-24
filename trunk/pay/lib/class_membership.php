<?php
  /**
   * Class Membership.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_membership.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  class Membership
  {
      public $set = array();
      public $msgs = array();
      
      /**
       * Membership::__construct()
       * 
       * @return
       */
      function __construct()
      {
      }
      

      /**
       * Membership::checkMembership()
       * 
       * @param mixed $mem_id
       * @return
       */
      public function checkMembership($mem_id)
      {
          global $db, $session;
          $sql = $db->query("SELECT username, membership_id"
				. "\n FROM users WHERE membership_id = '".$mem_id."'"
				. "\n AND username = '".$session->username."'"
				." \n LIMIT 1");
          
		  if ($db->numrows($sql) > 0)
              return 1;
          else
              return false;

      }
	  
      /**
       * Membership::getMembershipById()
       * 
       * @param mixed $id
       * @return
       */
      public function getMembershipById($id)
      {
          global $db;
          $sql = "SELECT * FROM memberships WHERE id = '" . $id . "'";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      
      /**
       * Membership::getMemberships()
       * 
       * @return
       */
      public function getMemberships()
      {
          global $db;
          $sql = "SELECT * FROM memberships";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Membership::getPublicMemberships()
       * 
       * @return
       */
      public function getPublicMemberships()
      {
          global $db;
          $sql = "SELECT * FROM memberships WHERE public = '1'";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
	  
	  /**
	   * Membership::getmeMembershipInfo()
	   * 
	   * @return
	   */
	  public function getmeMembershipInfo()
	  {
		  global $db, $session, $setup;
		  $memrow = $this->getMembershipById($session->userinfo['membership_id']);
		  $payrow = $this->getPaymentByUserId($session->userinfo['id']);
		  $raterow = $this->getRateById($payrow['rate_id']);
		  
		  $getDifference = getDifference(date("Y-m-d G:i:s"), $payrow['date'], 3);
		  $paidForDays = getDays($raterow['term'], $raterow['term_c']);
		  $daysDiffer = $paidForDays - $getDifference;
		  
		  $display = '';
		  
		  if($getDifference > $paidForDays){
		  $session->updateUserField($session->username, "membership_id", 1);
		  $display .= "<tr>";
          $display .= "<td colspan=\"2\"><div class=\"msgAlert\"><span>Alert!</span>Your membership has been expired and not renewed.<br />
		  We are setting your membership to Free Membership to enable payment.</div></td>";
		  $display .= "</tr>";
			  
		  }
			  
		  $display .= "<tr>";
          $display .= "<td><strong>Current Membership: </strong></td>";
          $display .= "<td><strong>" . $memrow['title'] . "</strong></td>";
		  $display .= "</tr>";
		  
		  if ($memrow['free'] != 0) {
			  $display .= "<tr>";
			  $display .= "<td><strong>Current Membership Rate: </strong></td>";
			  $display .= "<td>";
			  if ($payrow['rate_amount'] <= 0 || $payrow['status'] == 0) {
				  $display .= "Your payment might be pending.";
			  } else {
				  $display .= "<strong>You have paid " . $setup->set['cur_symbol'] . $payrow['rate_amount'] . $setup->set['currency'];
				  $display .= " On: " . format_date($payrow['date']) . "</strong></td>";
				  $display .= "</tr>";
				  $display .= "<tr>";
				  $display .= "<td><strong>Membership Expires:</strong></td>";
				  $display .= "<td><strong>" . $daysDiffer . " Days</strong></td>";
				  $display .= " </tr>";
			  }
		  }
		  return $display;
	  }
		  
      /**
       * Membership::updateMembership()
       * 
       * @param mixed $id
       * @return
       */
      public function updateMembership($id)
      {
          global $db, $msgAlert, $showMsg;
          if (isset($_POST['update_membership']) && $_POST['update_membership'] == 1) {
              if (empty($_POST['title']))
                  $this->msgs['title'] = "Please enter Membership Title!";
              
              if (empty($_POST['desc']))
                  $this->msgs['desc'] = "Please enter Membership Description!";
              
              if (empty($this->msgs)) {
                  $data = array(
						  'title' => sanitize($_POST['title']), 
						  'desc' => sanitize($_POST['desc']), 
						  'free' => intval($_POST['free']), 
						  'public' => intval($_POST['public'])
				  );
                  
                  $db->update("memberships", $data, "id='" . (int)$id . "'");
                  if ($db->affected()) {
                      redirect_to("index.php?do=membership&sub=memsetup&action=edit&id=" . $id);
                  } else {
                      $msgAlert = "<span>Alert!</span>Nothing to update!";
                  }
              } else {
                  $showMsg = '<div class="msgError"><span>An error occurred while updating membership:</span><ul class="error">';
                  foreach ($this->msgs as $msg) {
                      $showMsg .= "<li>" . $msg . "</li>\n";
                  }
                  $showMsg .= '</ul></div>';
              }
          }
      }
      
      /**
       * Membership::addMembership()
       * 
       * @return
       */
      public function addMembership()
      {
          global $db, $msgAlert, $showMsg;
          if (isset($_POST['add_membership']) && $_POST['add_membership'] == 1) {
              if (empty($_POST['title']))
                  $this->msgs['title'] = "Please enter Membership Title!";
              
              if (empty($_POST['desc']))
                  $this->msgs['desc'] = "Please enter Membership Description!";
              
              if (empty($this->msgs)) {
                  $data = array(
						  'title' => sanitize($_POST['title']), 
						  'desc' => sanitize($_POST['desc']), 
						  'free' => intval($_POST['free']), 
						  'public' => intval($_POST['public'])
				  );
                  
                  $db->insert("memberships", $data);
                  if ($db->affected())
                      redirect_to("index.php?do=membership&sub=memsetup&added=1");
              } else {
                  $showMsg = '<div class="msgError"><span>An error occurred while adding membership:</span><ul class="error">';
                  foreach ($this->msgs as $msg) {
                      $showMsg .= "<li>" . $msg . "</li>\n";
                  }
                  $showMsg .= '</ul></div>';
              }
          }
      }
      
      /**
       * Membership::getRates()
       * 
       * @return
       */
      public function getRates()
      {
          global $db;
          $sql = "SELECT * FROM rates";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      /**
       * Membership::getRateById()
       * 
       * @param mixed $id
       * @return
       */
      public function getRateById($id)
      {
          global $db;
          $sql = "SELECT * FROM rates WHERE id = '" . $id . "'";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      
      /**
       * Membership::getRatesByMembershipId()
       * 
       * @param mixed $id
       * @return
       */
      public function getRatesByMembershipId($id)
      {
          global $db;
          $sql = "SELECT * FROM rates WHERE membership_id = '" . $id . "'";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      
      /**
       * Membership::getPaymentById()
       * 
       * @param mixed $id
       * @return
       */
      public function getPaymentById($id)
      {
          global $db;
          $sql = "SELECT * FROM payments WHERE id = '" . $id . "'";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Membership::getPaymentByUserId()
       * 
       * @param mixed $id
       * @return
       */
      public function getPaymentByUserId($id)
      {
          global $db;
          $sql = "SELECT * FROM payments WHERE user_id = '" . $id . "' ORDER BY date DESC";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * Membership::verifyTxnId()
       * 
       * @param mixed $txn_id
       * @return
       */
      function verifyTxnId($txn_id)
      {
          global $db;
          
          $sql = $db->query("SELECT id" 
				. "\n FROM payments" 
				. "\n WHERE txn_id = '" . sanitize($txn_id) . "'" 
				. "\n LIMIT 1");
          if ($db->numrows($sql) > 0)
              return false;
          else
              return true;
      }
	  
      /**
       * Membership::getPaymentsByMembershipId()
       * 
       * @param mixed $id
       * @return
       */
      public function getPaymentsByMembershipId($id)
      {
          global $db, $pager;
          
          $pager = new Paginator();
          $counter = countEntries('payments', 'membership_id', $id);
          $pager->items_total = $counter;
          $pager->default_ipp = 10;
          $pager->paginate();
          
          if ($counter == 0) {
              $pager->limit = "";
          }
          $sql = "SELECT * FROM payments WHERE membership_id = '" . $id . "'";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      /**
       * Membership::getPayments()
       * 
       * @param bool $sort
       * @param bool $where
       * @return
       */
      public function getPayments($sort = false, $where = false)
      {
          global $db, $pager;
          
          $pager = new Paginator();
          $counter = countEntries('payments');
          $pager->items_total = $counter;
          $pager->default_ipp = 10;
          $pager->paginate();
          
          if ($counter == 0) {
              $pager->limit = "";
          }
          ($sort) ? $order = $sort : $order = "date DESC";
          ($where) ? $where = "WHERE rate_amount LIKE '%" . sanitize($where) . "%'" : "";
          
          $sql = "SELECT * FROM payments " . $where . " ORDER BY " . $order . $pager->limit;
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
      
      /**
       * Membership::updatePayment()
       * 
       * @param mixed $id
       * @return
       */
      public function updatePayment($id)
      {
          global $db, $msgAlert, $showMsg;
          if (isset($_POST['update_payment']) && $_POST['update_payment'] == 1) {
              if (empty($_POST['rate_amount']))
                  $this->msgs['rate_amount'] = "Please enter Payment Amount!";
              
              if (empty($this->msgs)) {
                  $data = array(
						  'membership_id' => intval($_POST['membership_id']), 
						  'user_id' => intval($_POST['user_id']), 
						  'rate_id' => intval($_POST['rate_id']), 
						  'rate_amount' => sanitize($_POST['rate_amount']), 
						  'rate_id' => intval($_POST['rate_id'])
				  );
                  
                  $db->update("payments", $data, "id='" . (int)$id . "'");
                  if ($db->affected()) {
                      redirect_to("index.php?do=membership&sub=payments&action=edit&memid=" . intval($_POST['membership_id']) . "&id=" . $id);
                  } else {
                      $msgAlert = "<span>Alert!</span>Nothing to update!";
                  }
              } else {
                  $showMsg = '<div class="msgError"><span>An error occurred while updating payment:</span><ul class="error">';
                  foreach ($this->msgs as $msg) {
                      $showMsg .= "<li>" . $msg . "</li>\n";
                  }
                  $showMsg .= '</ul></div>';
              }
          }
      }
      
      /**
       * Membership::addPayment()
       * 
       * @return
       */
      public function addPayment()
      {
          global $db, $msgAlert, $showMsg;
          if (isset($_POST['add_payment']) && $_POST['add_payment'] == 1) {
              if ($_POST['user_id'] == "NA")
                  $this->msgs['user_id'] = "Please select User from dropdown list!";
              
              if ($_POST['membership_id'] == "NA")
                  $this->msgs['membership_id'] = "Please select Membership Type from dropdown list!";
              
              if ($_POST['rate_id'] == "NA")
                  $this->msgs['rate_id'] = "Please select Membership Rate from dropdown list!";
              
              if (empty($_POST['rate_amount']))
                  $this->msgs['rate_amount'] = "Please enter Payment Amount!";
              
              if (empty($this->msgs)) {
                  $data = array(
						  'user_id' => intval($_POST['user_id']), 
						  'membership_id' => intval($_POST['membership_id']), 
						  'rate_id' => intval($_POST['rate_id']), 
						  'rate_amount' => sanitize($_POST['rate_amount']), 
						  'date' => "NOW()", 
						  'status' => 1
				  );
                  
                  $db->insert("payments", $data);
                  if ($db->affected())
                      redirect_to("index.php?do=membership&sub=payments&added=1");
              } else {
                  $showMsg = '<div class="msgError"><span>An error occurred while adding payment:</span><ul class="error">';
                  foreach ($this->msgs as $msg) {
                      $showMsg .= "<li>" . $msg . "</li>\n";
                  }
                  $showMsg .= '</ul></div>';
              }
          }
      }
      
      /**
       * Membership::getPaymentFilter()
       * 
       * @return
       */
      function getPaymentFilter()
      {
          $this->sort_query = "";
          $this->sort_list = "<select onchange=\"if(this.value!='NA') window.location = 'index.php?do=membership&amp;sub=payments&amp;sort='+this[this.selectedIndex].value; else window.location = 'index.php?do=membership&amp;sub=payments';\" class=\"select\">";
          $sort_columns = array(
						  'NA' => '--- Select Sort Filter ---', 
						  'ASC_id' => 'ID ASC &uarr;', 
						  'DSC_id' => 'ID DESC &darr;', 
						  'ASC_user_id' => 'Username ASC &uarr;', 
						  'DSC_user_id' => 'Username DESC &darr;', 
						  'ASC_rate_amount' => 'Payment Amount ASC &uarr;', 
						  'DSC_rate_amount' => 'Payment Amount DESC &darr;', 
						  'ASC_date' => 'Payment Date ASC &uarr;', 
						  'DSC_date' => 'Payment Date DESC &darr;', 
						  'ASC_status' => 'Status ASC &uarr;', 
						  'DSC_status' => 'Status DESC &darr;'
		  );
          $this->getFilterLoop($sort_columns);
          $this->sort_list .= "</select>";
          
          return $this->sort_list;
      }
      
      /**
       * Membership::getFilterLoop()
       * 
       * @param mixed $sort_columns
       * @return
       */
      function getFilterLoop($sort_columns)
      {
          foreach ($sort_columns as $sid => $label) {
              if (get('sort')) {
                  if ($_GET['sort'] != 'NA') {
                      $sort_order = substr($_GET['sort'], 0, 3);
                      if ($sort_order == 'DSC')
                          $sort_order = 'DESC';
                      $this->sort_query = '' . substr($_GET['sort'], 4) . ' ' . $sort_order . '';
                  } else
                      $this->sort_query = '';
                  
                  if ($_GET['sort'] == $sid)
                      $this->sort_list .= "<option value=\"" . $sid . "\" selected=\"selected\">" . $label . "</option>\n";
                  else
                      $this->sort_list .= "<option value=\"" . $sid . "\">" . $label . "</option>\n";
              } else
                  $this->sort_list .= "<option value=\"" . $sid . "\">" . $label . "</option>\n";
          }
      }
      
      /**
       * Membership::setActiveInactive()
       * 
       * @param mixed $table
       * @param mixed $redirect
       * @return
       */
      public function setActiveInactive($table, $redirect)
      {
          global $db, $msgError;
          
          if (isset($_GET['publish'])) {
              $id = intval($_GET['id']);
              
              $data['status'] = intval($_GET['publish']);
              
              $db->update($table, $data, "id='" . $id . "'");
              if ($db->affected() == 1)
                  redirect_to($redirect);
          }
      }
  }
?>