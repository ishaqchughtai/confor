<div class="content_item">
    <?php
        $idtemp =0;
        $titletemp = '';
        $linktemp = '';
        $countcommenttemp=0;
        $authortemp = '';
        foreach($query as $row){                               
            $id = $row['ID'];
            $idtemp = $id;
            $link = $row['Link'];
            $linktemp = $link;
            $title = $row['Title'];
            $titletemp = $title;
            $subject = $row['Subject'];
            $text = $row['Text'];
            $CountView = $row['CountView'];                           
            $author = $row['Name'];
            $authortemp = $author;
            $date = $row['Date'];
            $countcomment = $row['CountComment'] ;
            $about = $row['About'];
            $countcommenttemp = $countcomment;      
        ?>
        <h3><a href="#"><?php echo $title ?></a></h3>
        <h5><?php echo $subject ?></h5>
        <a href="#comments" class="comments_balloon"><?php echo $countcommenttemp?></a>
        <p><img src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="610" height="169" alt="Confor.ca" /></p>
        <p><?php echo $text ?></p>
    </div>
    <!-- /.content_item -->
    <div class="content_item">
        <h3><?php echo __("CF_about_au")?>:</h3>
        <div class="about_author"> <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$linktemp?>" width="80" height="80" alt="XemmeX" class="alignleft" />
            <?php
                foreach($query_show_author as $row)
                {
                    $written = $row['written'];

                ?>
                <p><a href="#" class="author_link"><?php echo $author?></a> <?php echo __("CF_has_written")?> <?php echo $written?> <?php echo __("CF_articles_for")?> Confor.ca.</p>
            <?php echo $about?> </div>
            <?php }?>
    </div>
    <?php }?>
<!-- /.content_item -->
<div id="comments" class="content_item">
    <h3><?php echo $countcommenttemp?> <?php echo __("CF_for_comments")?> "<a href="#"><?php echo $titletemp?></a>"</h3>
    <!-- Content -->
    <form >
        <?php foreach($query_show_comment as $row){                               
                $id = $row['ID'];
                $comment = $row['Comment'];                       
                $author = $row['Author'];
                $date = $row['Date'];
                $final_date=date("F jS Y", strtotime($date));
                $final_time=date("h:i a",strtotime($date));                                    
                $site = $row['Website'];
                $email = $row['Email'];
                $status = $row['Status'];
                $blog =$row['Blog'];      
            ?>
            <ol>
                <li> <img src="<?php echo base_url().'assets/uploads/image/thumb_'.$linktemp?>" alt="XemmeX" width="80" height="80" class="comment_image" />
                    <!-- Author Image -->
                    <p class="content" style="width:500px"> <a href="<?php echo $site?>" class="author"target="_blank"><?php echo $author?></a>
                        <!-- Author -->
                        <span class="date"><?php echo $final_date?></span>
                        <!-- Date -->
                        <span class="time"><?php echo $final_time?></span>
                        <!-- Time -->
                        <a href="#comment" class="reply"><?php echo __("CF_replay")?></a>
                        <!-- Reply Link -->
                        <br />
                        <br />
                        <!-- BreakLine -->
                        <?php echo $comment?> 
                    </p><?php if($status==1){?>
                    <p style="width:10px">&nbsp;</p>
                    <?php }else{?>
                    <p ><a href="<?php echo site_url('blog/comment_not_agree')?>" target="_blank" ><label><h4 style="color: red"><?php echo __("CF_approved").'&nbsp;?' ?></h4></label></a></p>    
                    <?php }?>
                    <!-- Content -->
                 </li>
                <!-- /#comments ol li -->
            </ol>
            <!-- /#comments ol -->
            <?php }?>
    </form>
</div>
<!-- /#comments -->
<div class="content_item" id="comment">
    <h3><?php echo __("CF_leave_cm")?></h3>
    <form action="<?php echo site_url("blog_frontend/add_comment")?>" method="post">
        <p>
            <label>
                <input type="hidden" name="blog" value="<?php echo $idtemp?>" />
                <input type="hidden" name="title" value="<?php echo $titletemp?>" />
                <input type="hidden" name="countcommenttemp" value="<?php echo $countcommenttemp?>" />
                <input type="hidden" name="authortemp" value="<?php echo $authortemp?>" />
            </label>
            <label for="name"><?php echo __("CF_name")?>*:</label>
            <input type="text" class="short" id="name" name="name" value="<?php if(isset($_POST['name'])){ echo $_POST['name'] ;}?>"/>
        <?php echo form_error('name'); ?> </p>
        <p>
            <label for="email"><?php echo __("CF_email")?>*: <em><?php echo __("CF_not_pub")?></em></label>
            <input type="text" class="short" id="email" name="email" value="<?php if(isset($_POST['email'])){ echo $_POST['email'] ;}?>" />
        <?php echo form_error('email'); ?> </p>
        <p>
            <label for="url"><?php echo __("CF_site_web")?>:</label>
            <input type="text" class="short" id="url" name="url" value="<?php if(isset($_POST['url'])){ echo $_POST['url'] ;}?>"/>
        <?php echo form_error('url'); ?> </p>
        <p>

            <label for="msg"><?php echo __("CF_mess")?>*:</label>
            <?php
                if ( ! isset($_POST['msg']))
                {
                    $something = FALSE;
                }
                else
                {
                    $something = $_POST['msg'];
                }
                $data = array('name' => 'msg',
                'id' => 'msg',
                'width' => '600',
                'height' => '400',
                'value'=>$something);
                echo form_textarea($data);
                 echo form_error('msg'); ?> </p>
        <p> <label>* <?php echo __("CF_comment_notifying_message")?>. </label>  </p> 
        <p>
            <input type="submit" class="submit" value="<?php echo __("CF_submit")?>" name="submit" />
        </p>
    </form>
      </div>
      <!-- /#comment -->    
