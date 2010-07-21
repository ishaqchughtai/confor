<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
				dateFormat: 'yy/mm/dd',
				onSelect: function(dateText, inst) {   
					 //$('#datepicker').val(dateText);
					 gogo = dateText;
					 //alert(gogo);
				}				
			}
		);
		$("#format").change(function() { 
		$('#datepicker').datepicker('option', {dateFormat: $(this).val()}); });
	});
	</script>
				<div class="content_item">
				
                <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement/advertisement_list')?>"><?php echo __("CF_adv_list")?></a></li>
    </ul><br />

					<h3><?php echo __("CF_add_new_adv")?></h3>
                    
                    <form action="<?php echo site_url('advertisement/add')?>" method="post" enctype="multipart/form-data" class="global" name="advertisement">
						<p>						
							<label for="date_expiry"><?php echo __("CF_adv_date_ex")?></label>
							<input name="date_expiry" class="short" id="datepicker" value="<?php if(isset($_POST['date_expiry'])){ echo $_POST['date_expiry'];}?>" />
                            <?php echo form_error('date_expiry')?>						
						</p>
						
						<p>						
							<label for="advertiser_name"><?php echo __("CF_advertiser_name")?></label>
							<input class="short" name="advertiser_name" id="advertiser_name" value="<?php if(isset($_POST['advertiser_name'])){ echo $_POST['advertiser_name'];}?>" />
							<?php echo form_error('advertiser_name')?>						
						</p>
						
						<p>						
							<label for="advertiser_email"><?php echo __("CF_advertiser_email")?></label>
							<input class="short" name="advertiser_email" id="advertiser_email" value="<?php if(isset($_POST['advertiser_email'])){ echo $_POST['advertiser_email'];}?>" />
							<?php echo form_error('advertiser_email')?>						
						</p>
						
						<p>						
							<label for="url"><?php echo __("CF_url")?></label>
							<input class="short" name="url" id="url" value="<?php if(isset($_POST['url'])){ echo $_POST['url'];}?>" />
							<?php echo form_error('url')?>						
						</p>
						
						<p>
						
							<label for="text_tips"><?php echo __("CF_text_tips")?></label>
							<textarea class="short" name="text_tips" id="text_tips" rows="5"><?php if(isset($_POST['text_tips'])){ echo $_POST['text_tips'];}?></textarea>
							<?php echo form_error('text_tips')?>
						
						</p>
						
						<p>
						
							<label for="image_link"><?php echo __("CF_image_link")?></label>
							<?php $this->load->view('image_upload');?>
				        </p>
                        
                        <p>
						
							<label for="target"><?php echo __("CF_target")?></label>
							<select class="short" name="target">
								<option value="1" selected="selected"><?php echo __("CF_new_win")?></option>
								<option value="0"><?php echo __("CF_same_win")?></option>
							</select>
				        </p>
				  <p>
						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_post")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
				  </p>
					</form>
					
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>