			
				<p class="not_success"><span class="img"></span><?php echo __("CF_mess_add_event")?><span class="close"></span></p>
			  <div id="left">
			  <!-- /.content_item -->
					<form id="contactform" action="<?php echo site_url('event/add')?>" method="post" enctype="multipart/form-data" class="global">	
					
					
			<?php
			if ($this->session->userdata('speaker_id')):?>
			<p>
						
				<input name="btnadd" type="submit" class="submit" value="<?php echo __("CF_add_new")?>" />
						
			</p>
			
			<?php else:?>
			<?php endif;?>			
					</form>
		  </div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->

				<!-- /#pagination -->
				<!-- /#content #left - left side of main content -->
	