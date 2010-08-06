<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<html>
<!-- head -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<link rel="shortcut icon" href="<?php echo get_path('favicon.ico','img');?>" />
	<!-- Title of page -->
	<title><?php echo isset($page_title)?$page_title:'Confor.ca';?></title>	
	<script>
		XEMMEX = {
			baseUrl: '<?php echo site_url("/")?>',
			monthNames : [<?php echo __("CF_month_name_array")?>]
		};	
	</script>
	<?php
        echo style('style.css');            
        //echo style('playlist.css');        	
		//echo style('../fancybox/jquery.fancybox-1.3.1.css');
		//echo style('../jQueryUI/jquery-ui-1.8.custom.css');
		//echo style('xemmex.frontend.css');
        //echo style('scrollable-buttons.css');
        //echo style('scrollable-horizontal.css');
	?>
	<?php
		echo script('Cufon_yui.js');
		echo script('jquery.tools.min.js'); 
		//echo script('jquery.min.js');
		//echo script('../fancybox/jquery.fancybox-1.3.1.pack.js');
		//echo script('../jQueryUI/jquery-ui-1.8.custom.min.js');
		//echo script('scripts.js');
		//echo script('xemmex.frontend.js');
        echo script('flowplayer-3.2.2.min.js');    
        //echo script('flowplayer.playlist-3.0.8.min.js');          
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

	<div id="wrapper">
	

<div id="header">
<div id="logo">                   
	<a href="<?php echo base_url();?>">	
	<?php echo img('logo.png',array('alt' => 'Confor.tv'));?>
	</a>	
</div>
<!-- /#logo -->

<div id="menu">			
				<div id="right_bg"></div>			
				<ul>
					<li><a href="<?php echo site_url("") ?>"><?php echo __("CF_home")?></a></li>			
					<li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>					
				</ul>						
</div>			

<!-- /#menu -->

<div id="header_info">

	<div class="left">
		<?php echo __("CF_you_are_here");?>
		<b><a href="<?php echo $path[0]['link']?>"><?php echo $path[0]['name']?></a></b>
		<?php for ($i=1; $i<count($path); $i++):?>
			/ <a href="<?php echo $path[$i]['link']?>"><?php echo $path[$i]['name']?></a>
		<?php endfor;?>			
	</div>

</div>
</div>
<!-- /#header_info -->	
	<div id="top_box">		
		<br />
		<!-- /#top_box -->
		
		<div id="content">
			<br />
			<div id="left">		
<p>&nbsp;</p>			
<h3><?php echo $row->title?></h3>
<p>
<a href="<?php echo base_url()?>payvids/<?php echo $row->vhash?>" style="display:block;width:621px;height:380px;"id="player"></a>
</p>
<?php if (isset($product)):?>
<p>&nbsp;</p>
<h3><?php echo __("CF_pay_vid_detail");?></h3>
<p>
<p><strong><?php echo __("CF_pay_vid_expire");?>: </strong><?php echo date("d-m-Y",strtotime($order->download_deadline))?></p>
<p><strong><?php echo __("CF_pay_vid_max_view");?> :</strong><?php echo $product->nb_downloadable?></p>
<p><strong><?php echo __("CF_pay_vid_viewed");?> :</strong><?php echo $order->download_nb+1?></p>
</p>
<?php endif;?>
<script language="JavaScript">
    flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer.commercial-3.2.2.swf",
    {// product key
        key: '#@7fce71ac6b428079f85' ,
        // logo initially has zero opacity
        logo: {   
            url: '<?php echo base_url()?>/flowplayer/logo.png',   
            fullscreenOnly: false,   
            top: 10, 
            left: 10,
            displayTime: 2000   
        },
        clip:{autoPlay: true,autoBuffering: true}
    }        
    );
</script>

</div>
			<div id="right">
				<p>&nbsp;</p>
				<h3><?php echo __("CF_des");?></h3>								
				<div class="sidebar_item">
				
				<?php echo $row->description?>
				
			  </div>
				<!-- /.sidebar_item #search -->                                            
			</div>
			<!-- /#content #right - right side of main content or sidebar -->

		</div>
		<!-- /#content -->
		
	</div>
	<!-- /#top-box -->
</div>
<!-- /#wrapper -->	
    <!-- /#footer -->
    
    <div id="copyright">
    
        <div id="copyright_wrapper">
        
            <ul class="left">
            
                <li><a href="<?php echo base_url()?>"><?php echo __("CF_home")?></a></li>
            
                <li><a href="<?php echo site_url("accessories/show_element/about") ?>"><?php echo __("CF_about")?></a></li>
            
                <li><a href="<?php echo site_url("blog") ?>"><?php echo __("CF_blog")?></a></li>
            
                <li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>
                
                <li><a href="<?php echo site_url("contact")?>"><?php echo __("CF_contact")?></a></li>
                       
            </ul>
            <!-- /.left content-->
            
            <span class="right">&copy; 2010 Confor.ca | <?php echo __("CF_copy_right")?> <a href="http://xemmex.com/">XemmeX</a></span>
            <!-- /.right content-->
        
        </div>
        <!-- /#copyright _wrapper-->
    
    </div>
    <!-- /#copyright -->
<!-- /language done -->             
</body>
</html>