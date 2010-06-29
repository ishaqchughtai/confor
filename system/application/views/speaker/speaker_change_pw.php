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
		<h2>CHANGE PASSWORD</h2>
		<?php echo form_open('speaker/change_password');?>
		<fieldset class="change_pw">
			<legend>Change your password</legend>			
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>
			<div class="input text"><label>Old password</label>
				<?php echo form_input($oldPasswordInput);?>
			</div>			
			<?php echo form_error('old_password'); ?>			
			<div class="input text"><label>New password</label>
				<?php echo form_input($newPasswordInput);?>
			</div>			
			<?php echo form_error('new_password'); ?>
			<div class="input text"><label>Confirm new password</label>
				<?php echo form_input($passwordfInput);?>
			</div>			
			<?php echo form_error('passconf'); ?>
			<input type="submit" class="submit" name="change" value="Change password">			
		</fieldset>
		</form>					