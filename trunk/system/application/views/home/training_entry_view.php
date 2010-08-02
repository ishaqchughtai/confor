<div class="content_item">
    <?php
        foreach ($query as $row)
        {
            $id          = $row['ID'];
            $date        =$row['Date'];
            $final_date  =date("d-m-Y", strtotime($date));
            $title       =$row['Title'];
            $content     =$row['Content'];
            $image = $row['Image'];     
        ?>
        <h3><a href="#"><?php echo $title?></a></h3>
        <h5><?php echo $final_date ?></h5>
                <div>
            <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$image?>" alt="XemmeX" width="130" height="130" class="alignleft" />  
        </div>
        <p><?php echo $content ?></p>
        <?php }?>
      </div>   
