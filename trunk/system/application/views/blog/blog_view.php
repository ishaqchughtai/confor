      <div class="content_item">
        <?php 
                            foreach($query_most_blog as $row) {
                                $id = $row['ID'];
                                $link = $row['Link'];
                                $title = $row['Title'];
                                $subject = $row['Subject'];
                                $keywords = $row['Keywords'];
                                $text = $row['Text'];
                                $CountView = $row['CountView'];                           
                                $author = $row['Name'];
                                $date = $row['Date'];
                                $countcomment = $row['CountComment'];
                            ?>
        <h3><a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView)?>" target="_blank"><?php echo $title?></a><a href="blog_entry.html"></a></h3>
        <h5><?php echo $subject?> <?php echo $CountView?></h5>
        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView)?>#comments" class="comments_balloon"><?php echo $countcomment ?></a>
        <p><img src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="610" height="169" alt="Confor.ca" /></p>
        <p><?php echo _substr($text,200)?></p>
        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView)?>" class="read_more">Continue Reading</a>
        <?php }?>
      </div>
      <!-- /.content_item -->
      <?php foreach($query as $row){                               
                            $id = $row['ID'];
                            $link = $row['Link'];
                            $title = $row['Title'];
                            $subject = $row['Subject'];
                            $keywords = $row['Keywords'];
                            $key = explode(" ", $keywords);
                            $text = $row['Text'];
                            $CountView = $row['CountView'];                           
                            $author = $row['Name'];
                            $date = $row['Date'];
                            $final_date=date("F jS Y", strtotime($date));
                            $countcomment = $row['CountComment'];
                        ?>
      <div class="content_item">
        <h3><a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView); ?>"><?php echo $title ?></a></h3>
        <h5>By <?php echo $author ?> in :
          <?php for($i=0;$i<count($key);$i++){?>
          <a href="#"><?php echo $key[$i]?></a>,
          <?php ;}?>
          //
          <?php
                                echo  $final_date?>
        </h5>
        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView)?>#comments" class="comments_balloon"><?php echo $countcomment ?></a>
        <p><img src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="202" height="90" alt="Confor.ca" class="alignleft" /></p>
        <?php echo _substr($text,200)?><br/>
        <br/>
        <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title.'/'.$CountView); ?>" class="read_more">Continue Reading</a> </div>
      <?php }?>
      <!-- /.content_item -->
      <ul id="pagination">
        <li><?php echo $pagination?></li>
      </ul>
      <!-- /#pagination -->
