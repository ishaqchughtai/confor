<?php
    $is_admin = $this->session->userdata('admin');
?>
<ul id="popular_posts">

    <li>

        <ul class="popular_posts_content">

            <?php
                $total = (count($bill)-1>3)?3:count($bill)-1;
                for($i=0;$i<=$total;$i++){
                    $row = $bill[$i];                               
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['FirstName'];                               
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Billets Populaires" class="alignleft" />

                        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Billets Populaires" class="alignleft" />

                        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php endif;?>
                </li>
                <?php }?>
            <!-- /.popular_posts_content li -->                                   
        </ul>
        <!-- /.popular_posts_content -->

    </li>
    <!-- /.popular_posts li - popular posts slider item -->

    <li>

        <ul class="popular_posts_content">
            <?php
                $total = (count($bill)-1>7)?7:count($bill)-1;
                for($i=4;$i<=$total;$i++){
                    $row = $bill[$i];                               
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['FirstName'];                                
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Billets Populaires" class="alignleft" />

                        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Billets Populaires" class="alignleft" />

                        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php endif;?>
                </li>
                <?php }?>
            <!-- /.popular_posts_content li -->
        </ul>
        <!-- /.popular_posts_content -->

    </li>
    <!-- /.popular_posts li - popular posts slider item -->

                        </ul>
