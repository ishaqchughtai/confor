<?php
  /**
   * Class Users.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_users.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  class User
  {
      public $msgs = array();
      
      /**
       * User::__construct()
       * 
       * @return
       */
      function __construct()
      {
      }

      /**
       * User::confirmUserID()
       * 
       * @param mixed $username
       * @param mixed $cookie_id
       * @return
       */
      function confirmUserID($username, $cookie_id)
      {
          global $db;
          
          $sql = "SELECT cookie_id FROM users WHERE username = '" . $db->escape($username, true)."'";
          $result = $db->query($sql);
          if (!$result || (mysql_num_rows($result) < 1)) {
              return 1;
          }
          
          $row = $db->fetch($result);
          $row ['cookie_id'] = sanitize($row ['cookie_id']);
          $cookie_id = sanitize($cookie_id);
          
          if ($cookie_id == $row ['cookie_id']) {
              return 0;
          } else {
              return 2;
          }
      }

      /**
       * User::confirmUserPass()
       * 
       * @param mixed $username
       * @param mixed $password
       * @return
       */
      function confirmUserPass($username, $password)
      {
          global $db;

          $sql = "SELECT password,token FROM users WHERE username = '" . $db->escape($username, true)."'";
          $result = $db->query($sql);
          if (!$result) {
              return 0;
          }
          
          $row = $db->fetch($result);
          
          if ($row['token'] != 0)
              return 3;
          
          
          $row['password'] = sanitize($row['password']);
          $password = sanitize($password);
          
          $entered_pass = md5($password);
          
          if ($entered_pass == $row['password']) {
              return 1;
          } else {
              return 2;
          }
      }

      /**
       * User::setUserActive()
       * 
       * @param mixed $email
       * @param mixed $token
       * @return
       */
      function setUserActive($email, $token)
      {
          global $db;
          
		  $data['token'] = 0;
		  $data['status'] = 1;
		
		  $db->update("users", $data, "email = '" . $email . "' AND token = '" . $token . "' LIMIT 1");
          
          if ($db->affected() <= 0)
              return false;
          else
              return true;
      }

      /**
       * User::validateToken()
       * 
       * @param mixed $token
       * @return
       */
      function validateToken($token)
      {
          global $db;
          
          $sql = "SELECT token" 
		  . "\n FROM users" 
		  . "\n WHERE token ='" . $db->escape($token, true) . "'" 
		  . "\n LIMIT 1";
          $result = $db->query($sql);
          
          if (mysql_num_rows($result))
              return true;
      }

      /**
       * User::usernameExists()
       * 
       * @param mixed $username
       * @return
       */
      function usernameExists($username)
      {
          global $db;
          
          if (strlen($db->escape($username, true)) < 4)
              return 1;
          
          $alpha_num = str_replace(" ", "", $username);
          if (!ctype_alnum($alpha_num))
              return 2;
          
          $sql = $db->query("SELECT id" 
				. "\n FROM users" 
				. "\n WHERE username = '" . sanitize($username) . "'" 
				. "\n LIMIT 1");
          if ($db->numrows($sql) > 0)
              return 3;
          else
              return false;
      }

      /**
       * User::updateUserField()
       * 
       * @param mixed $username
       * @param mixed $field
       * @param mixed $value
       * @return
       */
      function updateUserField($username, $field, $value)
      {
          global $db;
		  
		  $username = sanitize($username);
		  $value = sanitize($value);
		  
		  $data[$field] = $value;
		  
		  $db->update("users", $data, "username='" . $db->escape($username, true) . "'");

      }

      /**
       * User::getUserInfo()
       * 
       * @param mixed $username
       * @return
       */
      function getUserInfo($username)
      {
          global $db;
          $sql = "SELECT * FROM users WHERE username = '" . $db->escape($username, true)."'";
          $result = $db->query($sql);
          if (!$username) {
              return false;
          }
          
          if (mysql_num_rows($result) > 0) {
              $row = $db->fetch($result);
              return $row;
          } else
              return null;
      }
	  
      /**
       * User::getUserById()
       * 
       * @param mixed $id
       * @return
       */
      public function getUserById($id)
      {
          global $db;
          $sql = "SELECT * FROM users WHERE id = '" . (int)$id . "'";
          $row = $db->first($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }

      /**
       * User::getUserList()
       * 
       * @return
       */
      public function getUserList()
      {
          global $db;
          $sql = "SELECT id, username,email FROM users ORDER BY username";
          $row = $db->fetch_all($sql);
          
          if ($row) {
              return $row;
          } else
              return 0;
      }
	  
      /**
       * User::getUsers()
       * 
       * @param bool $sort
       * @param bool $where
       * @return
       */
      public function getUsers($sort = false, $where = false)
      {
          global $db, $pager;

		  $pager = new Paginator();
		  $counter = countEntries('users');
		  $pager->items_total = $counter;
		  $pager->default_ipp = 10;
		  $pager->paginate();
		  
		  if ($counter == 0) {
			$pager->limit = "";
		  }
		  ($sort) ? $order = $sort : $order = "id ASC";
		  ($where) ? $where = "WHERE username LIKE '%".sanitize($where)."%'" : "";
		  
          $sql = "SELECT *, DATE_FORMAT(register_date, '%d %b %Y') as created FROM users " . $where . " ORDER BY " . $order.$pager->limit;
          $row = $db->fetch_all($sql);
          
          return $row;

      }


      /**
       * User::addNewUser()
       * 
       * @param mixed $username
       * @param mixed $password
       * @param mixed $email
       * @param mixed $token
       * @return
       */
      function addNewUser($username, $password, $email, $token)
      {
          global $db, $setup;
		  
		  $status = ($setup->set['reg_verify'] == 1) ? 0 : 1;
		  $data = array(
				  'username' => $username, 
				  'password' => $password, 
				  'token' => $token, 
				  'cookie_id' => 0,
				  'userlevel' => 1,
				  'email' => $email,
				  'status' => $status,
				  'last_ip' => $_SERVER['REMOTE_ADDR'],
				  'membership_id' => 1,
				  'register_date' => "NOW()"
		  );
				  
		  $db->insert("users", $data);
      }
	  
      /**
       * User::addUser()
       * 
       * @return
       */
      public function addUser()
      {
          global $db, $setup, $msgAlert, $showMsg, $mailer;
          if (isset($_POST['add_user']) && $_POST['add_user'] == 1) {
              if (empty($_POST['username']))
                  $this->msgs['username'] = "Please enter Username";
              
              if (empty($_POST['password']))
                  $this->msgs['password'] = "Please enter User Password";

              if ($_POST['membership_id'] == "NA")
                  $this->msgs['membership_id'] = "Please select Membership Type from dropdown list";
				  
              if (empty($_POST['email']))
                  $this->msgs['email'] = "Please enter User Email";

			  if ($this->emailExists($_POST['email']))
				  $this->msgs['email'] = "Entered Email Address is already in use.";
			  
			  if (!$this->isValidEmail($_POST['email']))
				  $this->msgs['email'] = "Entered Email Address is not valid.";
		  
              if (empty($_POST['name']))
                  $this->msgs['name'] = "Please enter User First and Lastname";

			  if ($value = $this->usernameExists($_POST['username'])) {
				  if ($value == 1)
					  $this->msgs['username'] = "Username is too short (less than 4 characters long)";
				  if ($value == 2)
					  $this->msgs['username'] = "Invalid characters found in Username";
				  if ($value == 3)
					  $this->msgs['username'] = "Sorry, this Username is already taken";
			  }
	  
              if (empty($this->msgs)) {
                  $data = array(
						  'username' => sanitize($_POST['username']), 
						  'password' => md5($_POST['password']), 
						  'email' => sanitize($_POST['email']), 
						  'name' => sanitize($_POST['name']),
						  'membership_id' => intval($_POST['membership_id']),
						  'userlevel' => intval($_POST['userlevel']),
						  'notify' => intval($_POST['notify']),
						  'status' => intval($_POST['status']),
						  'register_date' => "NOW()",
				  );
                  
				  $db->insert("users", $data);
				  if ($db->affected())
					  if (intval($_POST['send_notify']) == 1) {
						  
						  require_once("class_mailer.php");
						  $mail_template = $setup->getEmailTemplateById(3);
				  
						  $body = str_replace(
							array('[NAME]', '[USERNAME]', '[PASSWORD]', '[URL]', '[SITE_NAME]'), 
							array($data['name'], $data['username'], $_POST['password'], $setup->set['site_url'], $setup->set['site_name']), $mail_template['body']
							);
				  
							$mail = $mailer->sendMail($data['email'], $mail_template['subject'], $body);
						}
					
					redirect_to("index.php?do=users&sub=users&added=1");
				} else {
					$showMsg = '<div class="msgError"><span>An error occurred while adding user:</span><ul class="error">';
					foreach ($this->msgs as $msg) {
						$showMsg .= "<li>" . $msg . "</li>\n";
					}
					$showMsg .= '</ul></div>';
				}
			}
		}

      /**
       * User::updateUser()
       * 
       * @param mixed $id
       * @return
       */
      public function updateUser($id)
      {
          global $db, $setup, $msgAlert, $showMsg;
		  
          if (isset($_POST['edit_user']) && $_POST['edit_user'] == 1) {
			  
			  $userrow = $this->getUserById($id);

              if ($_POST['membership_id'] == "NA")
                  $this->msgs['membership_id'] = "Please select Membership Type from dropdown list";
				  
              if (empty($_POST['email']))
                  $this->msgs['email'] = "Please enter User Email";

			  if ($this->emailExists($_POST['email']) and $_POST['email'] != $userrow['email'])
				  $this->msgs['email'] = "Entered Email Address is already in use.";
			  
			  if (!$this->isValidEmail($_POST['email']))
				  $this->msgs['email'] = "Entered Email Address is not valid.";
		  
              if (empty($_POST['name']))
                  $this->msgs['name'] = "Please enter User First and Lastname";

	  
              if (empty($this->msgs)) {
                  $data = array(
						  'email' => sanitize($_POST['email']), 
						  'name' => sanitize($_POST['name']),
						  'membership_id' => intval($_POST['membership_id']),
						  'userlevel' => intval($_POST['userlevel']),
						  'notify' => intval($_POST['notify']),
						  'status' => intval($_POST['status'])
				  );
				  
				  if ($_POST['password'] != "") {
					  $data['password'] = md5($_POST['password']);
				  } else
					  $data['password'] = $userrow['password'];
					  
				  $db->update("users", $data, "id='" . $id . "'");
				  
				  if ($db->affected())
					redirect_to("index.php?do=users&sub=users&action=edit&id=".$id);
				} else {
					$showMsg = '<div class="msgError"><span>An error occurred while updating user:</span><ul class="error">';
					foreach ($this->msgs as $msg) {
						$showMsg .= "<li>" . $msg . "</li>\n";
					}
					$showMsg .= '</ul></div>';
				}
			}
		}
		
      /**
       * User::emailExists()
       * 
       * @param mixed $email
       * @return
       */
      function emailExists($email)
      {
          global $db;
          
		  $email = sanitize($email);
          $sql = $db->query("SELECT id" 
				. "\n FROM users" 
				. "\n WHERE email = '" . $db->escape($email,true) . "'" 
				. "\n LIMIT 1");
          if (mysql_num_rows($sql) == 1)
              return true;
          else
              return false;
      }
	  
      /**
       * User::isValidEmail()
       * 
       * @param mixed $email
       * @return
       */
      function isValidEmail($email)
      {
          if (function_exists('filter_var')) {
              if (filter_var($email, FILTER_VALIDATE_EMAIL)) {
                  return true;
              } else {
                  return false;
              }
          } else {
              return preg_match('/^[a-zA-Z0-9._+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/', $email);
          }
      }
	  
      /**
       * User::getUserFilter()
       * 
       * @return
       */
      function getUserFilter()
      {
          $this->sort_query = "";
          $this->sort_list = "<select onchange=\"if(this.value!='NA') window.location = 'index.php?do=users&amp;sub=users&amp;sort='+this[this.selectedIndex].value; else window.location = 'index.php?do=users&amp;sub=users';\" class=\"select\">";
          $sort_columns = array(
						  'NA' => '--- Select Sort Filter ---', 
						  'ASC_id' => 'ID ASC &uarr;', 
						  'DSC_id' => 'ID DESC &darr;', 
						  'ASC_register_date' => 'Registration Date ASC &uarr;', 
						  'DSC_register_date' => 'Registration Date DESC &darr;', 
						  'ASC_email' => 'Email Address ASC &uarr;', 
						  'DSC_email' => 'Email Address DESC &darr;', 
						  'ASC_last_access' => 'Last Access ASC &uarr;', 
						  'DSC_last_access' => 'Last Access DESC &darr;', 
						  'ASC_status' => 'Status ASC &uarr;', 
						  'DSC_status' => 'Status DESC &darr;'
			);
		  $this->getFilterLoop($sort_columns);
          $this->sort_list .= "</select>";
          
          return $this->sort_list;
 
      }
	  
      /**
       * User::getFilterLoop()
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
                      $this->sort_list .= "<option value=\"".$sid."\" selected=\"selected\">".$label."</option>\n";
                  else
                      $this->sort_list .= "<option value=\"".$sid."\">".$label."</option>\n";
              } else
                  $this->sort_list .= "<option value=\"".$sid."\">".$label."</option>\n";
          }
	  }
	  
      /**
       * User::setActiveInactive()
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