<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?php echo $setup->set['site_name'];?></title>
<meta name="keywords" content="<?php echo $setup->set['keywords'];?>" />
<meta name="description" content="<?php echo $setup->set['desc'];?>" />
<script language="javascript" type="text/javascript">
var IMGURL = "<?php echo ADMINURL; ?>/images";
</script>
<link href="assets/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="assets/jquery.js"></script>
<script type="text/javascript" src="assets/jquery-ui-1.7.2.custom.min.js"></script>
<script type="text/javascript" src="assets/tooltip.js"></script>
<script type="text/javascript" src="assets/global.js"></script>

</head>
<body>
<!-- Start Header-->
<div id="header">
<div class="wrap">
  <div class="logo"><?php echo $setup->set['site_name'];?> - [<?php echo $setup->set['site_slogan'];?>]</div>
  <strong>Welcome <?php echo $session->username;?></strong> 
  <?php if($session->logged_in):?> <strong>~ <a href="index.php?do=profile">Edit Profile</a></strong><?php endif;?></div>
</div>
<!-- End Header-->