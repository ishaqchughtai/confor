<?php
	$passwordInput = array(
		'name' => 'password',
		'type' => 'password',
		'value' => set_value('password'),
		'class' => 'medium'
	);	
	$emailInput = array(
		'name' => 'email',
		'value' => set_value('email'),	
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
		<?=form_open('home/login');?>
		<fieldset class="login">
			<legend>Login as a speaker</legend>		
			<?php if(isset($error)):?>
				<p class="not_error medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>			
			<?endif;?>			
			<div class="input text"><label>Email</label>		
				<?=form_input($emailInput);?>
			</div>					
			<?=form_error('email');?>
			<div class="input text"><label>Password</label>
				<?=form_input($passwordInput);?>			
			</div>					
			<?=form_error('password');?>
			<div class="input text">
				<p class="not_login_info">
					<?=form_input($rememberInput);?>Remember me.					
					<a href="#">Lost your password or username?</a>					
				</p>
			</div>
			<input type="submit" name="login" style="width:80px" value="Login">	
		</fieldset>	
		</form>				
