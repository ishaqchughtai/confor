<div class="content_item">

    <h3><?php echo lang('CON_ticket_title');?></h3>

    <h5><?php echo lang('CON_ticket_question');?></h5>

    <p><?php echo lang('CON_ticket_condition');?></p>
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?> 
    <form id="contactform" action="<?php echo site_url("ticket/send_ticket_by_speaker")?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('title');?>
            <label for="title"><?php echo lang('CON_title')?></label>
            <input class="short" name="title" id="title" />

        </p>

        <p>
            <?php echo form_error('Status');?>
            <label for="Status"><?php echo lang('CON_Status')?></label>
            <select id="status" name="status" class="short">
                <option value="0" selected="selected" >Normal</option>
                <option value="1">Urgent</option>
                <option value="2">Critical</option>
                <option value="3">Ask for a cameraman team</option>
            </select>
        </p>

        <p>    
            <?php echo form_error('message');?>                    
            <label for="message"><?php echo lang('CON_your_meesage')?>:</label>
            <textarea name="message" id="message" rows="8" cols="" ></textarea>                    
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="Send" />
            <input name="" type="reset" class="reset" value="Reset" />                        
        </p>

    </form>    


            </div>        
