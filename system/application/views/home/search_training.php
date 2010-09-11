<?php if($training_search):?>
<div class="content_item">
            <h3><?php echo __("CF_Search_results").'"'.$keywords.'"'?></h3>
        </div>
<?php
    foreach ($training as $row)
    {
        $id          = $row['ID'];
        $date        =$row['Date'];
        $final_date  =date('d-m-Y', strtotime($date));
        $title       =$row['Title'];
        $content     =$row['Content'];
        $image = $row['Image']; 
    ?>

    <div class = "content_item">
        <h3><a title="<?php echo $title?>" alt="<?php echo $title?>" href = "<?php echo site_url('training_frontend/training_content/'.$id.'/'.$title)?>"><?php echo $title ?></a></h3>
        <h5> <?php echo $final_date ?></h5> 
                <div>
            <img title="<?php echo $title?>" alt="<?php echo $title?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$image?>" alt="XemmeX" width="130" height="130" class="alignleft" />  
        </div>
        <br/>
        <p>
            <?php echo word_limiter(strip_tags($content), 100); ?>
        </p>    
        <a title="<?php echo __("CF_continue").' : '.$title?>" alt="<?php echo $title?>" href = "<?php echo site_url('training_frontend/training_content/'.$id.'/'.$title)?>" class = "read_more"><?php echo __("CF_continue") ?></a>
    </div>

    <?php
    }
?>
<?php else:?>
<p class="not_warning "><span class="img"></span><?php echo __("CF_mess_no_search")?><span class="close"></span></p>
<?php endif;?>
<!-- /.content_item -->

<ul id = "pagination">
    <li><?php echo $pagination ?></li>
</ul>
<!-- /#pagination -->