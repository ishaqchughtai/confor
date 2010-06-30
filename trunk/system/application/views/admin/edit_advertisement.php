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
<?php
 foreach($query as $row)
{
	$id = $row['ID'];
	$dateBeginning = $row['DateBeginning'];
	$dateExpiry = $row['DateExpiry'];
	$advertiserName = $row['AdvertiserName'];
	$advertiserEmail = $row['AdvertiserEmail'];
	$url = $row['URL'];
	$textTips = $row['TextTips'];
	$imageLink = $row['ImageLink'];
	}?>
					
				<div class="content_item">
				
					<h3><?php echo __("CF_edit_adv")?> </h3>
					<?php
						$data=array('name' => 'event','id' => 'event-form'); 
						echo form_open('advertisement/edit/'.$id,$data);
					?>
						<p>
						
							<label for="date_expiry"><?php echo __("CF_adv_date_ex")?>:</label>
							<input name="date_expiry" class="medium" id="datepicker" value="<?php echo $dateExpiry?>" />
							<?php echo form_error('date_expiry')?>
						
						</p>
						
						<p>
						
							<label for="advertiser_name"><?php echo __("CF_advertiser_name")?>:</label>
							<input class="medium" name="advertiser_name" id="advertiser_name" value="<?php echo $advertiserName?>" readonly="true" />
							<?php echo form_error('advertiser_name')?>
						
						</p>
						
						<p>						
							<label for="advertiser_email"><?php echo __("CF_advertiser_email")?>:</label>
							<input class="medium" name="advertiser_email" id="advertiser_email" value="<?php echo $advertiserEmail ?>" readonly="true" />
							<?php echo form_error('advertiser_email')?>
						
						</p>
						
						<p>
						
							<label for="url"><?php echo __("CF_url")?>:</label>
							<input class="medium" name="url" id="url" value="<?php echo $url?>" />
							<?php echo form_error('url')?>
						
						</p>
						
						<p>
						
							<label for="text_tips"><?php echo __("CF_text_tips")?></label>
							<textarea class="medium" name="text_tips" id="text_tips" rows="5"><?php echo $textTips?></textarea>
							<?php echo form_error('text_tips')?>
						
						</p>
						
						<p>
						
							<label for="image_link"><?php echo __("CF_image_link")?></label>
							<input class="medium" name="image_link" id="image_link" value="<?php echo $imageLink?>" onclick="window.open('<?php echo site_url('advertisement/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" readonly="true"/>
				        <?php echo form_error('image_link')?></p>
				  <p>
						
							<input name="btnedit" type="submit" class="submit" id="btnedit" value="<?php echo __("CF_save")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
				  </p>
					<?php echo form_close();?>
					
				</div>

				<div id="left">					
						<p>
			  </div>					