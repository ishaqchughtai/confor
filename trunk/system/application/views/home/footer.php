<?php $this->load->view($side_bar['page'], $side_bar);
    $ramdomvideo = get_random_top_video($category);
?> 
	<div id="footer" style="width:100%">
	
		<div id="footer_wrapper">
		
			<div id="footer_content">
		
				<div id="footer_column_1">
				
				<h6>Services</h6>
					
				  <ul>
					
					  <li><a href="#">Conference office</a></li>
					
					  <li><a href="#">Formation</a></li>
					
				  </ul>
				  <!-- /ul -->
				
				</div>
				<!-- /#footer_column_1 -->
			
				<div id="footer_column_2">
				
					<h6>Support</h6>
					
					<ul>
					
						<li><a href="#">Online Support</a></li>
					
						<li><a href="#">Telephone Sales</a></li>
					
						<li><a href="#">How to</a></li>
					
						<li><a href="#">Email Form</a></li>
					
						<li><a href="#">Mail</a></li>
					
						
					
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
			
				<li><a href="#">Home</a></li>
			
				<li><a href="#">About</a></li>
			
				<li><a href="#">Blog</a></li>
			
				<li><a href="#">Shop</a></li>
                
                <li><a href="#">Contact</a></li>
			
				<li><a href="#" style="border: none;">Log in</a></li>
			
			</ul>
			<!-- /.left content-->
			
			<span class="right">&copy; 2010 Confor.ca | Designed and Developed by <a href="#">XemmeX</a></span>
			<!-- /.right content-->
		
		</div>
		<!-- /#copyright _wrapper-->
	
	</div>
	<!-- /#copyright -->			
</body>
</html>
<script language="JavaScript">
	flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer-3.2.2.swf",{clip:{autoPlay: false,autoBuffering: true}});
</script>