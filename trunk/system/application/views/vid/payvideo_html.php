<?php	
	$preview_img=base_url().'thumbs/'.$row->shash;
	$upload_date=mdate("%d-%m-%Y", $row->date);	
	$link_play = site_url('payvideo/play/'.$row->code);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Confor.ca - Pay video - <?php echo $row->title;?></title>
</head>
<head>
<style type="text/css">
body {
	background-color: #E8F3FF;
}
.box {
	background-color: #CEE7FF;
	border:20px #fff solid;
	margin:auto;
	width:650px;
	color:#444;
}
.box h2 {
	margin:0px;
}
.click_text {
	font-style:italic;
	color:#fafafa;
}
.click_text a {
	color:#fafafa;
}
.header {
	background:#008EB0;
	color:#FFF;
	padding:20px;
	height:100px;
}
.header img {
	margin-right:10px;
	float:left;
	border:#FFF 2px solid;
}
.desc {
	padding:20px;
	text-align:justify;
}
.desc h2{color:#008EB0;margin-bottom:10px;}
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
  <div class="header"> <img src="<?php echo $preview_img?>" />
    <div>
      <h2><?php echo $row->title;?></h2>
      <span class="click_text">Click<a href="<?php echo $link_play?>" target="_blank"> here </a> to play this video</span> </div>
  </div>
  <div class="desc">
    <h2>Description</h2>
	<?php echo $row->description;?>
</div>
</div>

</body>
</html>