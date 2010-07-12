<?php
	$nameInput = array(
		'name' => 'name',
		'class' => 'medium',
		'value' => isset($name)?$name:set_value('name')	
	);	

	$firstNameInput = array(
		'name' => 'first_name',
		'class' => 'medium',
		'value' => isset($first_name)?$first_name:set_value('first_name')	
	);		

	$companyNameInput = array(
		'name' => 'company_name',
		'class' => 'medium',
		'value' => isset($company_name)?$company_name:set_value('company_name')
	);			
		
	$selected_country = isset($country)?$country:225; // united kingdom
	$selected_country_setting = array
	(
		'table_name' => 'geo_countries',
		'key_field' => 'con_id',
		'value_field' => 'name'
	);
	
	$descriptionInput = array(
		'name' => 'description',
		'value' => isset($description)?$description:''
	);		
	
	$emailInput = array(
		'name' => 'email',
		'class' => 'medium',
		'readonly' => 'readonly',
		'value' => isset($email)?$email:set_value('email')	
	);		
?>
		<h2><?php echo __("CF_profile");?></h2>		
		<?php echo form_open('speaker/edit_profile');?>
		<fieldset class="login">
			<legend><?php echo __("CF_general_info");?></legend>		
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>			
			<div class="input text"><label><?php echo __("CF_name");?></label>		
				<?php echo form_input($nameInput);?>
			</div>					
			<?php echo form_error('name');?>
			<div class="input text"><label><?php echo __("CF_first_name");?></label>
				<?php echo form_input($firstNameInput);?>			
			</div>					
			<?php echo form_error('first_name');?>			
			<div class="input text"><label><?php echo __("CF_profile");?></label>
				<?php echo form_input($companyNameInput);?>
			</div>
			<?php echo form_error('company_name');?>
			<div class="input text"><label><?php echo __("CF_email")?></label>
				<?php echo form_input($emailInput);?>			
			</div>	
			<div class="input text"><label><?php echo __("CF_country")?>(*)</label>
				<?php echo  form_dropdown('country', dropdown_data($selected_country_setting),$selected_country, ' class="short"');?>
			</div>					
			<?php echo form_error('email');?>
			<div class="input text"><label><?php echo __("CF_des_res");?></label>
				<?php echo form_textarea($descriptionInput);?>			
			</div>				
			<input type="submit" class="submit" name="update" value="<?php echo __("CF_update");?>">
			
		</fieldset>	
		</form>				