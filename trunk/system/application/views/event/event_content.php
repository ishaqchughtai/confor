      <div class="content_item">
        <?php foreach($query as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['Name'];
					$speaker_id = $row['Speaker'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = $row['Keywords'];
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><?php echo $title?></h3>
          <?php
					    //$date = "%F %j%S %Y";
						//$time = time();
					?>
          <h5>By <?php echo $speaker?> in : <a href="#"><?php echo $keyword?></a> // <?php echo $date;?></h5>
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
        <?php
			if ($this->session->userdata('speaker_id')==$speaker_id):			
		?>
        <p>
        <form id="contactform" action="<?php echo site_url('event/get_event'.'/'.$speaker_id.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">          
		  <input name="btnedit" type="submit" class="submit" value="Edit" />
        </form>
        <form id="contactform" action="<?php echo site_url('event/delete_event'.'/'.$speaker_id.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
          <input name="btndelete" type="submit" class="submit" value="Delete" onclick="return confirm('Do you really wish to delete?')" />
        </form>
        </p>
        <?php else:?>
        <?php endif;?>
      </div>    
    <!-- /#content #left - left side of main content -->

