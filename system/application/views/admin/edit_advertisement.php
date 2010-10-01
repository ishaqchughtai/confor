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
	$dateExpiry = date("Y/m/d", strtotime($row['DateExpiry']));
	$advertiserName = $row['AdvertiserName'];
	$advertiserEmail = $row['AdvertiserEmail'];
	$url = $row['URL'];
	$textTips = $row['TextTips'];
	$imageLink = $row['ImageLink'];
	$target = $row['Target'];
	}?>
    
<?php 
		$position[1] = $system_setting['adv_position1'];
		$position[2] = $system_setting['adv_position2'];
		$position[3] = $system_setting['adv_position3'];
		$position[4] = $system_setting['adv_position4'];
//		print_r($position);die;
		function getPos($position, $value)
		{
			for ($i=1;$i<=4;$i++)
			{
				if ($position[$i]==$value) return $i;
			}
			return 0;
		}
		//return;
		$current_pos = getPos($position,$id);
		//echo $current_pos;
?>
					
				<div class="content_item">
				<ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement/advertisement_list')?>"><?php echo __("CF_adv_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_new_adv")?></a></li>
    </ul><br />
					<h3><?php echo __("CF_edit_adv")?> </h3>
                    <?php
						$data=array('name' => 'advertisement','id' => 'advertisement-form'); 
						echo form_open('advertisement/edit/'.$id,$data);
					?>
                    <input name="edit_image" id="edit_image" type="hidden" value="<?php echo $imageLink;?>"/>
						<p>
						
							<label for="date_expiry"><?php echo __("CF_adv_date_ex")?>:</label>
							<input name="date_expiry" class="short" id="datepicker" value="<?php echo $dateExpiry?>" />
							<?php echo form_error('date_expiry')?>
						
						</p>
						
						<p>
						
							<label for="advertiser_name"><?php echo __("CF_advertiser_name")?>:</label>
							<input class="short" name="advertiser_name" id="advertiser_name" value="<?php echo $advertiserName?>" readonly="true" />
							<?php echo form_error('advertiser_name')?>
						
						</p>
						
						<p>						
							<label for="advertiser_email"><?php echo __("CF_advertiser_email")?>:</label>
							<input class="short" name="advertiser_email" id="advertiser_email" value="<?php echo $advertiserEmail ?>" readonly="true" />
							<?php echo form_error('advertiser_email')?>
						
						</p>
						
						<p>
						
							<label for="url"><?php echo __("CF_url")?>:</label>
							<input class="short" name="url" id="url" value="<?php echo $url?>" />
							<?php echo form_error('url')?>
						
						</p>
						
						<p>
						
							<label for="text_tips"><?php echo __("CF_text_tips")?></label>
							<textarea class="short" name="text_tips" id="text_tips" rows="5"><?php echo $textTips?></textarea>
							<?php echo form_error('text_tips')?>
						
						</p>
						
						<p>
						
						<label><?php echo __("CF_image_link")?></label>
						<?php $this->load->view('image_upload',array('edit_image'=>$imageLink));?>
				  <p>
                  
                  <p>
						
							<label for="target"><?php echo __("CF_target")?>:</label>
							<select class="short" name="target">
								<option value="1" <?php if($target==1) echo 'selected="selected"';?>><?php echo __("CF_new_win")?></option>
								<option value="0" <?php if($target==0) echo 'selected="selected"';?>><?php echo __("CF_same_win")?></option>
							</select>
						</p>
                        
                         <p>
						
							<label for="position"><?php echo __("CF_position")?>:</label>
							<select class="short" name="position">
                            <option value="0" <?php if($current_pos==0) echo 'selected="selected"';?>><?php echo __("CF_none")?></option>
								<option value="1" <?php if($current_pos==1) echo 'selected="selected"';?>><?php echo __("CF_top_left")?></option>
								<option value="2" <?php if($current_pos==2) echo 'selected="selected"';?>><?php echo __("CF_top_right")?></option>

								<option value="3" <?php if($current_pos==3) echo 'selected="selected"';?>><?php echo __("CF_bottom_left")?></option>

								<option value="4" <?php if($current_pos==4) echo 'selected="selected"';?>><?php echo __("CF_bottom_right")?></option>
							</select>
						</p>
						
							<input name="btnedit" type="submit" class="submit" id="btnedit" value="<?php echo __("CF_save")?>" onclick="return confirm('<?php echo __("CF_mess_update")?>');" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
				  </p>
                  
					<?php echo form_close();?>
					
				</div>

				<div id="left">					
						<p>
			  </div>					