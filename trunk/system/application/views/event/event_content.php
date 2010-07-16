<?php $page = 10;?>
      <div class="content_item">
        <?php foreach($query as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['username'];
					$speaker_id = $row['Speaker'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = explode(" ", $row['Keywords']);
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><?php echo $title?></h3>
          <h5><?php echo $subject ?></h5>
          <h5><?php echo __("CF_by")?> <?php echo $speaker?> <?php echo __("CF_in")?> : 
          <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="<?php echo site_url('event_frontend/search_keyword').'/'.$keyword[$i].'/'.$page?>"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
           // <?php echo $date;?></h5>
          <p> <?php echo $description?></p>
        </div>
        <?php
				}
				?>
      </div>
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /#pagination -->
      <div id="left">
        <!-- /.content_item -->
      </div>    
    <!-- /#content #left - left side of main content -->

