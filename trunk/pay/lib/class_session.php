<?php
  /**
   * Session.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_users.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php
  class Session extends User
  {
      public $logged_in = null;
      public $username;
      public $cookie_id = 0;
      public $userlevel;
      public $userinfo = array();
	  public $msgs = array();
      
      
      /**
       * Session::__construct()
       * 
       * @return
       */
      function __construct()
      {
		  $this->time = "NOW()";
          $this->startSession();
          parent::__construct();
      }

      /**
       * Session::set()
       * 
       * @param mixed $variable
       * @param mixed $value
       * @return
       */
      function set($variable, $value)
      {
          $_SESSION[$variable] = $value;
          $this->vars[$variable] = $value;
      }

      /**
       * Session::value()
       * 
       * @param mixed $variable
       * @return
       */
      function value($variable)
      {
          return $_SESSION[$variable];
      }

      /**
       * Session::is_set()
       * 
       * @param mixed $variable
       * @return
       */
      function is_set($variable)
      {
          return(!empty($_SESSION[$variable])) ? true : false;
      }

      /**
       * Session::unregister()
       * 
       * @param mixed $variable
       * @return
       */
      function unregister($variable)
      {
          if (isset($_SESSION[$variable])) {
              unset($_SESSION[$variable]);
              $this->vars[$variable] = null;
          }
      }

      /**
       * Session::check_pin()
       * 
       * @param mixed $generated
       * @param mixed $submitted
       * @return
       */
      function check_pin($generated, $submitted)
      {
          return(substr(md5($generated), 15, 8) == $submitted) ? true : false;
      }
      
      /**
       * Session::generate_pin()
       * 
       * @param mixed $submitted
       * @return
       */
      function generate_pin($submitted)
      {
          return substr(md5($submitted), 15, 8);
      }

      /**
       * Session::unlink_pin()
       * 
       * @return
       */
      function unlink_pin()
      {
          if ($this->is_set('pin_value')) {
              @unlink(MSPATH . 'cache/site_pin_' . $this->value('pin_value') . '.jpg');
              $this->unregister('pin_value');
          }
      }
      
      /**
       * Session::show_pin()
       * Generates captcha image
       * @param mixed $pin
       * @param mixed $generated
       * @return
       */
      function show_pin($pin, $generated)
      {
          $font = 10;
          $width = imagefontwidth($font) * strlen($generated);
          $height = imagefontheight($font);
          
          $im = @imagecreate($width, $height);
          //cell background
          $bg = imagecolorallocate($im, 255, 255, 255);
          //text color
          $textcolor = imagecolorallocate($im, 0, 0, 0);
          imagestring($im, $font, 0, 0, $generated, $textcolor);
          touch(MSPATH . 'cache/site_pin_' . $pin . '.jpg');
          imagejpeg($im, MSPATH . 'cache/site_pin_' . $pin . '.jpg');
          
          $output = '<img src="' . SITEURL . '/cache/site_pin_' . $pin . '.jpg" alt="Please type the code you see in the box"/>';
          
          imagedestroy($im);
          
          return $output;
      }
	  
      /**
       * Session::startSession()
       * 
	   * Performs all the actions necessary to 
       * initialize this session object
       * @return
       */
      function startSession()
      {
          @session_start();		  
          
          $this->logged_in = $this->checkLogin();
          
          if (!$this->logged_in) {
              $this->username = $_SESSION['username'] = "Guest";
              $this->userlevel = 0;
			  redirect_to("../");
          }
          

      }
      
      /**
       * Session::checkLogin()
       * 
	   * Checks if the user has already logged in
       * @return
       */
      function checkLogin()
      {
          if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID'])) {
              $this->username = $_SESSION['username'] = $_COOKIE['MSM_COOKIE'];
              $this->cookie_id = $_SESSION['cookie_id'] = $_COOKIE['MSM_COOKIE_ID'];
          }
          
          if (isset($_SESSION['username']) && isset($_SESSION['cookie_id']) && $_SESSION['username'] != "Guest") {
              if (User::confirmUserID($_SESSION['username'], $_SESSION['cookie_id']) != 0) {
                  unset($_SESSION['username']);
                  unset($_SESSION['cookie_id']);
                  return false;
              }
              
              $this->userinfo = User::getUserInfo($_SESSION['username']);
              $this->username = $this->userinfo['username'];
              $this->cookie_id = $this->userinfo['cookie_id'];
              $this->userlevel = $this->userinfo['userlevel'];
              return true;
          } else {
              return false;
          }
      }
      
      /**
       * Session::login()
       * 
	   * Effectively logging in the user
       * @param mixed $uname
       * @param mixed $upass
       * @param mixed $uremember
       * @return
       */
      function login($uname, $upass, $uremember)
      {
          global $msgError;
          if (!$uname || strlen($uname = trim($uname)) == 0) {
              $msgError = "<span>Error!</span>Please enter valid username and password.";
          }
          
          if (!$upass) {
              $msgError = "<span>Error!</span>Please enter valid username and password.";
          }
          
          $uname = sanitize($uname);
		  $upass = sanitize($upass);
          $result = User::confirmUserPass($uname, $upass);
          
          
          if ($result == 0) {
              $msgError = "<span>Error!</span>Please enter valid username and password.";
          } elseif ($result == 2) {
              $msgError = "<span>Error!</span>Please enter valid username and password.";
          } elseif ($result == 3) {
              $msgError = "<span>Error!</span>Your user account has not been activated yet!";
          }
          
          if (empty($msgError)) {
			  $this->userinfo = User::getUserInfo($uname);
			  $this->id = $_SESSION['id'] = $this->userinfo['id'];
			  $this->username = $_SESSION['username'] = $this->userinfo['username'];
			  $this->cookie_id = $_SESSION['cookie_id'] = $this->generateRandID();
			  $this->userlevel = $this->userinfo['userlevel'];
              
			  User::updateUserField($this->username, "last_access", $this->time);
              User::updateUserField($this->username, "cookie_id", $this->cookie_id);
			  User::updateUserField($this->username, "last_ip", $_SERVER['REMOTE_ADDR']);
              
			  if ($uremember) {
				  setcookie("MSM_COOKIE", $this->username, time() + COOKIE_EXPIRE, COOKIE_PATH);
				  setcookie("MSM_COOKIE_ID", $this->cookie_id, time() + COOKIE_EXPIRE, COOKIE_PATH);
			  }
              return true;
          } else {
              return false;
          }
      }
      
      /**
       * Session::logout()
       * 
       * @return
       */
      function logout()
      {
          global $db;
          
          if (isset($_COOKIE['MSM_COOKIE']) && isset($_COOKIE['MSM_COOKIE_ID'])) {
              setcookie("MSM_COOKIE", "", time() - COOKIE_EXPIRE, COOKIE_PATH);
              setcookie("MSM_COOKIE_ID", "", time() - COOKIE_EXPIRE, COOKIE_PATH);
          }
          
          unset($_SESSION['username']);
          unset($_SESSION['cookie_id']);
          
          $this->logged_in = false;
          $this->username = "Guest";
          $this->userlevel = 0;
      }
      
      /**
       * Session::register()
       *
	   * Does the registration proccess
       * @param mixed $uname
       * @param mixed $upass
       * @param mixed $upass2
       * @param mixed $umail
       * @return
       */
      function register($uname, $upass, $upass2, $umail, $pin1 = '', $pin2 = '')
      {
          global $setup, $mailer, $msgError, $msgOk, $showMsg;
          
          if (!$uname || strlen($uname = trim($uname)) == 0) {
              $this->msgs[$uname] = "The field Username cannot be left blank. Please enter a value.";
          } else {
              $uname = sanitize($uname);
              if ($value = User::usernameExists($uname)) {
                  if ($value == 1)
                      $this->msgs[$uname] = "Username is too short (less than 4 characters long)";
                  if ($value == 2)
                      $this->msgs[$uname] = "Invalid characters found in Username";
                  if ($value == 3)
                      $this->msgs[$uname] = "Sorry, this Username is already taken";
              } elseif (strcasecmp($uname, "Guest") == 0 || strcasecmp($uname, "Visitor") == 0) {
                  $this->msgs[$uname] = "This username is reserved word";
              }
          }
          
          if (!$upass) {
              $this->msgs[$upass] = "Please enter a valid password!";
          } else {
              $upass = stripslashes($upass);
              if (strlen($upass) < 6) {
                  $this->msgs[$upass] = "Password is too short (less than 6 characters long)";
              } elseif (!preg_match("/^([0-9a-z])+$/i", ($upass = trim($upass)))) {
                  $this->msgs[$upass] = "Password entered is not alphanumeric";
              } elseif ($upass != $upass2) {
                  $this->msgs[$upass] = "Your password did not match the confirmed password!";
              }
          }
          
          if (!$umail || strlen($umail = trim($umail)) == 0) {
              $this->msgs[$umail] = "The field Email Address cannot be left blank. Please enter a value.";
          } elseif (User::emailExists($umail)) {
              $this->msgs[$umail] = "Entered Email Address is already in use.";
          } else {
              $regex = "/^[_+a-z0-9-]+(\.[_+a-z0-9-]+)*" . "@[a-z0-9-]+(\.[a-z0-9-]{1,})*" . "\.([a-z]{2,}){1}$/i";
              if (!preg_match($regex, $umail)) {
                  $this->msgs[$umail] = "Entered Email Address is not valid.";
              }
              
              $umail = sanitize($umail);
          }

          if ($setup->set['captcha'] == 1) {
              $valid_pin = $this->check_pin($pin1, $pin2);
              if (!$valid_pin)
                  $this->msgs[$pin1] = "The pin code you have entered is incorrect";
          }
		  
          if (empty($this->msgs)) {
              $newpass = md5($upass);
              $token = ($setup->set['reg_verify'] == 1) ? $this->generateRandID() : 0;
              
              User::addNewUser($uname, $newpass, $umail, $token);
              
              if ($setup->set['reg_verify'] == 1) {
				  
                  require_once("class_mailer.php");
				  
                  $link = "http://".$_SERVER['SERVER_NAME'] . dirname($_SERVER['SCRIPT_NAME']) 
				  . "/index.php?action=activate&mail=" . urlencode($umail) . "&key=" . $token;
				  
                  $mail_template = $setup->getEmailTemplateById(1);
				  
				  $body = str_replace(array('[USERNAME]', '[PASSWORD]', '[SITE_NAME]', '[LINK]', '[URL]'), 
									   array($uname, $upass, $setup->set['site_name'], $link, $setup->set['site_url']), $mail_template['body']);
				  
				  $mail = $mailer->sendMail($umail, $mail_template['subject'], $body);
                  
                  if ($mail) {
                      $msgOk = "<span>Success!</span>Thank you for registering! A confirmation email has been sent to your address. 
					  Please click on the link in the email in order to activate your account.";
                  }
              } else {
                  $msgOk = "<span>Success!</span>Thank you. Your account is now active. You may now log in.";
              }
          } else {
              $showMsg = "<div class=\"msgError\"><span>Your Submission could not be sent due to the following error(s):</span><ul class=\"error\">";
              
              foreach ($this->msgs as $msg) {
                  $showMsg .= "<li>" . $msg . "</li>\n";
              }
              $showMsg .= '</ul></div>';
          }
      }
      
      /**
       * Session::editAccount()
       * 
	   * Attempts to edit the user's account information
       * @param mixed $uname
       * @param mixed $upass
       * @return
       */
      function editAccount($uname, $upass)
      {
          global $db, $msgOk, $msgAlert, $showMsg;
          
          $upass = sanitize($upass);
          $uname = sanitize($uname);
          
          $userrow = User::getUserInfo($uname);
          
          if ($_POST['email'] == "")
              $this->msgs['email'] = "The field Email Address cannot be left blank. Please enter a value.";
          
          if ($_POST['name'] == "")
              $this->msgs['name'] = "The field First and Last Name cannot be left blank. Please enter a value.";
          
          if (User::emailExists($_POST['email']) and $_POST['email'] != $userrow['email'])
              $this->msgs['email'] = "Entered Email Address is already in use.";
          
          if (!User::isValidEmail($_POST['email']))
              $this->msgs['email'] = "Entered Email Address is not valid.";
          
          if (empty($this->msgs)) {
              $email = sanitize($_POST['email']);
              $name = sanitize($_POST['name']);
              
              if ($upass != "") {
                  $upass = md5($upass);
              } else
                  $upass = $userrow['password'];

			  $data = array(
					  'email' => $email, 
					  'name' => $name, 
					  'password' => $upass,
					  'notify' => intval($_POST['notify'])
			  );
		  
			  $db->update("users", $data, "id = '" . $userrow['id'] . "'");
              
              if ($db->affected()) {
                  redirect_to("index.php?do=profile&updated");
              } else
                  $msgAlert = "<span>Alert!</span> Nothing to update";
          } else {
              $showMsg = "<div class=\"msgError\"><span>Your user profile could not be saved due to the following error(s):</span><ul class=\"error\">";
              foreach ($this->msgs as $msg) {
                  $showMsg .= "<li>" . $msg . "</li>\n";
              }
              $showMsg .= '</ul></div>';
          }
          return true;
      }
      
      /**
       * Session::activateUser()
       * 
	   * Does email acctivation
       * @param mixed $email
       * @param mixed $token
       * @return
       */
      function activateUser($email, $token)
      {
          global $msgAlert, $msgOK, $msgError;
          
          $email = (User::isValidEmail($email)) ? $email : "";
          $token = (strlen($token) == 32) ? $token : "";
          
          if (!User::validateToken($token)) {
              $msgAlert = "<span>Alert!</span>This account has been already activated!";
          } else {
              if (!$token) {
                  $msgError = "<span>Error!</span>The token code is not valid";
              } elseif (!$email) {
                  $msgError = "<span>Error!</span>The email address is not valid";
              } elseif (User::validateToken($token)) {
                  User::setUserActive($email, $token);
              }
          }
          redirect_to("index.php?activation=ok");
      }
      
      /**
       * Session::forgotPass()
       * 
       * @param mixed $uname
       * @param string $pin1 - session generated
       * @param string $pin2 - submited
       * @return
       */
      function forgotPass($uname, $pin1 = '', $pin2 = '')
      {
          global $mailer, $setup, $msgError, $msgOk;
          
          if (!$uname || strlen($uname = trim($uname)) == 0) {
              $msgError = "<span>Error!</span>The field Username cannot be left blank. Please enter a value.";
          } else {
              $uname = sanitize($uname);
              $value = User::usernameExists($uname);
              if (strlen($uname) < 4 || strlen($uname) > 30 || !preg_match("/^([0-9a-z])+$/i", $uname) || !$value == 3) {
                  $msgError = "<span>Error!</span>We are sorry, selected username does not exist in our database.";
              }
          }

          if ($setup->set['captcha'] == 1) {
              $valid_pin = $this->check_pin($pin1, $pin2);
              if (!$valid_pin)
                  $msgError = "<span>Error!</span>The pin code you have entered is incorrect";
          }
			  
          
          if (empty($msgError)) {
              $randpass = $this->generateRandStr(8);
              $newpass = md5($randpass);
              
			  require_once("class_mailer.php");
			  
			  $mail_template = $setup->getEmailTemplateById(2);
			  $user = User::getUserInfo($uname);
              $email = $user['email'];
			  
			  $body = str_replace(array('[USERNAME]', '[PASSWORD]', '[SITE_NAME]', '[LINK]', '[URL]'), 
								   array($uname, $randpass, $setup->set['site_name'], $setup->set['site_url'], $setup->set['site_url']), $mail_template['body']);
			  
			  $mail = $mailer->sendMail($email, $mail_template['subject'], $body);
              
              if ($mail) {
                  User::updateUserField($uname, 'password', $newpass);
                  $msgOk = "<span>Success!</span>Your password has been changed. You will receive the new, temporary password at the email address you've registered. Once you have logged in with this password, you may change it.";
              }
          }
      }
      
      /**
       * Session::isAdmin()
       * 
	   * Checks if logged in user has admin privileges
       * @return
       */
      function isAdmin()
      {
          return($this->userlevel == 9);
      }
      
      /**
       * Session::generateRandID()
       * 
       * @return
       */
      function generateRandID()
      {
          return md5($this->generateRandStr(16));
      }
      
      /**
       * Session::generateRandStr()
       * 
       * @param mixed $length
       * @return
       */
      function generateRandStr($length)
      {
          $randstr = "";
          for ($i = 0; $i < $length; $i++) {
              $randnum = mt_rand(0, 61);
              if ($randnum < 10) {
                  $randstr .= chr($randnum + 48);
              } elseif ($randnum < 36) {
                  $randstr .= chr($randnum + 55);
              } else {
                  $randstr .= chr($randnum + 61);
              }
          }
          return $randstr;
      }
      
  }
?>