      <?php $page = 5;?>
	  <?php if(!$events):?>
      <p class="not_warning "><span class="img"></span><?php echo __("CF_mess_no_search")?><span class="close"></span></p>
      <?php else:?>
      <div class="content_item">
        <?php foreach($events as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['first_name'].' '.$row['name'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = explode(" ", $row['Keywords']);
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><a href="<?php echo site_url('event/event_content/'.$id)?>"><?php echo $title?></a></h3>
          <h5><?php echo $subject ?></h5>
          <h5><?php echo __("CF_by")?> <?php echo $speaker?> <?php echo __("CF_in")?> : 
          <?php for($i=0;$i<count($keyword);$i++){?>
          <a href="<?php echo site_url('event/search_keyword').'/'.$keyword[$i].'/'.$page?>"><?php echo $keyword[$i]?></a>
          <?php if ($i<count($keyword)-1) echo ','?>
          <?php ;}?>
          
           // <?php echo $date;?></h5>
          <p> <?php echo _substr($description,200)?></p>
          <a href="<?php echo site_url('event/event_content/'.$id)?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
        <?php
				}
				?>
        
      </div>
	  <?php endif?>
	  
      <ul id="pagination">
				
		<?php echo $pagination?>		
				
	  </ul>