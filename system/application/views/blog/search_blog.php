<div id="left">
      <?php if(isset($error)):?>
      <p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
      <?php else:?>
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
                                $date = $row['Date'] ;
                                $final_date=date("F jS Y", strtotime($date));
                                $countcomment = $row['CountComment'];      
                            ?>
      <div class="content_item">
        <?php if($this->session->userdata('admin')==TRUE):?>
        <h3><a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>"><?php echo $title ?></a></h3>
        <h5>By <?php echo $author ?> in :
          <?php for($i=0;$i<count($key);$i++){?>
          <a href="#"><?php echo $key[$i]?></a>,
          <?php ;}?>
          // <?php echo $final_date ?></h5>
        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title)?>#comments" class="comments_balloon"><?php echo $countcomment ?></a>
        <p><img src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="202" height="90" alt="Confor.ca" class="alignleft" /></p>
        <?php echo _substr($text,200)?><br/>
        <br/>
        <a href="<?php echo site_url('blog/blog_content_admin/'.$author.'/'.$title); ?>" class="read_more">Continue Reading</a> </div>
      <?php else:?>
      <h3><a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>"><?php echo $title ?></a></h3>
      <h5>By <?php echo $author ?> in :
        <?php for($i=0;$i<count($key);$i++){?>
        <a href="#"><?php echo $key[$i]?></a>,
        <?php ;}?>
        // <?php echo $final_date ?></h5>
      <a href="<?php echo site_url('blog/blog_content/'.$title)?>#comments" class="comments_balloon"><?php echo $countcomment ?></a>
      <p><img src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="202" height="90" alt="Confor.ca" class="alignleft" /></p>
      <?php echo _substr($text,200)?><br/>
      <br/>
      <a href="<?php echo site_url('blog/blog_content/'.$author.'/'.$title); ?>" class="read_more">Continue Reading</a> </div>
    <?php endif;?>
    <?php }?>
    <!-- /.content_item -->
    <ul id="pagination">
      <li class="selected"><?php echo $pagination?></li>
    </ul>
    <!-- /#pagination -->
    <?php endif?>
  </div>  