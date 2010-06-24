<?php
  /**
   * Main.php
   *
   * @package Membership Subscription Manager
   * @Licenced to XemmeX.com
   * @copyright 2010
   * @version $Id: main.php,v 1.10 2010-02-01 14:20:26 gewa Exp $
   */
  if (!defined("_VALID_PHP"))
      die('Direct access to this location is not allowed.');
?>
<?php
  $sql = $db->query("SELECT PERIOD_DIFF(DATE_FORMAT(NOW(),'%y%m')," 
		. " \n DATE_FORMAT(MIN(date),'%y%m')) AS months_passed FROM payments");
  
  if ($db->numrows($sql) == 1)
      : $row = $db->fetch($sql);
  $months_passed = $row['months_passed'] + 1;
  else
      : $months_passed = 0;
  endif;
  $month = 0;
  $temp_month = date('m') + 1;
  $temp_year = date('Y');
  
  $sales_array = array();
  $max_transactions = 0;
  $max_income = 0;
  
  $graph_months = $months_passed;
  if ($graph_months > 12)
      $graph_months = 12;
  
  while ($month < $graph_months)
      : $sql = $db->query("SELECT DATE_FORMAT(date,'%m') AS month," 
			  . " \n YEAR(date) AS year," 
			  . " \n SUM(rate_amount) AS month_income," 
			  . " \n COUNT(id) AS total_transactions" 
			  . " \n FROM payments" 
			  . " \n WHERE PERIOD_DIFF(DATE_FORMAT(NOW(),'%y%m')," 
			  . " \n DATE_FORMAT(date,'%y%m')) = " . $month . " GROUP BY month");
	  
  if ($db->numrows($sql) == 1)
      : $row = $db->fetch($sql);
  
  $total_transactions = $row['total_transactions'];
  $date = $row['month'] . '-' . $row['year'];
  $temp_month = intval($row['month']);
  $temp_year = intval($row['year']);
  $month_income = $row['month_income'];
  else
      : if ($temp_month == 1)
      : $temp_month = 12;
  $temp_year = $temp_year - 1;
  else
      : $temp_month--;
  endif;
  $month_income = 0;
  $total_transactions = 0;
  $date = date('m-Y', mktime(0, 0, 0, $temp_month, 1, $temp_year));
  endif;
  $month_label = date('M', mktime(0, 0, 0, $temp_month, 1, $temp_year));
  array_push($sales_array, array(
						   'year' => $temp_year, 
						   'month' => $month_label, 
						   'count' => $total_transactions, 
						   'income' => $month_income, 
						   'month_numeric' => $temp_month)
			 );
  
  if ($total_transactions >= $max_transactions)
      $max_transactions = $total_transactions;
  
  if ($month_income >= $max_income)
      $max_income = $month_income;
  
  $month++;
  endwhile;
  
  $graph = '';
  $graph_labels = '';
  
  $sales_array = array_reverse($sales_array, 1);
  
  $sales_table = '<table cellspacing="0" cellpadding="0" class="box">';
  
  foreach ($sales_array as $sale)
      : $height = ($sale['income'] / $max_income) * 219;
  if ($height == 0)
      $height = 1;
  
  switch ($sale['month'])
      : case "Jan":
      $left = 2;
  break;
  case "Feb":
      $left = 35;
      break;
  case "Mar":
      $left = 68;
      break;
  case "Apr":
      $left = 101;
      break;
  case "May":
      $left = 134;
      break;
  case "Jun":
      $left = 167;
      break;
  case "Jul":
      $left = 200;
      break;
  case "Aug":
      $left = 233;
      break;
  case "Sep":
      $left = 266;
      break;
  case "Oct":
      $left = 299;
      break;
  case "Nov":
      $left = 332;
      break;
  case "Dec":
      $left = 365;
      break;
      endswitch;

      $height2 = ($sale['count'] / $max_transactions) * 219;
      
      if ($height2 == 0)
          $height2 = 1;
      
      switch ($sale['month'])
          : case "Jan":
          $left2 = 18;
      break;
  case "Feb":
      $left2 = 51;
      break;
  case "Mar":
      $left2 = 84;
      break;
  case "Apr":
      $left2 = 117;
      break;
  case "May":
      $left2 = 150;
      break;
  case "Jun":
      $left2 = 183;
      break;
  case "Jul":
      $left2 = 216;
      break;
  case "Aug":
      $left2 = 249;
      break;
  case "Sep":
      $left2 = 282;
      break;
  case "Oct":
      $left2 = 315;
      break;
  case "Nov":
      $left2 = 348;
      break;
  case "Dec":
      $left2 = 381;
      break;
      endswitch;
      
      
      $graph .= '<div class="red-bar tooltip" title="' . $sale['month'] . '-' . $sale['year'] . ':
          ' . $sale['count'] . ' sale(s)" style="height: ' . $height2 . 'px; left: ' . $left2 . 'px;">
        </div>';
      $graph .= '<div class="green-bar tooltip" title="' . $sale['month'] . '-' . $sale['year'] . ': 
          ' . $setup->set['cur_symbol'] . number_format($sale['income'], 2) . $setup->set['currency'] . '" 
		  	   style="height: ' . $height . 'px;  left: ' . $left . 'px;">
        </div>';
      
      $graph_labels .= '<div class="graph-label" style=" left: ' . $left . 'px;">' . $sale['month'] . '<br />\'
              ' . substr($sale['year'], 2, 2) . '
            </div>';
      $left = $left + 33;
      endforeach;
      
      $sales_table .= '</table>';
?>

<h1><span>Site</span> Overview</h1>
<p class="info">Here are your sales statistics and some basic System information.</p>
<div class="inner">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td valign="top"><table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td>Sales - Last 12 Months</td>
            </tr>
          </thead>
          <tr>
            <td><div style="width: 510px; height: 250px; position:relative;">
                <div class="bar-numbers" style="position: absolute; top: -5px; height: 20px; width: 50px; text-align: right;"><?php echo $setup->set['cur_symbol'].' '.number_format(round($max_income,0),0).'.00';?></div>
                <div class="bar-numbers" style="position: absolute; bottom: 22px; height: 20px; width: 50px; text-align: right;"><?php echo $setup->set['cur_symbol'].' ';?>0.00</div>
                <div class="graph-bg"><?php echo $graph;?></div>
                <div class="bar-numbers" style="position: absolute; right: 0; top: -5px; height: 20px; width: 50px; text-align: left;"><?php echo $max_transactions;?></div>
                <div class="bar-numbers" style="position: absolute; right: 0; bottom: 22px; height: 20px; width: 50px; text-align: left;">0</div>
                <div style="position: absolute; left: 53px; bottom: 5px; height: 20px; width: 400px; text-align: left;"><?php echo $graph_labels;?> </div>
              </div>
              <div class="utility"></div>
              <table cellspacing="0" cellpadding="0" class="box">
                <tr>
                  <td width="35"><div class="redbar"></div></td>
                  <td>Gross Income</td>
                </tr>
                <tr>
                  <td><div class="greenbar"></div></td>
                  <td>No. of Sales</td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      <td width="15">&nbsp;</td>
      <td valign="top"><table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td colspan="2">Server Information</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="100">Software Version:</td>
              <td><?php echo $setup->set['version'];?></td>
            </tr>
            <tr>
              <td>Server Version:</td>
              <td><?php echo $_SERVER['SERVER_SOFTWARE'];?></td>
            </tr>
            <tr>
              <td>PHP Version:</td>
              <td><?php echo phpversion();?></td>
            </tr>
            <tr>
              <td>MySQL Version:</td>
              <td><?php echo mysql_get_server_info();?></td>
            </tr>
            <tr>
              <td>Server Time:</td>
              <td><?php echo date('h:i:sA m/d/Y');?></td>
            </tr>
          </tbody>
        </table>
        <table cellspacing="0" cellpadding="0" class="box">
          <thead>
            <tr>
              <td colspan="2">Quick Statistics</td>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td width="120">Total Income:</td>
              <td><?php echo $setup->set['cur_symbol'].$setup->totalIncome().$setup->set['currency'];?></td>
            </tr>
            <tr>
              <td>Total Sales:</td>
              <td><?php echo countEntries("payments");?></td>
            </tr>
            <tr>
              <td>Total Users:</td>
              <td><?php echo countEntries("users");?></td>
            </tr>
          </tbody>
        </table></td>
    </tr>
  </table>
</div>