		
				<div class="content_item">
				<?php foreach($query as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['username'];
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
							<input name="btnedit" type="submit" class="submit" value="<?php echo __("CF_edit")?>" />
							</form>
							<form id="contactform" action="<?php echo site_url('event/delete_event_admin'.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
							<input name="btndelete" type="submit" class="submit" value="<?php echo __("CF_del")?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>')" />
						
						</p>
					
					</form>
		  </div>            
		
