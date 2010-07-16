<style>
	.recommended
	{
		font-size:11px;
		color:#5BB12F;
		margin-left:5px;
	}
</style>
<?php
	$resize_w_input = array(
		'name' => 'resize_w',
		'style' => 'width:60px',
		'value' => isset($resize_w)?$resize_w:set_value('resize_w')	
	);		
	$resize_h_input = array(
		'name' => 'resize_h',
		'style' => 'width:60px',
		'value' => isset($resize_h)?$resize_h:set_value('resize_h')	
	);	
	
	$thumb_w_input = array(
		'name' => 'thumb_w',
		'style' => 'width:60px',
		'value' => isset($thumb_w)?$thumb_w:set_value('thumb_w')	
	);		
	$thumb_h_input = array(
		'name' => 'thumb_h',
		'style' => 'width:60px',
		'value' => isset($thumb_h)?$thumb_h:set_value('thumb_h')	
	);
	
	$allowed_ext_input = array(
		'name' => 'allowed_ext',
		'class' => 'medium',
		'value' => isset($allowed_ext)?$allowed_ext:set_value('allowed_ext')	
	);	
	
	$vbrate_input = array(
		'name' => 'vbrate',
		'class' => 'short',
		'value' => isset($vbrate)?$vbrate:set_value('vbrate')	
	);		

	$sbrate_input = array(
		'name' => 'sbrate',
		'class' => 'short',
		'value' => isset($sbrate)?$sbrate:set_value('sbrate')	
	);	

	$srate_input = array(
		'name' => 'srate',
		'class' => 'short',
		'value' => isset($srate)?$srate:set_value('srate')	
	);		
	
	$max_size_input = array(
		'name' => 'max_upload_size',
		'style' => 'width:60px',
		'value' => isset($max_upload_size)?$max_upload_size:set_value('max_upload_size')	
	);	
	
	$ratio_option = array(
		'4:3' => 'Standard (4:3)',
		'16:9' => 'Wide (16:9)',
		'1.85' => 'Cinematic (1.85)'
	);
	$ratio = isset($ratio)?$ratio:'4:3';
	
	$yes_no_option = array(
		0 => 'no',
		1 => 'yes'
	);
	
	$is_resize = isset($is_resize)?$is_resize:1;
	$keep_ratio = isset($keep_ratio)?$keep_ratio:1;
	
?>
                    <h3><?php echo __("CF_vid_conf")?></h3>
					<?php $this->load->view("vid/menu_video_admin");?>
                    <p>&nbsp;	</p>

		<h2>Video settings</h2>		
		<?php echo form_open('vid/setting');?>
		<fieldset class="login">
		  <legend></legend>		
			<?php if(isset($error)):?>
			<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>		

			<div class="input text">
				<label>Allowed extensions</label>		
				<?php echo form_input($allowed_ext_input);?>
			</div>					
			<?php echo form_error('allowed_ext');?>
							
			<div class="input text">
				<label>VBRATE</label><span class="recommended">(500000 is recommended)</span>			
				<?php echo form_input($vbrate_input);?>
			</div>					
			<?php echo form_error('vbrate');?>	
			
			<div class="input text">
				<label>Audio bit rate</label> <span class="recommended">(64 is recommended)</span>			
				<?php echo form_input($sbrate_input);?>
			</div>					
			<?php echo form_error('sbrate');?>				
			
			<div class="input text">
				<label>Audio sample frequency</label><span class="recommended">(22050 is recommended)</span>			
				<?php echo form_input($srate_input);?>
			</div>					
			<?php echo form_error('srate');?>		
					
			<div class="input text">
				<label>Keep ratio ?</label>		
				<?php echo form_dropdown('keep_ratio', $yes_no_option, $keep_ratio,'style="width:60px"');?>
			</div>		
			
			<div class="input text">
				<label>Ratio</label>		
				<?php echo form_dropdown('ratio', $ratio_option, $ratio,'style="width:150px"');?>
			</div>								
			
			<div class="input text">
				<label>Max upload size</label>		
				<?php echo form_input($max_size_input);?>
			</div>					
			<?php echo form_error('max_size');?>	
			
			<div class="input text">
				<label>Is resize ?</label>		
				<?php echo form_dropdown('is_resize', $yes_no_option, $is_resize,'style="width:60px"');?>
			</div>	
			
			<div class="input text">
				<label>Resize width</label>		
				<?php echo form_input($resize_w_input);?>
			</div>					
			<?php echo form_error('resize_w');?>

			<div class="input text">
				<label>Resize height</label>		
				<?php echo form_input($resize_h_input);?>
			</div>					
			<?php echo form_error('resize_h');?>	
			
			<div class="input text">
				<label>Thumbnail width</label>		
				<?php echo form_input($thumb_w_input);?>
			</div>					
			<?php echo form_error('thumb_w');?>

			<div class="input text">
				<label>Thumbnail height</label>		
				<?php echo form_input($thumb_h_input);?>
			</div>					
			<?php echo form_error('thumb_h');?>				
			
			<input type="submit" class="submit" name="update" value="Update">
			
		</fieldset>	
		</form>				