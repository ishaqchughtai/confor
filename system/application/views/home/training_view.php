<?php
    foreach ($query as $row)
    {
        $id          = $row['ID'];
        $date        =$row['Date'];
        $final_date  =date("F jS Y", strtotime($date));
        $title       =$row['Title'];
        $content     =$row['Content'];
    ?>

    <div class = "content_item">
        <h3><a href = "#"><?php echo $title ?></a></h3>
        <h5> <?php echo $final_date ?></h5> 
        <p>
            <?php echo word_limiter(strip_tags($content), 100); ?>
        </p>    
        <a href = "<?php echo site_url('training_frontend/training_content').'/'.$title?>" class = "read_more"><?php echo __("CF_continue") ?></a>
    </div>

    <?php
    }
?>
<!-- /.content_item -->

<ul id = "pagination">
    <li><?php echo $pagination ?></li>
</ul>
<!-- /#pagination -->