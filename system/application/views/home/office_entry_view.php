<div class="content_item">
    <?php
        foreach ($query as $row)
        {
            $id          = $row['id'];
            $date        =$row['date'];
            $final_date  =date("F jS Y", strtotime($date));
            $title       =$row['title'];
            $content     =$row['content'];
            $image = $row['Image'];      
        ?>
        <h3><a href="#" title="<?php echo $title.' - Confor.tv'?>"><?php echo $title?></a></h3>
        <h5><?php echo $final_date ?></h5>
        <div>
            <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$image?>" title="<?php echo $title.' - Confor.tv'?>" alt="<?php echo $title.' - Confor.tv'?>" width="130" height="130" class="alignleft" />  
        </div>
        <p><?php echo $content ?></p>
        <?php }?>
      </div>   
