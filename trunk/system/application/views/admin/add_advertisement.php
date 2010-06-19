				<div class="content_item">
				
					<h3>Add New Advertisement </h3>
					<?php
						$data=array('name' => 'event','id' => 'event-form'); 
						echo form_open('advertisement/add',$data);
					?>
						<p>						
							<label for="date_expiry">Date Expiry:</label>
							<input name="date_expiry" class="short" id="datepicker" value="<?php if(isset($_POST['date_expiry'])){ echo $_POST['date_expiry'];}?>" />
							<?php echo form_error('date_expiry')?>						
						</p>
						
						<p>						
							<label for="advertiser_name">Advertiser Name:</label>
							<input class="short" name="advertiser_name" id="advertiser_name" value="<?php if(isset($_POST['advertiser_name'])){ echo $_POST['advertiser_name'];}?>" />
							<?php echo form_error('advertiser_name')?>						
						</p>
						
						<p>						
							<label for="advertiser_email">Advertiser Email:</label>
							<input class="short" name="advertiser_email" id="advertiser_email" value="<?php if(isset($_POST['advertiser_email'])){ echo $_POST['advertiser_email'];}?>" />
							<?php echo form_error('advertiser_email')?>						
						</p>
						
						<p>						
							<label for="url">URL:</label>
							<input class="short" name="url" id="url" value="<?php if(isset($_POST['url'])){ echo $_POST['url'];}?>" />
							<?php echo form_error('url')?>						
						</p>
						
						<p>
						
							<label for="text_tips">Text Tips</label>
							<textarea class="short" name="text_tips" id="text_tips" rows="5"><?php if(isset($_POST['text_tips'])){ echo $_POST['text_tips'];}?></textarea>
							<?php echo form_error('text_tips')?>
						
						</p>
						
						<p>
						
							<label for="image_link">Image Link</label>
							<input class="short" name="image_link" id="image_link" value="<?php if(isset($_POST['image_link'])){ echo $_POST['image_link'];}?>" onclick="window.open('<?php echo site_url('advertisement/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" readonly="true"/>
				        <?php echo form_error('image_link')?></p>
				  <p>
						
							<input name="btnsubmit" type="submit" class="submit" value="Send" />
							<input name="btnreset" type="reset" class="reset" value="Reset" />
						
				  </p>
					<?php echo form_close();?>
					
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>