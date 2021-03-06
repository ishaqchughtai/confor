<?php $page = 5;?>
<div id="left">
      <?php if(isset($error)):?>
      <p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
      <?php else:?>
      <!-- /.content_item -->
      <div class="content_item">
            <h3><?php echo __("CF_Search_results").'"'.$Title_search.'"'?></h3>
        </div>
      <?php foreach($query as $row){                               
                                $id = $row['ID'];
                                $link = $row['Link'];
                                $title = $row['Title'];
                                $subject = $row['Subject'];
                                $keywords = $row['Keywords'];
                                $key = explode(" ", $keywords);
                                $text = $row['Text'];
                                $CountView = $row['CountView'];
                                $author_name = $row['FirstName'];
                                $author = $row['Name'];
                                $date = $row['Date'] ;
                                $final_date=date("d-m-Y", strtotime($date));
                                $countcomment = $row['CountComment'];      
                            ?>
      <div class="content_item">
        <?php if($this->session->userdata('admin')==TRUE):?>
        <h3><a alt="<?php echo $title?>" title="<?php echo $title?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>"><?php echo $title ?></a></h3>
        <h5><?php echo __("CF_by")?> <?php echo $author_name ?> <?php echo __("CF_in")?> :
          <?php for($i=0;$i<count($key);$i++){?>
          <a alt="<?php echo $key[$i]?>" title="<?php echo $key[$i]?>" href="<?php echo site_url('blog_frontend/search_keyword').'/'.$key[$i].'/'.$page?>"><?php echo $key[$i]?></a>
          <?php if ($i<count($key)-1) echo ','?>
          <?php ;}?>
          // <?php echo $final_date ?></h5>
        <p><img alt="<?php echo $title?>" title="<?php echo $title?>" src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="202" height="90" class="alignleft" /></p>
        <?php echo word_limiter(strip_tags($text), 100); ?><br/>
        <br/>
        <a alt="<?php echo __("CF_continue").' : '.$title?>" title="<?php echo __("CF_continue").' : '.$title?>" href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
      <?php else:?>
      <h3><a alt="<?php echo $title?>" title="<?php echo $title?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>"><?php echo $title ?></a></h3>
      <h5><?php echo __("CF_by")?> <?php echo $author_name ?> <?php echo __("CF_in")?> :
        <?php for($i=0;$i<count($key);$i++){?>
        <a alt="<?php echo $key[$i]?>" title="<?php echo $key[$i]?>" href="<?php echo site_url('blog_frontend/search_keyword').'/'.$key[$i].'/'.$page?>"><?php echo $key[$i]?></a>
        <?php if ($i<count($key)-1) echo ','?>
        <?php ;}?>
        // <?php echo $final_date ?></h5>
      <p><img alt="<?php echo $title?>" title="<?php echo $title?>" src="<?php echo base_url().'assets/uploads/image/'.$link ?>" width="202" height="90" class="alignleft" /></p>
      <?php echo word_limiter(strip_tags($text), 100); ?><br/>
      <br/>
      <a alt="<?php echo __("CF_continue").' : '.$title?>" title="<?php echo __("CF_continue").' : '.$title?>" href="<?php echo site_url('blog_frontend/blog_content/'.$author.'/'.$id.'/'.$title); ?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
    <?php endif;?>
    <?php }?>
    <!-- /.content_item -->
    <ul id="pagination">
                    <li>
                    <?php echo $pagination?>
                    
                    </li>
              </ul>
    <!-- /#pagination -->
    <?php endif?>
  </div>  