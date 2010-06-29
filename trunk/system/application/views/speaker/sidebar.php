</div>
			<div id="right">
			
				<h3>MEMBERSHIP</h3>
				<h5>Your subcriptions</h5>
				
			  <div class="sidebar_item">
			  <p><strong>Current Membership: </strong><?php echo $membership_info['ms_name']?></p>			  
			  </br>			  
			  <?php if ($membership_info['ms_rate']>0):?>
			  <p><strong>Current Membership Rate: </strong><?php echo $membership_info['rate_info']?></p>
			  </br>
			  <p><strong>Membership Expires: </strong><?php echo $membership_info['ms_expire']?></p>			  
			  <?php else:?>
			  <p><strong>Current Membership Rate: </strong>Your payment might be pending. </p>			  
			  <?php endif;?>
			  <ul class="link_conttrol">
			  <li><a href="<?php echo base_url().'pay'?>">Upgrade your subcription</a></li>
			  </ul>
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
			