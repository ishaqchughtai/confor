<div class="content_item">
<?php
    $idTicket = 0;
    foreach($query as $row){                               
        $id = $row['ID'];
        $idTicket = $id;
        $title = $row['Title'];
        $text = $row['Message'];                               
        $author = $row['Name'];
        $date = $row['Date'];
        $Status = $row['Status'];
        $Email = $row['Email'];
        $Is_answered = $row['Is_answered'];
        $final_date=date("F jS Y", strtotime($date));
        if($Is_answered==1)
        {
            $Answer =base_url().'/assets/img/not_success_img.gif'; 
        }else
        {
            $Answer =base_url().'/assets/img/new.gif';    
        }
        if($Status==0)
        {
            $Status_text= __("CF_Normal"); 
        }elseif($Status==1)
        {
            $Status_text=__("CF_Urgent");    
        }elseif($Status==2)
        {
            $Status_text=__("CF_Critical");    
        }elseif($Status==3)
        {
            $Status_text=__("CF_ask_camera");    
        }      
    ?>
    <h3><?php echo __("CF_title")?> :<?php echo $title?></h3>

    <h4><?php echo __("CF_by")?> : <?php echo $author?></h4>

    <h5><?php echo __("CF_status")?> : <?php echo $Status_text?></h5>
    <p><?php echo __("CF_mess")?> :<?php echo $text?></p>
    <?php }?>
</div>
<?php
    foreach($query_feedback as $row){                               
        $id = $row['ID'];
        $title = $row['Title'];
        $text = $row['Message'];                               
        $author = $row['Name'];
        $date = $row['Date'];
        $Email = $row['Email'];
        $final_date=date("F jS Y", strtotime($date));     
?>
<div class="content_item">

    <h3><?php echo __("CF_title")?> :<?php echo $title?></h3>
    <h4><?php echo __("CF_by")?> : <?php echo $author?></h4>
    <p><?php echo __("CF_mess")?> :<?php echo $text?></p>   
</div>
<?php }?>
<div class="content_item">
    <form id="contactform" action="<?php echo site_url("ticket/send_ticket_by_admin"."/".$idTicket)?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('title');?>
            <label for="title"><?php echo __("CF_title")?>:</label>
            <input class="short" name="title" id="title" />

        </p>                       
        <p>    
            <?php echo form_error('message');?>                    
            <label for="message"><?php echo __("CF_yr_mes")?>:</label>
            <textarea name="message" id="message" rows="8" cols="" ></textarea>                    
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="<?php echo __("CF_send")?>" />
            <input name="" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />                        
        </p>

    </form>    
</div>
