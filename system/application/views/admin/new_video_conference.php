<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <!-- head -->
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

        <!-- Title of page -->
        <title>Confor.ca</title>

        <!-- Main CSS Stylesheet -->
        <link href="<?php echo base_url();?>style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="<?php echo base_url();?>fancybox/jquery.fancybox-1.3.1.css" type="text/css" media="screen" />

        <!-- .JS Files -->
        <script type="text/javascript" src="<?php echo base_url();?>js/jquery.min.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>js/Cufon_yui.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>js/LiberationSans_Cufon.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>fancybox/jquery.fancybox-1.3.1.pack.js"></script>
        <script type="text/javascript" src="<?php echo base_url();?>js/scripts.js"></script>

        <!--[if IE 6]>
        <script src="js/DD_belatedPNG.js"></script>
        <script> DD_belatedPNG.fix('*'); </script>
        <link href="style_IE6.css" rel="stylesheet" type="text/css" />
        <![endif]-->

        <style type="text/css">
            <!--
            .style2 {font-size: 16px}
            -->
        </style>
    </head>

    <body>

        <div id="wrapper">

            <div id="header">

                <div id="logo">

                    <a href="<?php echo base_url();?>index.html"><img src="<?php echo base_url();?>images/logo.png" alt="Confor.ca" /></a>

                </div>
                <!-- /#logo -->

                <?php $this->load->view("admin/menu");?>
                <!-- /#menu -->

                <div id="header_info">

                    <div class="left">

                        You are here : <a href="<?php echo site_url("admin/index") ?>" style="font-weight: bold;">Home</a> / <a href="<?php echo site_url("admin/admin_login") ?>">Admin Control</a>

                    </div>

                    <div class="right">

                        <a href="#" class="rss">Subscribe to RSS</a>

                    </div>

                </div>
                <!-- /#header_info -->

            </div>
            <!-- /#header -->
            <!-- /#top_box -->
            <div id="content">

              <div class="x2">

                    <h3>Administrator Menu</h3>
                    <ul>
                        <li><a href="<?php echo site_url('admin/list_admin')?>">Administrator List</a></li>
                        <li><a href="<?php echo site_url('admin/add_new_admin')?>">New administrator</a></li>
                        <li><a href="<?php echo site_url('admin/list_user')?>">User List</a></li>
                        <li><a href="<?php echo site_url('admin/list_ticket')?>">Ticket List</a></li>
                        <li><a href="<?php echo site_url('admin/list_video_conference')?>">Video conference List</a></li>
                        <li><a href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
                    </ul>
                    <p>&nbsp;	</p>
                    <h3>Add video conference </h3> 
					  <?php echo form_open('admin/add_new_video_conference/');?>
						<p>
						
							<label for="email">Speaker Email:</label>
                            <input type="hidden" name="speaker_id" value="1">
							<input class="medium" name="speaker_email" id="name" />
						</p>
						
						<p>
						
							<label for="title">Title:</label>
							<input class="medium" name="title" id="title" value="<?php echo set_value('title');?>"/><?php echo form_error('title')?>
						</p>
                        
                        <p>
                        
                            <label for="subject">Subject:</label>
                            <input class="medium" name="subject" id="subject" value="<?php echo set_value('subject');?>" />
                        </p>
                        
						<p>
						
							<label for="message">Description:</label>

							<textarea name="message" id="message" rows="8" cols=""></textarea>
						</p>
						
						<p>
						
							<label for="name">Keywords:</label>

							<input class="medium" name="keywords" id="keywords" />
						</p>
						
						<p>
						
							<label for="image">Image:</label>

							<input type="file" class="medium" name="image" size="50" id="image" />
						</p>
						
						<p>
						
							<label for="video">Upload Video:</label>

							<input type="file" class="medium" name="video" id="video" size="50" />
						</p>
						
                        <p>
						
							<input name="Submit" type="submit" class="submit" value="Send" />
						</p>
					<?php echo form_close()?>	
			  
                   </div>
              <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
            <!-- /#content -->
            <!-- /#content -->
            <!-- /#content -->
            <!-- /#content -->
        </div>
        <!-- /#wrapper -->

        <div id="footer">

            <div id="footer_wrapper">

                <div id="footer_content">

                    <div id="footer_column_1">

                        <h6>Services</h6>

                        <ul>

                            <li><a href="#">Conference office</a></li>

                            <li><a href="#">Training</a></li>

                        </ul>
                        <!-- /ul -->

                    </div>
                    <!-- /#footer_column_1 -->

                    <div id="footer_column_2">

                        <h6>Support</h6>

                        <ul>

                            <li><a href="#">Online Support</a></li>

                            <li><a href="#">Telephone Sales</a></li>

                            <li><a href="#">Workshops</a></li>

                            <li><a href="#">Email Form</a></li>

                            <li><a href="#">Mail</a></li>



                        </ul>
                        <!-- /ul -->

                    </div>
                    <!-- /#footer_column_2 -->

                    <div id="footer_column_3">

                        <h6>SHOP</h6>

                        <ul>

                            <li><a href="#">Books</a></li>

                            <li><a href="#">Tickets</a></li>



                            <li><a href="#">poster</a></li>

                            <li><a href="#">Conference</a></li>

                            <li><a href="#">Random</a></li>

                        </ul>
                        <!-- /ul -->

                    </div>
                    <!-- /#footer_column_3 -->

                    <div id="footer_column_4">

                        <h6>Randomly selected videos</h6>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr1.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr2.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr3.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr4.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr2.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr4.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr1.gif" width="81" height="52" alt="flickr" /></a>

                        <a href="<?php echo base_url();?>assets/post_1.jpg" class="lightbox"><img src="<?php echo base_url();?>assets/flickr3.gif" width="81" height="52" alt="flickr" /></a>

                    </div>
                    <!-- /#footer_column_4 -->

                </div>
                <!-- /#footer_content -->

            </div>
            <!-- /#footer_wrapper -->

        </div>
        <!-- /#footer -->

        <div id="copyright">

            <div id="copyright_wrapper">

                <ul class="left">

                    <li><a href="#">Home</a></li>

                    <li><a href="#">About</a></li>

                    <li><a href="#">Blog</a></li>

                    <li><a href="#">Shop</a></li>

                    <li><a href="#">Contact</a></li>

                    <li><a href="#" style="border: none;">Log in</a></li>

                </ul>
                <!-- /.left content-->

                <span class="right">&copy; 2009 Confor.ca | Designed and Developed by <a href="http://XemmeX.com" target="_blank">XemmeX</a></span>
                <!-- /.right content-->

            </div>
            <!-- /#copyright _wrapper-->
        </div>
        <!-- /#copyright -->
    </body>
</html>
