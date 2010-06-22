<div class="content_item">
<?php
    foreach($query as $row){                               
        $id = $row['ID'];
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
            $Status_text='Normal'; 
        }elseif($Status==1)
        {
            $Status_text='Urgent';    
        }elseif($Status==2)
        {
            $Status_text='Critical';    
        }elseif($Status==3)
        {
            $Status_text='Ask for a cameraman team';    
        }      
    ?>
    <h3>Title :<?php echo $title?></h3>

    <h4>By : <?php echo $author?></h5>

    <h5>Status : <?php echo $Status_text?></h5>
    <p>Message :<?php echo $text?></p>
    <a href="<?php echo site_url('ticket/delete_ticket'.'/'.$id)?> "onclick="return confirm('Do you really wish to delete?')"  ><b>Delete Ticket</b></a>
    <?php }?>
</div>    
<div class="content_item">
    <form id="contactform" action="<?php echo site_url("ticket/send_ticket_by_admin"."/".$id)?>" method="post" enctype="multipart/form-data" class="global">

        <p>
            <?php echo form_error('title');?>
            <label for="title">Title:</label>
            <input class="short" name="title" id="title" />

        </p>                       
        <p>    
            <?php echo form_error('message');?>                    
            <label for="message">Your message:</label>
            <textarea name="message" id="message" rows="8" cols="" ></textarea>                    
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="Send" />
            <input name="" type="reset" class="reset" value="Reset" />                        
        </p>

    </form>    
</div>

        