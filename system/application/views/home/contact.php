				<div class="content_item">
				
					<h3>Contactez-nous</h3>
			
					<h5>Leo quam tincidunt velit?</h5>
			
					<p>Curabitur viverra, ante non pulvinar pellentesque, leo quam tincidunt velit, quis eleifend erat orci eu orci. Proin ac eros nec dolor sodales pulvinar sit amet nec velit. Praesent tellus diam, luctus in.</p>
					
					<form id="contactform" action="php/mail.php" method="post" enctype="multipart/form-data" class="global">
					
						<p>
						
							<label for="name"><?php echo lang('CON_your_name')?></label>
							<input class="short" name="name" id="name" />
						
						</p>
						
						<p>
						
							<label for="email"><?php echo lang('CON_your_email')?></label>
							<input class="short" name="email" id="email" />
						
						</p>
						
						<p>						
							<label for="message">Your message:</label>
							<textarea name="message" id="message" rows="8" cols=""></textarea>					
						</p>
						
						<p>						
							<input name="" type="submit" class="submit" value="Send" />
							<input name="" type="reset" class="reset" value="Reset" />						
						</p>
					
					</form>	
	
			
			</div>		