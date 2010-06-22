<!-- /.content_item -->
<?php                     
    foreach($tickets as $row){                               
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
    <div class="content_item">
        <h3><a href="<?php echo site_url('ticket/ticket_content/'.$id); ?>"><?php echo $title ?><img src="<?php echo $Answer?>" alt=""></img></a></h3>
        <h5>By <?php echo $author ?> // Date :<?php echo  $final_date?> // Status :<?php echo $Status_text?>
        </h5>
        <?php echo $text?><br/>
        <br/>
    <a href="<?php echo site_url('ticket/ticket_content/'.$id); ?>" class="read_more">Continue Reading</a> </div>
    <?php }?>
<!-- /.content_item -->
<ul id="pagination">
    <li><?php echo $pagination?></li>
      </ul>
      <!-- /#pagination -->
