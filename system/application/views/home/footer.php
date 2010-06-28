<?php $this->load->view($side_bar['page'], $side_bar);
    $ramdomvideo = get_random_top_video($category);
?> 
	<div id="footer" style="width:100%">
	
		<div id="footer_wrapper">
		
			<div id="footer_content">
		
				<div id="footer_column_1">
				
				<h6>Services</h6>
					
				  <ul>
					
					  <li><a href="<?php echo site_url("conference_office") ?>"><?php echo __("CON_conference_office")?></a></li>
					
                      <li><a href="<?php echo site_url("accessories/show_element/training") ?>">Formation</a></li>
					
				  </ul>
				  <!-- /ul -->
				
				</div>
				<!-- /#footer_column_1 -->
			
				<div id="footer_column_2">
				
					<h6>Support</h6>
					
					<ul>
					
						<li><a href="#">Online Support</a></li>
					
						<li><a href="#">Telephone Sales</a></li>
					
						<li><a href="<?php echo site_url("accessories/show_element/how") ?>" ><?php echo __("CON_howto")?></li>
					
						<li><a href="#">Email Form</a></li>
					
						<li><a href="<?php echo site_url("home/contact")?>">Email</a></li>
					
						
					
					</ul>
					<!-- /ul -->
				
				</div>
				<!-- /#footer_column_2 -->
			
				<div id="footer_column_3">
				
					<h6>Shop</h6>
					
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
				<?php for($i=0; $i<count($ramdomvideo); $i++):?>
                <a href="<?php echo site_url('home/play/'.$ramdomvideo[$i]['vid_id'])?>">
                <img src="<?php echo base_url().'thumbs/'.$ramdomvideo[$i]['shash']?>" width="81" height="52" alt="flickr">
                </a>                            
                <!-- /.content .top_box_block -->
            <?php endfor;?>
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
			
				<li><a href="<?php echo base_url()?>"><?php echo __("CON_home")?></a></li>
			
				<li><a href="<?php echo site_url("accessories/show_element/about") ?>"><?php echo __("CON_about")?></a></li>
			
				<li><a href="<?php echo site_url("blog") ?>"><?php echo __("CON_blog")?></a></li>
			
				<li><a href="<?php echo site_url("shop") ?>"><?php echo __("CON_shop")?></a></li>
                
                <li><a href="<?php echo site_url("home/contact")?>"><?php echo __("CON_contact")?></a></li>
			
         <?php if($this->session->userdata('admin')): ?>        
        <li><a href="<?php echo site_url("admin") ?>"><?php echo __("CON_setting")?></a></li>
        <li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CON_logout")?></a></li>        
        <?php elseif($this->session->userdata('speaker_id')): ?>
        <li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CON_setting")?></a></li>
        <li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CON_logout")?></a></li>        
        <?php else: ?>
        <li><a href="<?php echo site_url("home/register") ?>">Register</a></li>        
        <li id="login_link"><a href="#login_wrapper">Log in</a></li>    
        <?php $this->load->view("home/login");?>
        <?php endif ?>
			
			</ul>
			<!-- /.left content-->
			
			<span class="right">&copy; 2010 Confor.ca | Designed and Developed by <a href="http://xemmex.com/">XemmeX</a></span>
			<!-- /.right content-->
		
		</div>
		<!-- /#copyright _wrapper-->
	
	</div>
	<!-- /#copyright -->			
</body>
</html>