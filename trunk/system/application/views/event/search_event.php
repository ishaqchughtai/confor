<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- head -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- Title of page -->
<title>Confor.ca<?php echo $date_now?></title>
<!-- Main CSS Stylesheet -->
<link href="<?php echo base_url();?>style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<?php echo base_url();?>fancybox/jquery.fancybox-1.3.1.css" type="text/css" media="screen" />
<link type="text/css" href="<?php echo base_url();?>js/jQueryUI/jquery-ui-1.8.custom.css" rel="stylesheet" />
<!-- .JS Files -->
<script type="text/javascript" src="<?php echo base_url();?>js/jquery.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>js/jquery-ui-1.8.custom.min.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>js/Cufon_yui.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>js/LiberationSans_Cufon.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>fancybox/jquery.fancybox-1.3.1.pack.js"></script>
<script type="text/javascript" src="<?php echo base_url();?>js/scripts.js"></script>
<!--[if IE 6]>
	<script src="js/DD_belatedPNG.js"></script>
	<script> DD_belatedPNG.fix('*'); </script>
	<link href="style_IE6.css" rel="stylesheet" type="text/css" />
	<![endif]-->
<script type="text/javascript">
		$(function(){

			// Datepicker
			$('#datepicker').datepicker({
				inline: true
			});
			
		});
	</script>
</head>
<body>
<div id="wrapper">
  <div id="header" class="blog">
    <div id="logo"> <a href="<?php echo site_url("home/index")?>"><img src="<?php echo base_url();?>images/logo.png" alt="Confor.ca"></a> </div>
    <!-- /#logo -->
    <?php $this->load->view("menu");?>
    <!-- /#menu -->
    <div id="header_info" class="blog_info">
      <div class="left"> You are here: <a href="<?php echo base_url()?>" style="font-weight: bold;">Home</a> / <a href="#">Search event result</a> </div>
      <div class="right"> <a href="#" class="rss">Subscribe to RSS</a> </div>
    </div>
    <!-- /#header_info -->
  </div>
  <!-- /#header -->
  <?php
                function _substr($str, $length, $minword = 3)
                {
                    $sub = '';
                    $len = 0;
                   
                    foreach (explode(' ', $str) as $word)
                    {
                        $part = (($sub != '') ? ' ' : '') . $word;
                        $sub .= $part;
                        $len += strlen($part);
                       
                        if (strlen($word) > $minword && strlen($sub) >= $length)
                        {
                            break;
                        }
                    }
                   
                    return $sub . (($len < strlen($str)) ? ' [...]' : '');
                }
?>
  <div id="content">
    <div id="left">
      <?php if(isset($error)):?>
      <p class="not_warning "><span class="img"></span><?php echo $error;?><span class="close"></span></p>
      <?php else:?>
      <div class="content_item">
        <?php foreach($query as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['Name'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = $row['Keywords'];
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><a href="<?php echo site_url('event/event_content/'.$id)?>"><?php echo $title?></a></h3>
          <h5>By <?php echo $speaker?> in : <a href="#"><?php echo $keyword?></a> // <?php echo $date;?></h5>
          <p> <?php echo _substr($description,200)?></p>
          <a href="<?php echo site_url('event/event_content/'.$id)?>" class="read_more">Continue Reading</a> </div>
        <?php
				}
				?>
        
      </div>
	  <?php endif?>
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /#pagination -->
    </div>
    <!-- /#content #left - left side of main content -->
    <div id="right">
      <h3>Search</h3>
      <h5>Search through all events</h5>
      <div class="sidebar_item" id="search">
        <form action="" method="post">
          <input name="search_field" type="text" class="search_field">
          <input name="search_field2" type="submit" class="search_submit" value="" />
        </form>
        <!-- #search form -->
      </div>
      <!-- /.sidebar_item #search -->
      <div class="sidebar_item">
        <div id="datepicker"></div>
      </div>
      <div class="sidebar_item">
        <ul id="tabs">
          <li>Categories</li>
          <li>Archives</li>
          <li>Speakers</li>
        </ul>
        <!-- /#tabs -->
        <ul id="ctabs">
          <li>
            <ul class="ctabs_content">
              <li><a href="#">Actuality</a></li>
              <li><a href="#">Technology</a></li>
              <li><a href="#">Interview</a></li>
              <li><a href="#">Design</a></li>
              <li><a href="#">Mobile</a></li>
              <li><a href="#">Movies</a></li>
            </ul>
            <!-- /.ctabs_content -->
          </li>
          <!-- /#ctabs item -->
          <li>
            <ul class="ctabs_content">
              <li><a href="#">March 2010 (8)</a></li>
              <li><a href="#">February 2010 (3)</a></li>
              <li><a href="#">January 2010 (14)</a></li>
              <li><a href="#">December 2009 (17)</a></li>
              <li><a href="#">November 2009 (22)</a></li>
            </ul>
            <!-- /.ctabs_content -->
          </li>
          <!-- /#ctabs item -->
          <li>
            <ul class="ctabs_content">
              <li><a href="#">Robert Piche�?</a></li>
              <li><a href="#">Hubert Reeves</a></li>
            </ul>
            <!-- /.ctabs_content -->
          </li>
          <!-- /#ctabs item -->
        </ul>
        <!-- /#ctabs -->
      </div>
      <!-- /.sidebar_item tabbed content -->
      <div class="sidebar_item">
        <h3>Popular Posts</h3>
        <ul id="popular_posts">
          <li>
            <ul class="popular_posts_content">
              <li> <img src="assets/popular_1.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Interview with Constantin Potorac</a> <a href="#">21 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_2.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Best iPhone apps of all time</a> <a href="#">67 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_3.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Can Avatar sweep all the Oscar awards?</a> <a href="#">4 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_4.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Official Iron Man 2 trailer released!</a> <a href="#">27 comments</a> </li>
              <!-- /.popular_posts_content li -->
            </ul>
            <!-- /.popular_posts_content -->
          </li>
          <!-- /.popular_posts li - popular posts slider item -->
          <li>
            <ul class="popular_posts_content">
              <li> <img src="assets/popular_2.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Best iPhone apps of all time</a> <a href="#">67 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_1.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Interview with Constantin Potorac</a> <a href="#">21 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_4.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Official Iron Man 2 trailer released!</a> <a href="#">27 comments</a> </li>
              <!-- /.popular_posts_content li -->
              <li> <img src="assets/popular_3.gif" width="60" height="60" alt="Popular Post" class="alignleft" /> <a href="#" class="title">Can Avatar sweep all the Oscar awards?</a> <a href="#">4 comments</a> </li>
              <!-- /.popular_posts_content li -->
            </ul>
            <!-- /.popular_posts_content -->
          </li>
          <!-- /.popular_posts li - popular posts slider item -->
        </ul>
        <!-- /#popular_posts -->
        <ul id="pop_nav">
          <li id="prev_pop"></li>
          <!-- /#prev_pop -->
          <li id="next_pop"></li>
          <!-- /#next_pop -->
        </ul>
        <!-- /#pop_nav -->
      </div>
    </div>
    <!-- /#content #right - right side of main content or sidebar -->
  </div>
  <!-- /#content -->
</div>
<!-- /#wrapper -->
<?php $this->load->view("footer");?>
<!-- /#footer -->
<?php $this->load->view("copyright");?>
<!-- /#copyright -->
</body>
</html>
