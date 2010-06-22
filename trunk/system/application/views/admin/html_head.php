<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<head>
<!-- head -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="shortcut icon" href="<?php echo get_path('favicon.ico','img');?>" />
	<!-- Title of page -->
	<title><?php echo isset($page_title)?$page_title:'Confor.ca';?></title>	
	<script>
		XEMMEX = {
			baseUrl: '<?php echo site_url("/")?>'		
		};	
	</script>
	<?php
		echo style('style.css');		
		echo style('../fancybox/jquery.fancybox-1.3.1.css');
		echo style('../jQueryUI/jquery-ui-1.8.custom.css');
		echo style('xemmex.admin.css');
		
		echo script('Cufon_yui.js');
		echo script('jquery.min.js');
		echo script('../fancybox/jquery.fancybox-1.3.1.pack.js');
		echo script('../jQueryUI/jquery-ui-1.8.custom.min.js');
		echo script('scripts.js');
		echo script('xemmex.admin.js');
		
	?>
	<!--[if IE 6]>
	<script src="js/DD_belatedPNG.js"></script>
	<script> DD_belatedPNG.fix('*'); </script>
	<style type="text/css"> #menu ul li a span { display: none; } </style>
	<![endif]-->        	
</head>

<body>

	<div id="wrapper">