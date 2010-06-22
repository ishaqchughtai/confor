      <?php if(!$events):?>
      <p class="not_warning "><span class="img"></span>There are no results for your search.<span class="close"></span></p>
      <?php else:?>
      <div class="content_item">
        <?php foreach($events as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['Name'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = explode(" ", $row['Keywords']);
					$description = $row['Description'];
					?>
        <div class="content_item">
          <h3><a href="<?php echo site_url('event/event_content/'.$id)?>"><?php echo $title?></a></h3>
          <h5>By <?php echo $speaker?> in : 
          <?php for($i=0;$i<count($keyword);$i++){?>
          <a href="#"><?php echo $keyword[$i]?></a>
          <?php if ($i<count($keyword)-1) echo ','?>
          <?php ;}?>
          
           // <?php echo $date;?></h5>
          <p> <?php echo _substr($description,200)?></p>
          <a href="<?php echo site_url('event/event_content/'.$id)?>" class="read_more">Continue Reading</a> </div>
        <?php
				}
				?>
        
      </div>
	  <?php endif?>
	  
      <ul id="pagination">
				
		<?php echo $pagination?>		
				
	  </ul>