<!-- /.content_item -->
<div id="header_info">
    <div class="left">
<a href="<?php echo site_url('ticket/open_tickets')?>">Open Tickets <?php echo '('.$query_count_record_open.')'?></a> // <a href="<?php echo site_url('ticket/closed_tickets')?>">Closed Tickets <?php echo '('.$query_count_record_closed.')'?></a>           
    </div>
</div>
<?php                     
    foreach($open_tickets as $row){                               
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
    <div class="content_item">
        <h3><a href="<?php echo site_url('ticket/ticket_content/'.$id); ?>"><?php echo $title ?><img src="<?php echo $Answer?>" alt=""></img></a></h3>
        <h5><?php echo __("CF_by")?> <?php echo $author ?> // <?php echo __("CF_date")?> :<?php echo  $final_date?> // <?php echo __("CF_status")?> :<?php echo $Status_text?>
        </h5>
        <?php echo $text?><br/>
        <br/>
    <a href="<?php echo site_url('ticket/ticket_content/'.$id); ?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
    <?php }?>
<!-- /.content_item -->
<ul id="pagination">
    <li><?php echo $pagination?></li>
      </ul>
      <!-- /#pagination -->
