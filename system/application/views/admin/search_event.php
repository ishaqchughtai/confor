      <?php if(isset($error)):?>
      <p class="not_warning "><span class="img"></span><?php echo $error;?><span class="close"></span></p>
      <?php else:?>
      <div class="content_item">
        <?php foreach($query as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['Name'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = $row['Keywords'];
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><a href="<?php echo site_url('event/event_content_admin/'.$id)?>"><?php echo $title?></a></h3>
          <h5><?php echo __("CF_by")?> <?php echo $speaker?> <?php echo __("CF_in")?> : <a href="#"><?php echo $keyword?></a> // <?php echo $date;?></h5>
          <p> <?php echo _substr($description,200)?></p>
          <a href="<?php echo site_url('event/event_content_admin/'.$id)?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
        <?php
				}
				?>
        
      </div>
	  <?php endif?>
   