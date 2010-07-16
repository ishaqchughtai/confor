<div class="content_item">
    <?php
        foreach ($query as $row)
        {
            $id          = $row['ID'];
            $date        =$row['Date'];
            $final_date  =date("F jS Y", strtotime($date));
            $title       =$row['Title'];
            $content     =$row['Content'];     
        ?>
        <h3><a href="#"><?php echo $title?></a></h3>
        <h5><?php echo $final_date ?></h5>
        <p><?php echo $content ?></p>
        <?php }?>
      </div>   
