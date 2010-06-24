<?php
  /**
   * Class Mysql.php
   *
   * @package Membership Subscription
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_db.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');

  class Database
  {
      var $server = "";
      var $user = "";
      var $pass = "";
      var $database = "";
      
      var $error = "";
      var $errno = 0;
      var $affected_rows = 0;
      var $query_counter = 0;
      var $link_id = 0;
      var $query_id = 0;
      
      
      /**
       * Database::__construct()
       * 
       * @param mixed $server
       * @param mixed $user
       * @param mixed $pass
       * @param mixed $database
       * @return
       */
      function __construct($server, $user, $pass, $database)
      {
          $this->server = $server;
          $this->user = $user;
          $this->pass = $pass;
          $this->database = $database;
		  
      }
      
      /**
       * Database::connect()
       * Connect and select database using vars above
       * @return
       */
      function connect()
      {
          $this->link_id = $this->connect_db($this->server, $this->user, $this->pass);
          
          if (!$this->link_id)
              $this->error("<div style='text-align:center'>" 
						   . "<span style='padding: 5px; border: 1px solid #999; background-color:#EFEFEF;" 
						   . "font-family: Verdana; font-size: 11px; margin-left:auto; margin-right:auto'>" 
						   . "<b>Database Error:</b>Connection to Database " . $this->database . " Failed</span></div>");
          
          if (!$this->select_db($this->database, $this->link_id))
              $this->error("<div style='text-align:center'>" 
						   . "<span style='padding: 5px; border: 1px solid #999; background-color: #EFEFEF;" 
						   . "font-family: Verdana; font-size: 11px; margin-left:auto; margin-right:auto'>" 
						   . "<b>Database Error:</b>mySQL database (" . $this->database . ")cannot be used</span></div>");
          
          $this->query("SET NAMES 'utf8'", $this->link_id);
          $this->query("SET CHARACTER SET 'utf8'", $this->link_id);
          
          unset($this->password);
      }

      /**
       * Database::connect_db()
       * 
       * @param mixed $server
       * @param mixed $user
       * @param mixed $pass
       * @return
       */
      function connect_db($server, $user, $pass)
      {
          return mysql_connect($server, $user, $pass);
      }
	  
      /**
       * Database::select_db()
       * 
       * @param mixed $database
       * @param mixed $link_id
       * @return
       */
      function select_db($database, $link_id)
      {
          return mysql_select_db($database, $link_id);
      }
	  
      /**
       * Database::query()
       * Executes SQL query to an open connection
       * @param mixed $sql
       * @return (query_id)
       */
      function query($sql)
      {
          if (trim($sql != "")) {
              $this->query_counter++;
              $this->query_show .= stripslashes($sql) . "<hr size='1' />";
              $this->query_id = mysql_query($sql, $this->link_id);
			  
              $this->last_query = $sql . '<br />';
          }
          
          if (!$this->query_id)
              $this->error("mySQL Error on Query : " . $sql);
          
          return $this->query_id;
		  
      }
      
      /**
       * Database::first()
       * Fetches the first row only, frees resultset
       * @param mixed $string
       * @return array
       */
      function first($string)
      {
          $query_id = $this->query($string);
          $record = $this->fetch($query_id);
          $this->free($query_id);
          return $record;
      }
      
      /**
       * Database::fetch()
       * Fetches and returns results one line at a time
       * @param integer $query_id
       * @return array
       */
      function fetch($query_id = -1)
      {
          if ($query_id != -1)
              $this->query_id = $query_id;
          
          if (isset($this->query_id)) {
              $record = mysql_fetch_array($this->query_id, MYSQL_ASSOC);
          } else
              $this->error("Invalid query_id: <b>".$this->query_id."</b>. Records could not be fetched.");
          
          return $record;
      }
      
      /**
       * Database::fetch_all()
       * Returns all the results
       * @param mixed $sql
       * @return assoc array
       */
      function fetch_all($sql)
      {
          $query_id = $this->query($sql);
          $record = array();

          while ($row = $this->fetch($query_id, $sql)) :
              $record[] = $row;
          endwhile;

          $this->free($query_id);
          return $record;
      }
      
      /**
       * Database::free()
       * Frees the resultset
       * @param integer $query_id
       * @return query_id
       */
      function free($query_id = -1)
      {
          if ($query_id != -1)
              $this->query_id = $query_id;
          
          return mysql_free_result($this->query_id);
      }
	  
      /**
       * Database::insert()
       * Insert query with an array
       * @param mixed $table
       * @param mixed $data
       * @return id of inserted record, false if error
       */
      function insert($table = null, $data)
      {
		  global $set;
		  if ($table === null or empty($data) or !is_array($data)) {
		  $this->error("Invalid array for table: <b>".$table."</b>.");
		  return false;
		  }
		  $q = "INSERT INTO `" . $table . "` ";
          $v = '';
          $k = '';
          
          foreach ($data as $key => $val) :
              $k .= "`$key`, ";
              if (strtolower($val) == 'null')
                  $v .= "NULL, ";
              elseif (strtolower($val) == 'now()')
                  $v .= "NOW(), ";
              elseif (strtolower($val) == 'tzdate')
                  $v .= "DATE_ADD(NOW(),INTERVAL ".$set['timezone']." HOUR), ";
              else
                  $v .= "'" . $this->escape($val,true) . "', ";
          endforeach;
          
          $q .= "(" . rtrim($k, ', ') . ") VALUES (" . rtrim($v, ', ') . ");";
          
          if ($this->query($q)) {
              return $this->insertid();
          } else
              return false;
      }
	  
      /**
       * Database::update()
       * Update query with an array
       * @param mixed $table
       * @param mixed $data
       * @param string $where
       * @return query_id
       */
      function update($table = null, $data, $where = '1')
      {
		  global $set;
		  if ($table === null or empty($data) or !is_array($data)) {
		  $this->error("Invalid array for table: <b>".$table."</b>.");
		  return false;
		  }
		  
		  $q = "UPDATE `" . $table . "` SET ";
          foreach ($data as $key => $val) :
              if (strtolower($val) == 'null')
                  $q .= "`$key` = NULL, ";
              elseif (strtolower($val) == 'now()')
                  $q .= "`$key` = NOW(), ";
              elseif (strtolower($val) == 'tzdate')
                  $q .= "`$key` = DATE_ADD(NOW(),INTERVAL ".$set['timezone']." HOUR), ";
              elseif (strtolower($val) == 'default()')
                  $q .= "`$key` = DEFAULT($val), ";
              else
                  $q .= "`$key`='" . $this->escape($val,true) . "', ";
          endforeach;
          $q = rtrim($q, ', ') . ' WHERE ' . $where . ';';
          
          return $this->query($q);
      }
      
      /**
       * Database::delete()
       * Delete records
       * @param mixed $table
       * @param string $where
       * @return 
       */
      function delete($table, $where = '')
      {
		  $q = !$where ? 'DELETE FROM ' . $table : 'DELETE FROM ' . $table . ' WHERE ' . $where;
          return $this->query($q);
      }
      
	  /**
       * Database::insert_id()
       * Returns last inserted ID
       * @param integer $query_id
       * @return
       */
      function insertid()
      {
          return mysql_insert_id($this->link_id);
      }

	  /**
       * Database::affected()
       * Returns the number of affected rows
       * @param integer $query_id
       * @return
	  */
	  function affected() {
		  return mysql_affected_rows($this->link_id);
	  }
     
	 /**
       * Database::numrows()
       * 
       * @param integer $query_id
       * @return
       */
      function numrows($query_id = -1)
      {
          if ($query_id != -1)
              $this->query_id = $query_id;
          
		  $this->num_rows = mysql_num_rows($this->query_id);
          return $this->num_rows;
      }
      
      /**
       * Database::fetchrow()
       * Fetches one row of data
       * @param integer $query_id
       * @return fetched row
       */
      function fetchrow($query_id = -1)
      {
          if ($query_id != -1)
              $this->query_id = $query_id;
          
          $this->fetch_row = mysql_fetch_row($this->query_id);
          return $this->fetch_row;
      }
      
      /**
       * Database::show()
       * 
       * @return
       */
      function show()
      {
          return "<br /><br /><b> Debug Mode - All Queries :</b><hr size='1' /> " . $this->query_show . "<br />";
      }

      /**
       * Database::pre()
       * 
       * @return
       */
      function pre($arr)
      {
		  print '<pre>'.print_r($arr,true).'</pre>';
      }
	  
      /**
       * Database::close()
       * Close the connection
       * @return
       */
      function close()
      {
          if (!mysql_close($this->link_id))
              $this->error("Connection close failed.");
      }
	  
      /**
       * Database::escape()
       * escape (true) $_GET,$_POST
	   * escape (false) in,out of DB
       * @param mixed $string
	   * @param bool $do
       * @return
       */
      function escape($string, $do = false)
      {
          if (is_array($string)) {
			  foreach ($string as $key => $value) :
				  $string[$key] = $this->escape_($value, $do);
			  endforeach;
		  } else 
			  $string = $this->escape_($string, $do);
		  
		  return $string;
      }
	  
      /**
       * Database::escape_()
	   * 
       * @param mixed $string
	   * @param bool $do
       * @return Database::quote()
       */
	  function escape_($string, $do = false)
	  {
		  if (isset($string)) {
			  if (get_magic_quotes_gpc())
				  $string = stripslashes($string);
			 
			 if ($do) 
				  $string = mysql_real_escape_string($string,$this->link_id);
				  
		  }
		  return $string;
	  }
		
      /**
       * Database::error()
       * Output error message
       * @param mixed $msg
       * @return
       */
      function error($msg = '')
      {
          global $WOJODebug, $_SERVER;
          if ($this->link_id > 0) {
              $this->error_desc = mysql_error($this->link_id);
              $this->error_no = mysql_errno($this->link_id);
          } else {
              $this->error_desc = mysql_error();
              $this->error_no = mysql_errno();
          }
          
          $the_error = "<div style=\"background-color:#FFF; border: 3px solid #999; padding:10px\">";
          $the_error .= "<b>mySQL WARNING!</b><br />";
          $the_error .= "DB Error: $msg <br /> More Information: <br />";
          $the_error .= "<ul>";
          $the_error .= "<li> Mysql Error : " . $this->error_no . "</li>";
          $the_error .= "<li> Mysql Error no # : " . $this->error_desc . "</li>";
          $the_error .= "<li> Date : " . date("F j, Y, g:i a") . "</li>";
          $the_error .= "<li> Referer: " . isset($_SERVER['HTTP_REFERER']) . "</li>";
          $the_error .= "<li> Script: " . $_SERVER['REQUEST_URI'] . "</li>";
          $the_error .= '</ul>';
          $the_error .= '</div>';
          if ($WOJODebug)
              echo $the_error;
          die();
      }
  }
?>