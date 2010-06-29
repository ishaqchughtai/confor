<?php $this->load->view($side_bar['page'], $side_bar);
    $ramdomvideo = get_random_top_video($category);
?> 
	<div id="footer" style="width:100%">
	
		<div id="footer_wrapper">
		
			<div id="footer_content">
		
				<div id="footer_column_1">
				
				<h6><?php echo __("CF_services")?></h6>
					
				  <ul>
					
					  <li><a href="<?php echo site_url("conference_office") ?>"><?php echo __("CF_conference_office")?></a></li>
					
                      <li><a href="<?php echo site_url("accessories/show_element/training") ?>"><?php echo __("CF_formation")?></a></li>
					
				  </ul>
				  <!-- /ul -->
				
				</div>
				<!-- /#footer_column_1 -->
			
				<div id="footer_column_2">
				
					<h6><?php echo __("CF_support")?></h6>
					
					<ul>
					
						<li><a href="#"><?php echo __("CF_onl_sup")?></a></li>
					
						<li><a href="#"><?php echo __("CF_tel_sales")?></a></li>
					
						<li><a href="<?php echo site_url("accessories/show_element/how") ?>" ><?php echo __("CF_how_to")?></li>
					
						<li><a href="#"><?php echo __("CF_email_form")?></a></li>
					
						<li><a href="<?php echo site_url("home/contact")?>"><?php echo __("CF_email")?></a></li>
					
						
					
					</ul>
					<!-- /ul -->
				
				</div>
				<!-- /#footer_column_2 -->
			
				<div id="footer_column_3">
				
					<h6><?php echo __("CF_shop")?></h6>
					
					<ul>
					
						<li><a href="#"><?php echo __("CF_books")?></a></li>
					
						<li><a href="#"><?php echo __("CF_tickets")?></a></li>
					
						
					
						<li><a href="#"><?php echo __("CF_porter")?></a></li>
					
						<li><a href="#"><?php echo __("CF_confer")?></a></li>
					
						<li><a href="#"><?php echo __("CF_random")?></a></li>
					
					</ul>
					<!-- /ul -->
				
				</div>
				<!-- /#footer_column_3 -->
			
				<div id="footer_column_4">
				
					<h6><?php echo __("CF_ran_vid")?></h6>
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
			
				<li><a href="<?php echo base_url()?>"><?php echo __("CF_home")?></a></li>
			
				<li><a href="<?php echo site_url("accessories/show_element/about") ?>"><?php echo __("CF_about")?></a></li>
			
				<li><a href="<?php echo site_url("blog") ?>"><?php echo __("CF_blog")?></a></li>
			
				<li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>
                
                <li><a href="<?php echo site_url("home/contact")?>"><?php echo __("CF_contact")?></a></li>
			
         <?php if($this->session->userdata('admin')): ?>        
        <li><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php elseif($this->session->userdata('speaker_id')): ?>
        <li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php else: ?>
        <li><a href="<?php echo site_url("home/register") ?>"><?php echo __("CF_register")?></a></li>        
        <li><a href="<?php echo site_url("home/login") ?>"><?php echo __("CF_login")?></a></li>        
        <?php endif ?>
			
			</ul>
			<!-- /.left content-->
			
			<span class="right">&copy; 2010 Confor.ca | <?php echo __("CF_copy_right")?> <a href="http://xemmex.com/">XemmeX</a></span>
			<!-- /.right content-->
		
		</div>
		<!-- /#copyright _wrapper-->
	
	</div>
	<!-- /#copyright -->			
</body>
</html>