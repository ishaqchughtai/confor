			
				<p class="not_warning "><span class="img"></span>You have added an event successfully! Please wait for admin approval<span class="close"></span></p>
			  <div id="left">
			  <!-- /.content_item -->
					<form id="contactform" action="<?php echo site_url('event/add')?>" method="post" enctype="multipart/form-data" class="global">	
					
					
			<?php
			if ($this->session->userdata('speaker_id')):?>
			<p>
						
				<input name="btnadd" type="submit" class="submit" value="Add New" />
						
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
	