<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $setup->set['site_name'];?></title>
<script language="javascript" type="text/javascript">
var IMGURL = "<?php echo ADMINURL; ?>/images";
</script>
<link href="assets/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../assets/jquery.js"></script>
<script type="text/javascript" src="../assets/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="../assets/tooltip.js"></script>
<script type="text/javascript" src="assets/global.js"></script>
</head>
<body>
<!-- Start Header-->
<div id="header">
<div class="wrap">
  <div class="logo"><?php echo $setup->set['site_name'];?></div>
  <ul id="nav">
  <li class="nobg"><a href="index.php" title="Home" class="home">Home</a></li>
    <li><a href="#" title="System Setup">System Setup</a>
      <ul>
        <li><a href="index.php?do=system&amp;sub=config" title="System Configuration">System Configuration</a></li>
        <!--<li><a href="index.php?do=system&amp;sub=email" title="Email Templates">Email Templates</a></li>
        <li><a href="index.php?do=system&amp;sub=newsletter" title="Newsletter">Newsletter</a></li>-->
      </ul>
    </li>
    <li><a href="index.php?do=users&amp;sub=users" title="User Setup">User Setup</a></li>
    <li><a href="#" title="Membership Setup">Membership Setup</a>
      <ul>
        <li><a href="index.php?do=membership&amp;sub=memsetup" title="View Memberships">View Memberships</a></li>
        <li><a href="index.php?do=membership&amp;sub=payments" title="View Payments">View Payments</a></li>
      </ul>
    </li>
    <li><a href="logout.php" title="Logout" class="logout">Logout</a></li>
  </ul>
  </div>
</div>
<!-- End Header-->