<?php
	$oldPasswordInput = array(
		'name' => 'old_password',
		'type' => 'password',
		'class' => 'medium',
		'value' => '',	
	);	
	
	$newPasswordInput = array(
		'name' => 'new_password',
		'type' => 'password',
		'class' => 'medium',
		'value' => '',	
	);	
	$passwordfInput = array(
		'name' => 'passconf',
		'type' => 'password',
		'class' => 'medium',
		'value' => '',
	);			
?>
		<h2><?php echo strtoupper(__("CF_change_pass"))?></h2>
		<?php echo form_open('speaker/change_password');?>
		<fieldset class="change_pw">
			<legend><?php echo __("CF_text")?></legend>			
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>
			<div class="input text"><label><?php echo __("CF_old_pass")?></label>
				<?php echo form_input($oldPasswordInput);?>
			</div>			
			<?php echo form_error('old_password'); ?>			
			<div class="input text"><label><?php echo __("CF_new_pass")?></label>
				<?php echo form_input($newPasswordInput);?>
			</div>			
			<?php echo form_error('new_password'); ?>
			<div class="input text"><label><?php echo __("CF_confirm_pass")?></label>
				<?php echo form_input($passwordfInput);?>
			</div>			
			<?php echo form_error('passconf'); ?>
			<input type="submit" class="submit" name="change" value="<?php echo strtoupper(__("CF_change_pass"))?>">			
		</fieldset>
		</form>					