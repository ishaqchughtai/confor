      <div class="content_item">
        <?php foreach($your_event as $row)
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
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
           // <?php echo $date;?></h5>
          <p> <?php echo $description?></p>
          
          <div id="left">
        <!-- /.content_item -->
        <?php
			if ($this->session->userdata('speaker_id')==$speaker_id):			
		?>
        <p>
        <form id="contactform" action="<?php echo site_url('event/get_event'.'/'.$speaker_id.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">          
		  <input name="btnedit" type="submit" class="submit" value="<?php echo __("CF_edit")?>" />
        </form>
        <form id="contactform" action="<?php echo site_url('event/delete_event'.'/'.$speaker_id.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
          <input name="btndelete" type="submit" class="submit" value="<?php echo __("CF_del")?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>')" />
        </form>
        </p>
        <?php else:?>
        <?php endif;?>
      </div> 
        </div>
        <?php
				}
				?>
                
                
                
      </div>
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /.content_item -->
      <!-- /#pagination -->
         <ul id="pagination">
				
					<?php echo $pagination?>		
				
				</ul>
    <!-- /#content #left - left side of main content -->
