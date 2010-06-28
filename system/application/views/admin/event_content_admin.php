		
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
				
					<h3><?php echo $title?></h3>
                    <h5><?php echo $subject ?></h5>
					<h5>By <?php echo $speaker?> in : 
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
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
						
						<p>
						<form id="contactform" action="<?php echo site_url('event/get_event_admin'.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
							<input name="btnedit" type="submit" class="submit" value="Edit" />
							</form>
							<form id="contactform" action="<?php echo site_url('event/delete_event_admin'.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
							<input name="btndelete" type="submit" class="submit" value="Delete" onclick="return confirm('Do you really wish to delete?')" />
						
						</p>
					
					</form>
		  </div>            
		
