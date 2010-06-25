				<div class="content_item">
				<?php foreach($query as $row)
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
				
					<h3><a href="<?php echo site_url('event/event_content_admin/'.$id)?>"><?php echo $title?></a></h3>
					<h5>By <?php echo $speaker?> in : 
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
                    
                     // <?php echo $date;?></h5>
					<p> <?php echo _substr($description,200)?></p>
					
					<a href="<?php echo site_url('event/event_content_admin/'.$id)?>" class="read_more">Continue Reading</a>
					
				</div>
					<?php
				}
				?>
				</div>
			  <div id="left">
			  <!-- /.content_item -->
			  </div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
<ul id="pagination">
				
					<li class="selected"><?php echo $pagination?></li>
				
			  </ul>
				<!-- /#pagination -->
				