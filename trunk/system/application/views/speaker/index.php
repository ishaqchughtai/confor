<div id="content">			
			<div class="x3">			
				<h3><?php echo __('CF_edit_admin');?></h3>				
				<ul class="link_conttrol">
					<li><a href="<?php echo site_url('speaker/edit_profile')?>"><?php echo __('CF_edit_admin');?></a></li>
					<li><a href="<?php echo site_url('speaker/change_password')?>"><?php echo __("CF_change_pass")?></a></li>
					<li><a href="<?php echo base_url().'pay'?>"><?php echo __("CF_sub")?></a></li>
				</ul>											
			</div>
			<!-- /.x2 - represents a half windows size div -->
			
			<div class="x3">			
				<h3><?php echo __("CF_your_vid")?></h3>								
				<ul class="link_conttrol">
                <?php $speaker_id = $this->session->userdata('speaker_id'); ?>
					<li><a href="<?php echo site_url('vspeaker')?>"><?php echo __("CF_your_vid")?></a></li>
					<li><a href="<?php echo site_url('vspeaker/new_video_conference')?>"><?php echo __("CF_add_vid")?></a></li>
				</ul>					
			</div>
			
			<div class="x3 no_margin">			
				<h3>Tickets</h3>				
				<ul class="link_conttrol">
					<li><a href="<?php echo site_url('ticket')?>"><?php echo __("CF_list_tic")?></a></li>
					<li><a href="<?php echo site_url('ticket/send_ticket_by_speaker')?>"><?php echo __("CF_add_tic")?></a></li>
				</ul>					
			</div>			
			<!-- /.x2 - represents a half windows size div -->
			
			<!--                  -->
			
			<!-- END OF .x2 CLASS -->
			
			<!--                  -->
			
			<div class="divider"></div>
			<!-- /.divider -->
			
			<div class="x3">			
				<h3>Your events</h3>								
				<ul class="link_conttrol">
					<li><a href="<?php echo site_url('event/your_event/'.get_user_id().'/5')?>"><?php echo __("CF_list_event")?></a></li>
					<li><a href="<?php echo site_url('event/add')?>"><?php echo __("CF_add_event")?></a></li>
				</ul>	
			</div>
			<!-- /.x3 - represents a third windows size div -->

			
				