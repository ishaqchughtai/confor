<?php if($office):?>
<?php
    foreach ($office as $row)
    {
        $id          = $row['id'];
        $date        =$row['date'];
        $final_date  =date('d-m-Y', strtotime($date));
        $title       =$row['title'];
        $content     =$row['content'];
        $image = $row['Image']; 
    ?>

    <div class = "content_item">
        <h3><a href = "<?php echo site_url('office_frontend/office_content/'.$id)?>"><?php echo $title ?></a></h3>
        <h5> <?php echo $final_date ?></h5> 
                <div>
            <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$image?>" alt="XemmeX" width="130" height="130" class="alignleft" />  
        </div>
        <br/>
        <p>
            <?php echo word_limiter(strip_tags($content), 100); ?>
        </p>    
        <a href = "<?php echo site_url('office_frontend/office_content/'.$id)?>" class = "read_more"><?php echo __("CF_continue") ?></a>
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