<?php	
	$preview_img=base_url().'thumbs/'.$row->shash;
	//$upload_date=mdate("%d-%m-%Y", $row->date);	
	$link_play = site_url('payvideo/play/'.$row->code);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="icon" type="image/gif" href="http://confor.tv/animated_favicon1.gif" > 
<title><?php echo $row->code;?></title>
<style type="text/css">
body {
	background-color: #E8F3FF;
	font-family:Arial, Helvetica, sans-serif;
}
.box {
	background-color: #CCC;
	border:20px #fff solid;
	margin:auto;
	width:650px;
	color:#444;
	height: 600px;
}
.box h2 {
	margin:0px;
	margin-bottom:20px;
}
.click_text {
	font-style:italic;
	color:#000;
}
.click_text a {
	color:#069;
	font-weight:bold;
}
.header {
	background:#008EB0;
	color:#069;
	padding:20px;
	height:100px;
}
.header img {
	margin-right:10px;
	float:left;
	border:#FFF 2px solid;
}
.desc {
	margin-top:20px;
	padding:0px;
	text-align:justify;
	color:#444;
}
.desc h2{
	color:#069;
	margin-bottom:10px;
	text-transform: lowercase;
}
.logo {
	background:url(<?php echo base_url();?>assets/img/en/logo.png) no-repeat;
	height:100px;
	margin:20px auto 0px auto;
	width:600px;
}
</style>
</head>
<body>
<div class="logo"></div>
<div class="box">
  <div class="header"> <img src="<?php echo $preview_img?>"  width="607" />
    <div>
      <h2><?php echo $row->title;?></h2>	  
      <span class="click_text"><?php echo __("CF_click")?><a href="<?php echo $link_play?>"> <?php echo __("CF_here")?> </a> <?php echo __("CF_to_play")?></span> 
	 </div>
  
  <div class="desc">
    <h2><?php echo __("CF_des")?></h2>
	<?php echo $row->description;?>
</div>
</div>

</body>
</html>