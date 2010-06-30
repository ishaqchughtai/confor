</div>
			<div id="right">
			
				<h3><?php echo __("CF_member_ship")?></h3>
				<h5><?php echo __("CF_yr_sub")?></h5>
				
			  <div class="sidebar_item">
			  <p><strong><?php echo __("CF_cur_mem")?>: </strong><?php echo $membership_info['ms_name']?></p>			  
			  </br>			  
			  <?php if ($membership_info['ms_rate']>0):?>
			  <p><strong><?php echo __("CF_cur_mem_rate")?>: </strong><?php echo $membership_info['rate_info']?></p>
			  </br>
			  <p><strong><?php echo __("CF_mem_exp")?>: </strong><?php echo $membership_info['ms_expire']?></p>			  
			  <?php else:?>
			  <p><strong><?php echo __("CF_cur_mem_rate")?>: </strong><?php echo __("CF_notify")?>. </p>			  
			  <?php endif;?>
			  <ul class="link_conttrol">
			  <li><a href="<?php echo base_url().'pay'?>"><?php echo __("CF_upgrade")?></a></li>
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
			