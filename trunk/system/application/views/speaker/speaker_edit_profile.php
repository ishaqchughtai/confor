<?php
	$nameInput = array(
		'name' => 'name',
		'class' => 'medium',
		'value' => isset($Name)?$Name:set_value('name')	
	);	
	$firstNameInput = array(
		'name' => 'firstName',
		'class' => 'medium',
		'value' => isset($FirstName)?$FirstName:set_value('firstName')	
	);		
	$companyNameInput = array(
		'name' => 'companyName',
		'class' => 'medium',
		'value' => isset($CompanyName)?$CompanyName:''
	);			
	$descriptionInput = array(
		'name' => 'description',
		'value' => isset($Description)?$Description:''
	);		
	$emailInput = array(
		'name' => 'email',
		'class' => 'medium',
		'readonly' => 'readonly',
		'value' => isset($Email)?$Email:set_value('email')	
	);		
	// $password1Input = array(
		// 'name' => 'password',
		// 'type' => 'password',
		// 'value' => '',	
	// );	
	// $password2Input = array(
		// 'name' => 'passconf',
		// 'type' => 'password',
		// 'value' => '',
	// );			
	$subcriptionDate = isset($SubcriptionDate)?$SubcriptionDate:'';
	$subscriptionExpiration=isset($SubscriptionExpiration)?$SubscriptionExpiration:'';
?>


		<h2><?php echo lang('CON_profile');?></h2>		
		<?php echo form_open('speaker/edit_profile');?>
		<fieldset class="login">
			<legend><?php echo lang('CON_general_info');?></legend>		
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>			
			<div class="input text"><label><?php echo lang('CON_name');?></label>		
				<?php echo form_input($nameInput);?>
			</div>					
			<?php echo form_error('name');?>
			<div class="input text"><label><?php echo lang('CON_first_name');?></label>
				<?php echo form_input($firstNameInput);?>			
			</div>					
			<?php echo form_error('firstName');?>			
			<div class="input text"><label><?php echo lang('CON_profile');?></label>
				<?php echo form_input($companyNameInput);?>
			</div>
			<?php echo form_error('companyName');?>
			<div class="input text"><label>Email</label>
				<?php echo form_input($emailInput);?>			
			</div>								
			<?php echo form_error('email');?>
			<div class="input text"><label><?php echo lang('CON_description');?></label>
				<?php echo form_textarea($descriptionInput);?>			
			</div>				
			<div class="input text"><label>Subscription</label>			
			<input name='typeName' type='hidden' value="<?php echo isset($TypeName)?$TypeName:''?>">
			<input name='subcriptionDate' type='hidden' value="<?php echo $subcriptionDate?>">
			<input name='subscriptionExpiration' type='hidden' value="<?php echo $subscriptionExpiration?>">
			<div style="padding:15px;margin:10px;background:#fafafa">
			<strong>Date of subcription:</strong><?php echo $subcriptionDate?> <br/>
			<strong>Type of subcription:</strong> <?php echo isset($TypeName)?$TypeName:''?> <br/>
			<strong>Expiration date of the subcription:</strong><?php echo $subscriptionExpiration?> <br/>
			</div>
			</div>						
			<input type="submit" class="submit" name="update" value="<?php echo lang('CON_update');?>">
			
		</fieldset>	
		</form>				