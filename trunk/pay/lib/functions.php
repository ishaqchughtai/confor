<?php
  /**
   * Functions.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: functions.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  /**
   * redirect_to()
   * 
   * @param mixed $location
   * @return
   */
  function redirect_to($location)
  {
      if (!headers_sent())
          header('Location: ' . $location);
      else {
          echo '<script type="text/javascript">';
          echo 'window.location.href="' . $location . '";';
          echo '</script>';
          echo '<noscript>';
          echo '<meta http-equiv="refresh" content="0;url=' . $location . '" />';
          echo '</noscript>';
      }
  }
  
  /**
   * countEntries()
   * 
   * @param mixed $table
   * @param string $where
   * @param string $what
   * @return
   */
  function countEntries($table, $where = '', $what = '')
  {
      global $db;
      if (!empty($where) && isset($what)) {
          $q = "SELECT COUNT(*) FROM " . $table . "  WHERE " . $where . " = '" . $what . "' LIMIT 1";
      } else
          $q = "SELECT COUNT(*) FROM " . $table . " LIMIT 1";
      
      $record = $db->query($q);
      $total = $db->fetchrow($record);
      return $total[0];
  }
  
  
  /**
   * display_msg()
   * 
   * @return
   */
  function display_msg()
  {
      global $msgOk, $msgError, $msgAlert, $msgInfo, $msgSys, $showMsg;
      
      if (!empty($msgOk)) {
          echo "<div id=\"fader\"><div class=\"msgOk\">" . $msgOk . "</div></div>
    <script type=\"text/javascript\"> 
    // <![CDATA[
    $(document).ready(function() {       
      setTimeout(function() {       
        $(\"#fader\").customFadeOut(\"slow\" ,    
        function() {       
          $(\"#fader\").remove();  
        });
      },
      4000);
    });
    // ]]>
    </script>";
      }
      if (!empty($msgError)) {
          echo "<div id=\"fader\"><div class=\"msgError\">" . $msgError . "</div></div>
    <script type=\"text/javascript\"> 
    // <![CDATA[
    $(document).ready(function() {       
      setTimeout(function() {       
        $(\"#fader\").customFadeOut(\"slow\",    
        function() {       
          $(\"#fader\").remove();  
        });
      },
      4000);
    });
    // ]]>
    </script>";
      }
      if (!empty($msgAlert)) {
          echo "<div id=\"fader\"><div class=\"msgAlert\">" . $msgAlert . "</div></div>
    <script type=\"text/javascript\"> 
    // <![CDATA[
    $(document).ready(function() {       
      setTimeout(function() {       
        $(\"#fader\").customFadeOut(\"slow\",    
        function() {       
          $(\"#fader\").remove();  
        });
      },
      4000);
    });
    // ]]>
    </script>";
      }
      if (!empty($msgInfo)) {
          echo "<div id=\"fader\"><div class=\"msgInfo\">" . $msgInfo . "</div></div>
    <script type=\"text/javascript\"> 
    // <![CDATA[
    $(document).ready(function() {       
      setTimeout(function() {       
        $(\"#fader\").customFadeOut(\"slow\",    
        function() {       
          $(\"#fader\").remove();  
        });
      },
      4000);
    });
    // ]]>
    </script>";
      }
      echo $showMsg;
  }
  
  /**
   * getChecked()
   * 
   * @param mixed $row
   * @param mixed $status
   * @return
   */
  function getChecked($row, $status)
  {
      if ($row == $status) {
          echo "checked=\"checked\"";
      }
  }
  
  /**
   * post()
   * 
   * @param mixed $var
   * @return
   */
  function post($var)
  {
      if (isset($_POST[$var]))
          return $_POST[$var];
  }
  
  /**
   * get()
   * 
   * @param mixed $var
   * @return
   */
  function get($var)
  {
      if (isset($_GET[$var]))
          return $_GET[$var];
  }
  
  /**
   * getDays()
   * 
   * @param mixed $number
   * @param mixed $term
   * @return
   */

  function getDays($number, $term)
  {
      switch ($term) {
          case 'D':
              return $number;
              break;
          case 'W':
              return($number * 7);
              break;
          case 'M':
              return($number * 31);
              break;
          case 'Y':
              return($number * 365);
              break;
      }
  }
  
  /**
   * getTerm()
   * 
   * @param mixed $term
   * @return
   */
  function getTerm($term)
  {
      switch ($term) {
          case 'D':
              return 'Days';
              break;
          case 'W':
              return 'Weeks';
              break;
          case 'M':
              return 'Months';
              break;
          case 'Y':
              return 'Years';
              break;
      }
  }
  
  /**
   * format_date()
   * 
   * @param mixed $date
   * @param mixed $style
   * @return
   */
  function format_date($date, $style = null)
  {
      $date = date("m/d/Y g:i A T", strtotime($date));
      return $date;
  }
  
  /**
   * getDifference()
   * 
   * @param mixed $startDate
   * @param mixed $endDate
   * @param integer $format
   * @return
   */
  function getDifference($startDate, $endDate, $format = 6)
  {
      @list($date, $time) = explode(' ', $endDate);
      $startdate = explode("-", $date);
      $starttime = explode(":", $time);
      
      list($date, $time) = explode(' ', $startDate);
      $enddate = explode("-", $date);
      $endtime = explode(":", $time);
      
      $secondsDifference = @mktime($endtime[0], $endtime[1], $endtime[2], $enddate[1], $enddate[2], $enddate[0]) - @mktime($starttime[0], $starttime[1], $starttime[2], $startdate[1], $startdate[2], $startdate[0]);
      
      switch ($format) {
          case 0:
              return $secondsDifference;
          case 1:
              return floor($secondsDifference / 60);
          case 2:
              return floor($secondsDifference / 60 / 60);
          case 3:
              return floor($secondsDifference / 60 / 60 / 24);
          case 4:
              return floor($secondsDifference / 60 / 60 / 24 / 7);
          case 5:
              return floor($secondsDifference / 60 / 60 / 24 / 7 / 4);
          default:
              return floor($secondsDifference / 365 / 60 / 60 / 24);
      }
  }
  
  /**
   * sanitize()
   * 
   * @param mixed $string
   * @param bool $trim
   * @return
   */
  function sanitize($string, $trim = false)
  {
      $string = filter_var($string, FILTER_SANITIZE_STRING);
      $string = trim($string);
      $string = stripslashes($string);
      $string = strip_tags($string);
      $string = str_replace(array('‘', '’', '“', '”'), array("'", "'", '"', '"'), $string);
      if ($trim)
          $string = substr($string, 0, $trim);
      
      return $string;
  }
  
  
  /**
   * self()
   * 
   * @return
   */
  function self()
  {
      return htmlspecialchars($_SERVER['PHP_SELF']);
  }
  
  /**
   * tooltip()
   * 
   * @param mixed $tip
   * @return
   */
  function tooltip($tip)
  {
      echo '<img src="' . ADMINURL . '/images/help2.png" alt="Tip" class="tooltip" title="' . $tip . '" />';
  }
  
  /**
   * required()
   * 
   * @return
   */
  function required()
  {
      echo '<img src="' . ADMINURL . '/images/required.png" alt="This is a required field." class="tooltip" title="This is a required field." />';
  }
?>