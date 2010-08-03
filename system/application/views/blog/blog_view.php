<?php $page = 5;?> 
<?php
    foreach ($query_most_blog as $row)
    {
        $id          = $row['ID'];
        $link        =$row['Link'];
        $title       =$row['Title'];
        $subject     =$row['Subject'];
        $keywords    =$row['Keywords'];
        $text        =$row['Text'];
        $CountView   =$row['CountView'];
        $author      =$row['Name'];
        $date        =$row['Date'];
        $countcomment=$row['CountComment'];
        $is_admin = $this->session->userdata('admin');
    ?>
    <div class = "content_item">
    <?php if($is_admin):?>
        <h3><a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title);?>"><?php echo $title; ?></a></h3> 
        <h5><?php echo $subject; ?></h5>
        <a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title)?>#comments" class = "comments_balloon"><?php echo $countcomment; ?></a>

        <p>
            <img src = "<?php echo base_url().'assets/uploads/image/'.$link ?>" width = "610" height = "169" alt = "Confor.ca"/>
        </p>

        <p><?php echo word_limiter(strip_tags($text), 100); ?></p>

        <a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title);?>" class = "read_more">
            <?php echo __("CF_continue"); ?>
        </a>
    <?php else:?>
        <h3><a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title);?>"><?php echo $title; ?></a></h3> 
        <h5><?php echo $subject; ?></h5>
        <a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title)?>#comments" class = "comments_balloon"><?php echo $countcomment; ?></a>

        <p>
            <img src = "<?php echo base_url().'assets/uploads/image/'.$link ?>" width = "610" height = "169" alt = "Confor.ca"/>
        </p>

        <p><?php echo word_limiter(strip_tags($text), 100); ?></p>

        <a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title);?>" class = "read_more">
            <?php echo __("CF_continue"); ?>
        </a>    
    <?php endif;?> 
    </div>
    <?php
    }
?>

<!-- /.content_item -->

<?php
    foreach ($query as $row)
    {
        $id          = $row['ID'];
        $link        =$row['Link'];
        $title       =$row['Title'];
        $subject     =$row['Subject'];
        $keywords    =$row['Keywords'];
        $key         =explode(" ", $keywords);
        $text        =$row['Text'];
        $CountView   =$row['CountView'];
        $author      =$row['Name'];
        $date        =$row['Date'];
        $final_date  =date("d-m-Y", strtotime($date));
        $countcomment=$row['CountComment'];
    ?>

    <div class = "content_item">
    <?php if($is_admin):?>
        <h3><a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>"><?php echo $title ?></a></h3>
    <?php else:?>
        <h3><a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>"><?php echo $title ?></a></h3>
    <?php endif;?>
        <h5><?php echo __("CF_by") ?> <?php echo $author ?> <?php echo __("CF_in") ?> : 
            <?php
                for ($i=0; $i < count($key); $i++)
                {
                ?>
                <a href = "<?php echo site_url('blog_frontend/search_keyword').'/'.$key[$i].'/'.$page?>"><?php echo $key[$i] ?></a>
                <?php
                    if ($i < count($key) - 1)
                        echo ',';
                }
            ?>
            // <?php echo $final_date ?> 
        </h5>
        <?php if($is_admin):?>
            <a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title)?>#comments" class = "comments_balloon"><?php echo $countcomment ?></a>
        <?php else:?>
            <a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title)?>#comments" class = "comments_balloon"><?php echo $countcomment ?></a>
        <?php endif;?>
        <p>
            <img src = "<?php echo base_url().'assets/uploads/image/'.$link ?>" width = "202" height = "90" alt = "Confor.ca" class = "alignleft"/>
        </p>

        <p>
            <?php echo word_limiter(strip_tags($text), 100); ?>
        </p>    
        <?php if($is_admin):?> 
            <a href = "<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class = "read_more"><?php echo __("CF_continue") ?></a>
        <?php else:?>
            <a href = "<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class = "read_more"><?php echo __("CF_continue") ?></a>
        <?php endif;?>
    </div>

    <?php
    }
?>
<!-- /.content_item -->

<ul id = "pagination">
    <li><?php echo $pagination ?></li>
</ul>
<!-- /#pagination -->