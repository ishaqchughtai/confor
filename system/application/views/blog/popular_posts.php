<?php
    $is_admin = $this->session->userdata('admin');
?>
<ul id="popular_posts">

    <li>

        <ul class="popular_posts_content">

            <?php
                $total = (count($pop)-1>3)?3:count($pop)-1;  
                for($i=0;$i<=$total;$i++){
                    $row = $pop[$i];                               
                    $id = $row['ID'];
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['Name'];       
                    $id = $row['ID'];                                           
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
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
                $total = (count($pop)-1>7)?7:count($pop)-1; 
                for($i=4;$i<=$total;$i++){
                    $row = $pop[$i];                               
                    $id = $row['ID'];
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['Name'];                               
                    $id=$row['ID'];
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
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
                $total = (count($pop)-1>11)?11:count($pop)-1; 
                for($i=8;$i<=$total;$i++){
                    $row = $pop[$i];                               
                    $id = $row['ID'];
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['Name'];                               
                    $id=$row['ID'];
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
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
                $total = (count($pop)-1>15)?15:count($pop)-1; 
                for($i=12;$i<=$total;$i++){
                    $row = $pop[$i];                               
                    $id = $row['ID'];
                    $link = $row['Link'];
                    $title = $row['Title'];
                    $CountView = $row['CountView'];
                    $countcomment = $row['CountComment'];
                    $author = $row['Name'];                               
                    $id=$row['ID'];
                ?>
                <li>
                    <?php if($is_admin):?>                                
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php else:?>
                        <img alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" src="<?php echo base_url().'assets/uploads/image/thumb_'.$link?>" width="60" height="60" alt="Popular Post" class="alignleft" />

                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class="title"><?php echo $title?></a>
                        <a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>#comments"><?php echo $countcomment?> <?php echo __("CF_cm")?></a>
                        <?php endif;?>
                </li>
                <?php }?>
            <!-- /.popular_posts_content li -->
        </ul>
        <!-- /.popular_posts_content -->

    </li> 
    <!-- /.popular_posts li - popular posts slider item -->

</ul>
