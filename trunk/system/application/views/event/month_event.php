<?php $page = 5;?>
<div class="content_item">			
<?php if($month_events):?>
<?php foreach($month_events as $row)
   				{
					$id = $row['ID'];
					$title = $row['Title'];
					$status = $row['Status'];
					?>
					
					
					<?php if($status==1):?>
					
						<li><h5><a href="<?php echo site_url('event_frontend/event_content/'.$id)?>"><?php echo $title?></a></h5></li>
						
					<?php else:?>
					<?php endif;?>
					<?php
				}
				?>
<?php else:?>
<p class="not_warning "><span class="img"></span><?php echo __("CF_mess_no_month_event")?><span class="close"></span></p>
<?php endif;?>
				
				</div>
			  <div id="left">
			  <!-- /.content_item -->
		  </div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
<ul id="pagination">
					<li>
                    
					<?php echo $pagination?>
                    
                    </li>
			  </ul>
				<!-- /#pagination -->

