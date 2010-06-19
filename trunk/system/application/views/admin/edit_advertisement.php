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
				
					<h3>Edit Advertisement </h3>
					<?php
						$data=array('name' => 'event','id' => 'event-form'); 
						echo form_open('advertisement/edit/'.$id,$data);
					?>
						<p>
						
							<label for="date_expiry">Date Expiry:</label>
							<input name="date_expiry" class="medium" id="date_expiry" value="<?php echo $dateExpiry?>" />
							<?php echo form_error('date_expiry')?>
						
						</p>
						
						<p>
						
							<label for="advertiser_name">Advertiser Name:</label>
							<input class="medium" name="advertiser_name" id="advertiser_name" value="<?php echo $advertiserName?>" readonly="true" />
							<?php echo form_error('advertiser_name')?>
						
						</p>
						
						<p>						
							<label for="advertiser_email">Advertiser Email:</label>
							<input class="medium" name="advertiser_email" id="advertiser_email" value="<?php echo $advertiserEmail ?>" readonly="true" />
							<?php echo form_error('advertiser_email')?>
						
						</p>
						
						<p>
						
							<label for="url">URL:</label>
							<input class="medium" name="url" id="url" value="<?php echo $url?>" />
							<?php echo form_error('url')?>
						
						</p>
						
						<p>
						
							<label for="text_tips">Text Tips</label>
							<textarea class="medium" name="text_tips" id="text_tips" rows="5"><?php echo $textTips?></textarea>
							<?php echo form_error('text_tips')?>
						
						</p>
						
						<p>
						
							<label for="image_link">Image Link</label>
							<input class="medium" name="image_link" id="image_link" value="<?php echo $imageLink?>" onclick="window.open('<?php echo site_url('advertisement/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" readonly="true"/>
				        <?php echo form_error('image_link')?></p>
				  <p>
						
							<input name="btnedit" type="submit" class="submit" id="btnedit" value="Save" />
							<input name="btnreset" type="reset" class="reset" value="Reset" />
						
				  </p>
					<?php echo form_close();?>
					
				</div>

				<div id="left">					
						<p>
			  </div>					