<?php
	$usernameInput = array(
		'name' => 'username',
		'class' => 'short',
		'value' => isset($username)?$username:set_value('username')	
	);		
	$nameInput = array(
		'name' => 'name',
		'class' => 'short',
		'value' => isset($name)?$name:set_value('name')	
	);	
	$firstNameInput = array(
		'name' => 'first_name',
		'class' => 'short',
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
	
	// $select_membership = isset($membership)?$membership:1; 
	// $select_membership_setting = array
	// (
		// 'table_name' => 'membership',
		// 'key_field' => 'id',
		// 'value_field' => 'name'
	// );	
	
	$emailInput = array(
		'name' => 'email',
		'class' => 'medium',		
		'value' => isset($email)?$email:set_value('email')	
	);			
	
	$descriptionInput = array(
		'name' => 'description',
		'value' => isset($description)?$description:''
	);		

	$captchaInput = array(
		'name' => 'captcha',
		'style' => 'width:90px; float:left; margin-right:10px',	
		'value' => isset($captcha)?$captcha:set_value('captcha')	
	);
	
	$password1Input = array(
		'name' => 'password',		
		'type' => 'password',
		'class' => 'short',				
		'value' => '',			
	);	
	$password2Input = array(
		'name' => 'passconf',
		'type' => 'password',
		'class' => 'short',				
		'value' => '',
	);			
	
	// $subcriptionDate = isset($SubcriptionDate)?$SubcriptionDate:'';
	// $subscriptionExpiration=isset($SubscriptionExpiration)?$SubscriptionExpiration:'';
?>


		<h2>REGISTER</h2>		
		<?php echo form_open('home/register');?>
		<fieldset class="login">
		  <legend></legend>		
			<?php if(isset($error)):?>
	    <p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>		

			<div class="input text"><label><?php echo __("CON_user_name_label");?>(*)</label>		
				<?php echo form_input($usernameInput);?>
			</div>					
			<?php echo form_error('username');?>
			
			<div class="input text"><label>Password(*)</label>
				<?php echo form_input($password1Input);?>
			</div>			
			<?php echo form_error('password'); ?>
			<div class="input text"><label>Confirm password</label>
				<?php echo form_input($password2Input);?>
			</div>			
			<?php echo form_error('passconf'); ?>			
			
			<div class="input text"><label>Email(*)</label>
				<?php echo form_input($emailInput);?>			
			</div>								
			<?php echo form_error('email');?>			
			
			<div class="input text"><label><?php echo __("CON_name");?>(*)</label>		
				<?php echo form_input($nameInput);?>
			</div>					
			<?php echo form_error('name');?>
			<div class="input text"><label><?php echo __("CON_first_name");?>(*)</label>
				<?php echo form_input($firstNameInput);?>			
			</div>					
			<?php echo form_error('firstName');?>			
			
			<div class="input text"><label>Company(*)</label>
				<?php echo form_input($companyNameInput);?>
			</div>
			<?php echo form_error('companyName');?>

			<div class="input text"><label>Country(*)</label>
				<?php echo  form_dropdown('country', dropdown_data($selected_country_setting),$selected_country, ' class="short"');?>
			</div>			
			
			<div class="input text"><label><?php echo __('CON_description');?></label>
				<?php echo form_textarea($descriptionInput);?>			
			</div>		
			
			<div>			
			<div class="input text">
				<label>Type the text in the image</label><br>
				<?php echo form_input($captchaInput);?><?php echo $captcha_img?>
				<p>&nbsp;</p>
			</div>								
			<?php echo form_error('captcha');?>			
			</div>
			
			<input type="submit" class="submit" name="register" value="REGISTER">
			
		</fieldset>	
		</form>				