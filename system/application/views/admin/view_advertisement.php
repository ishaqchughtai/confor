<?php
 foreach($query as $row)
{
	$id = $row['ID'];
	$dateBeginning = $row['DateBeginning'];
	$dateExpiry = date("Y/m/d", strtotime($row['DateExpiry']));
	$advertiserName = $row['AdvertiserName'];
	$advertiserEmail = $row['AdvertiserEmail'];
	$url = $row['URL'];
	$textTips = $row['TextTips'];
	$imageLink = $row['ImageLink'];
	$target = $row['Target'];
	$viewed = $row['Viewed'];
	}?>
					
				<div class="content_item">
				<ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement/advertisement_list')?>"><?php echo __("CF_adv_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_new_adv")?></a></li>
    </ul><br />
					<h3><?php echo __("CF_avd_details")?> </h3>
                    <?php
						$data=array('name' => 'advertisement','id' => 'advertisement-form'); 
						echo form_open('advertisement/get_advertisement'.'/'.$id,$data);
					?>
                    <input name="edit_image" id="edit_image" type="hidden" value="<?php echo $imageLink;?>"/>
						<p>
						
							<label for="date_expiry"><?php echo __("CF_adv_date_ex")?>:</label>
							<?php echo $dateExpiry?>
						
						</p>
						
						<p>
						
							<label for="advertiser_name"><?php echo __("CF_advertiser_name")?>:</label>
							<?php echo $advertiserName?>
							
						
						</p>
						
						<p>						
							<label for="advertiser_email"><?php echo __("CF_advertiser_email")?>:</label>
							<?php echo $advertiserEmail ?>
						
						</p>
						
						<p>
						
							<label for="url"><?php echo __("CF_url")?>:</label>
							<?php echo $url?>
						
						</p>
						
						<p>
						
							<label for="text_tips"><?php echo __("CF_text_tips")?>:</label>
							<?php echo $textTips?>
							
						
						</p>
                        
                        <p>
						
							<label for="target"><?php echo __("CF_target")?>:</label>
							
								<?php if($target==1) echo __("CF_new_win")?>
								<?php if($target==0) echo __("CF_same_win")?>
						</p>
                        
                        <p>
						
							<label for="target"><?php echo __("CF_viewed")?>:</label>
							
								<?php echo $viewed?>
						</p>
						
						<p>
						
						<label><?php echo __("CF_image_link")?></label>
						<img src="<?php echo base_url().'assets/uploads/image/'.$imageLink?>" width="285" height="285">
				  <p>
                  
                  
						
							<input name="btnedit" type="submit" class="submit" id="btnedit" value="<?php echo __("CF_edit")?>" />
						
				  </p>
                  <?php echo form_close();?>
					
				</div>

				<div id="left">					
						<p>
			  </div>	