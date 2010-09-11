      <?php $page = 5;?>
	  <?php if(!$events):?>
      <p class="not_warning "><span class="img"></span><?php echo __("CF_mess_no_search")?><span class="close"></span></p>
      <?php else:?>
       <div class="content_item">
            <h3><?php echo __("CF_Search_results").'"'.$Title_search.'"'?></h3>
        </div>
      <div class="content_item">
        <?php foreach($events as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['first_name'].' '.$row['name'];
					$date = date("d-m-Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = explode(" ", $row['Keywords']);
					$description = $row['Description'];
					$status = $row['Status'];
					?>
                    <?php if($status==1):?>
        <div class="content_item">
          <h3><a alt="<?php echo $title.' - confor.tv'?>" title="<?php echo $title.' - confor.tv'?>" href="<?php echo site_url('event_frontend/event_content/'.$id)?>"><?php echo $title?></a></h3>
          <h5><?php echo $subject ?></h5>
          <h5><?php echo __("CF_by")?> <?php echo $speaker?> <?php echo __("CF_in")?> : 
          <?php for($i=0;$i<count($keyword);$i++){?>
          <a alt="<?php echo $keyword[$i]?>" title="<?php echo $keyword[$i]?>" href="<?php echo site_url('event_frontend/search_keyword').'/'.$keyword[$i].'/'.$page?>"><?php echo $keyword[$i]?></a>
          <?php if ($i<count($keyword)-1) echo ','?>
          <?php ;}?>
          
           // <?php echo $date;?></h5>
          <p> <?php echo _substr($description,200)?></p>
          <a alt="<?php echo __("CF_continue").' - confor.tv'?>" title="<?php echo __("CF_continue").' - confor.tv'?>" href="<?php echo site_url('event_frontend/event_content/'.$id)?>" class="read_more"><?php echo __("CF_continue")?></a> </div>
          <?php else:?>
					<?php endif;?>
        <?php
				}
				?>
        
      </div>
	  <?php endif?>
	  
      <ul id="pagination">
				
		<?php echo $pagination?>		
				
	  </ul>