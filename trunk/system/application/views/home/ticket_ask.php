<div class="content_item">

    <h3><?php echo __('CF_ticket_title');?></h3>

    <h5><?php echo __('CF_ticket_question');?></h5>

    <p><?php echo __('CF_ticket_condition');?></p>
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?> 
    <form id="contactform" action="<?php echo site_url("ticket/send_ticket_by_speaker_ask")?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('title');?>
            <label for="title"><?php echo __('CF_title')?></label>
            <input class="short" name="title" id="title" />

        </p>

        <p>
            <?php echo form_error('Status');?>
            <label for="Status"><?php echo __('CF_ticket_status')?></label>
            <input name="status_temp" id="status_temp" value="<?php echo __("CF_ticket_ask")?>" readonly="TRUE">
            <input name="status" id="status" value="3" readonly="TRUE" class="hidden">
        </p>

        <p>    
            <?php echo form_error('message');?>                    
            <label for="message"><?php echo __('CF_yr_mes')?>:</label>
            <textarea name="message" id="message" rows="8" cols="" ></textarea>                    
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="<?php echo __("CF_send")?>" />
            <input name="" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />                        
        </p>

    </form>    


            </div>        
