<div class="content_item">

    <h3><?php echo strtoupper(__('CF_contact'))?></h3>

    <h5><?php echo __('CON_contact_question')?></h5>

    <p><?php echo __('CON_contact_condition')?></p>
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?> 
    <form id="contactform" action="<?php echo site_url('home/contact/send_contact')?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('name');?> 
            <label for="name"><?php echo __('CF_yr_name')?></label>
            <input class="short" name="name" id="name" />

        </p>

        <p>
            <?php echo form_error('email');?>  
            <label for="email"><?php echo __('CF_yr_email')?></label>
            <input class="short" name="email" id="email" />

        </p>

        <p>
            <?php echo form_error('message');?>  						
            <label for="message"><?php echo __('CF_yr_mes')?></label>
            <textarea name="message" id="message" rows="8" cols=""></textarea>					
        </p>

        <p>						
            <input name="submit" type="submit" class="submit" value="<?php echo __('CF_send')?>" />
            <input name="" type="reset" class="reset" value="<?php echo __('CF_reset')?>" />						
        </p>

    </form>	


			</div>		