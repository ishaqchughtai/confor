<div class="content_item">

    <h3>Contactez-nous</h3>

    <h5>Leo quam tincidunt velit?</h5>

    <p>Curabitur viverra, ante non pulvinar pellentesque, leo quam tincidunt velit, quis eleifend erat orci eu orci. Proin ac eros nec dolor sodales pulvinar sit amet nec velit. Praesent tellus diam, luctus in.</p>
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?> 
    <form id="contactform" action="<?php echo site_url('home/contact')?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('name');?> 
            <label for="name"><?php echo lang('CON_your_name')?></label>
            <input class="short" name="name" id="name" />

        </p>

        <p>
            <?php echo form_error('email');?>  
            <label for="email"><?php echo lang('CON_your_email')?></label>
            <input class="short" name="email" id="email" />

        </p>

        <p>
            <?php echo form_error('message');?>  						
            <label for="message">Your message:</label>
            <textarea name="message" id="message" rows="8" cols=""></textarea>					
        </p>

        <p>						
            <input name="submit" type="submit" class="submit" value="Send" />
            <input name="" type="reset" class="reset" value="Reset" />						
        </p>

    </form>	


			</div>		