<div class="content_item">
    <?php
        foreach ($query as $row)
        {
            $id          = $row['id'];
            $date        =$row['date'];
            $final_date  =date("F jS Y", strtotime($date));
            $title       =$row['title'];
            $content     =$row['content'];     
        ?>
        <h3><a href="#"><?php echo $title?></a></h3>
        <h5><?php echo $final_date ?></h5>
        <p><?php echo $content ?></p>
        <?php }?>
      </div>   
