<div id="content">			
			<div class="x3">			
				<h3><?php echo lang('CON_profile');?></h3>				
				<ul class="link_conttrol">
					<li><a href="<?php echo site_url('speaker/edit_profile')?>">Edit profile</a></li>
					<li><a href="<?php echo site_url('speaker/change_password')?>">Change password</a></li>
					<li><a href="<?php echo base_url().'pay'?>">Subcriptions</a></li>
				</ul>											
			</div>
			<!-- /.x2 - represents a half windows size div -->
			
			<div class="x3">			
				<h3>Your video</h3>								
				<ul class="link_conttrol">
                <?php $speaker_id = $this->session->userdata('speaker_id'); ?>
					<li><a href="<?php echo site_url('video/your_video/'.$speaker_id.'/5')?>">Your video</a></li>
					<li><a href="<?php echo site_url('video/add_video')?>">Add new video</a></li>
				</ul>					
			</div>
			
			<div class="x3 no_margin">			
				<h3>Tickets</h3>				
				<ul class="link_conttrol">
					<li><a href="<?php echo site_url('ticket')?>">List tickets</a></li>
					<li><a href="<?php echo site_url('ticket/send_ticket_by_speaker')?>">Add new ticket</a></li>
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
					<li><a href="<?php echo site_url('event/event_content/'.get_user_id())?>">List Events</a></li>
					<li><a href="<?php echo site_url('event/add')?>">Add new event</a></li>
				</ul>	
			</div>
			<!-- /.x3 - represents a third windows size div -->

			
				