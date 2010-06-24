<?php
  /**
   * Class Paginate.php
   *
   * @package Membership Subscription Manager
   * @author wojocms.com
   * @copyright 2010
   * @version $Id: class_paginate.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
  
  class Paginator
  {
      var $items_per_page;
      var $items_total;
      var $current_page;
      var $num_pages;
      var $mid_range;
      var $low;
      var $high;
      var $limit;
      var $return;
      var $default_ipp;
      var $querystring;
      
      
      /**
       * Paginator::__construct()
       * 
       * @return
       */
      function __construct()
      {
          $this->current_page = 1;
          $this->mid_range = 7;
          $this->items_per_page = (!empty($_GET['ipp'])) ? $_GET['ipp'] : $this->default_ipp;
      }
      
      /**
       * Paginator::paginate()
       * 
       * @param bool $path
       * @return
       */
      function paginate($path = false)
      {

       if (!is_numeric($this->items_per_page) || $this->items_per_page <= 0)
        $this->items_per_page = $this->default_ipp;
       $this->num_pages = ceil($this->items_total / $this->items_per_page);
          
          $this->current_page = intval(get('pg'));
          if ($this->current_page < 1 or !is_numeric($this->current_page))
              $this->current_page = 1;
          if ($this->current_page > $this->num_pages)
              $this->current_page = $this->num_pages;
          $prev_page = $this->current_page - 1;
          $next_page = $this->current_page + 1;
          
          if ($_GET) {
              $args = explode("&", $_SERVER['QUERY_STRING']);
              foreach ($args as $arg) {
                  $keyval = explode("=", $arg);
                  if ($keyval[0] != "pg" && $keyval[0] != "ipp")
                      $this->querystring .= "&amp;" . $arg;
              }
          }
          
          if ($_POST) {
              foreach ($_POST as $key => $val) {
                  if ($key != "pg" && $key != "ipp")
                      $this->querystring .= "&amp;$key=$val";
              }
          }
          
          if ($this->num_pages > 1) {
              if ($this->current_page != 1 && $this->items_total >= 10) {
                  if ($path) {
                      $this->return = "<a href=\"" . SITEURL . "/$path/$prev_page-$this->items_per_page.html\">&laquo; Prev</a>";
                  } else {
                      $this->return = "<a href=\"$_SERVER[PHP_SELF]?pg=$prev_page&amp;ipp=$this->items_per_page$this->querystring\">&laquo; Prev</a>";
                  }
              } else {
                  $this->return = "<a class=\"inactive\" href=\"#\">&laquo; Prev</a>";
              }
              
              $this->start_range = $this->current_page - floor($this->mid_range / 2);
              $this->end_range = $this->current_page + floor($this->mid_range / 2);
              
              if ($this->start_range <= 0) {
                  $this->end_range += abs($this->start_range) + 1;
                  $this->start_range = 1;
              }
              if ($this->end_range > $this->num_pages) {
                  $this->start_range -= $this->end_range - $this->num_pages;
                  $this->end_range = $this->num_pages;
              }
              $this->range = range($this->start_range, $this->end_range);
              
              for ($i = 1; $i <= $this->num_pages; $i++) {
                  if ($this->range[0] > 2 && $i == $this->range[0])
                      $this->return .= " ... ";
					  
                  if ($i == 1 or $i == $this->num_pages or in_array($i, $this->range)) {
                      if ($i == $this->current_page) {
                          $this->return .= "<a href=\"#\" title=\"Go to page $i of $this->num_pages\" class=\"number current\">$i</a>";
                      } else {
                          if ($path) {
                              $this->return .= "<a class=\"number\" title=\"Go to page $i of $this->num_pages\" href=\"" . SITEURL . "/$path/$i-$this->items_per_page.html\">$i</a>";
                          } else {
                              $this->return .= "<a class=\"number\" title=\"Go to page $i of $this->num_pages\" href=\"$_SERVER[PHP_SELF]?pg=$i&amp;ipp=$this->items_per_page$this->querystring\">$i</a>";
                          }
                      }
                  }
                  if ($this->range[$this->mid_range - 1] < $this->num_pages - 1 && $i == $this->range[$this->mid_range - 1])
                      $this->return .= " ... ";
              }
              if ($this->current_page != $this->num_pages && $this->items_total >= 10) {
                  if ($path) {
                      $this->return .= "<a href=\"" . SITEURL . "/$path/$next_page-$this->items_per_page.html\">Next &raquo;</a>\n";
                  } else {
                      $this->return .= "<a href=\"$_SERVER[PHP_SELF]?pg=$next_page&amp;ipp=$this->items_per_page$this->querystring\">Next &raquo;</a>\n";
                  }
              } else {
                  $this->return .= "<a href=\"#\" class=\"inactive\">Next &raquo;</a>\n";
              }
          } else {
              for ($i = 1; $i <= $this->num_pages; $i++) {
                  if ($i == $this->current_page) {
                      $this->return .= "<a href=\"#\" class=\"current\">$i</a>";
                  } else {
                      $this->return .= "<a class=\"number\" href=\"$_SERVER[PHP_SELF]?pg=$i&amp;ipp=$this->items_per_page$this->querystring\">$i</a>";
                  }
              }
          }
          $this->low = ($this->current_page - 1) * $this->items_per_page;
          $this->high = $this->current_page * $this->items_per_page - 1;
          $this->limit = " LIMIT $this->low,$this->items_per_page";
      }
      
      /**
       * Paginator::display_pages()
       * 
       * @return
       */
      function display_pages()
      {
          return ($this->items_total > $this->default_ipp) ? $this->return : "";
      }
  }
?>