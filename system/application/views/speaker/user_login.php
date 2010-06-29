<?php
	$passwordInput = array(
		'name' => 'password',
		'type' => 'password',
		'value' => set_value('password'),
		'class' => 'medium'
	);	
	$usernameInput = array(
		'name' => 'username',
		'value' => set_value('username'),	
		'class' => 'medium'
	);	
	$rememberInput = array(
		'name' => 'is_cookie',
		'type' => 'checkbox',
		'class' => 'checkbox',
		'value' => '1'
	);		
?>

		<h2>SPEAKER LOGIN</h2>
		<?php echo form_open('home/login');?>
		<fieldset class="login">
			<legend>Login as a speaker</legend>		
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?php endif;?>			
			<div class="input text"><label>Username</label>		
				<?php echo form_input($usernameInput);?>
			</div>					
			<?php echo form_error('username');?>
			<div class="input text"><label>Password</label>
				<?php echo form_input($passwordInput);?>			
			</div>					
			<?php echo form_error('password');?>
			<div class="input text">
				<p class="not_login_info">
					<?php echo form_input($rememberInput);?>Remember me.					
					<a href="<?php echo site_url('forgot_password')?>">Lost your password or username?</a>					
				</p>
			</div>
			<input type="submit" name="login" style="width:80px" value="Login" class="submit">	
		</fieldset>	
		</form>				
