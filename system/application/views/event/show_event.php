<?php $page = 5;?>
<div class="content_item">			
<?php if($events):?>
<?php foreach($events as $row)
   				{
					$id = $row['ID'];
					$speaker = $row['username'];
					$date = date("F jS Y", strtotime($row['Date']));
					$title = $row['Title'];
					$subject = $row['Subject'];
					$keyword = explode(" ", $row['Keywords']);
					$description = $row['Description'];
					$status = $row['Status'];
					?>
					
					
					<?php if($status):?>
					<div class="content_item">
						<h3><a href="<?php echo site_url('event/event_content/'.$id)?>"><?php echo $title?></a></h3>
                        <h5><?php echo $subject ?></h5>
					<?php
					    //$date = "%F %j%S %Y";
						//$time = time();
					?>
					<h5><?php echo __("CF_by")?> <?php echo $speaker?> <?php echo __("CF_in")?> : 
					<?php for($i=0;$i<count($keyword);$i++){?>
          <a href="<?php echo site_url('event/search_keyword').'/'.$keyword[$i].'/'.$page?>"><?php echo $keyword[$i]?></a>
          <?php if ($i<count($keyword)-1) echo ','?>
          <?php ;}?> // 
		  			<?php echo $date;?></h5>
					<p> <?php echo _substr($description,200)?></p>
					
					<a href="<?php echo site_url('event/event_content/'.$id)?>" class="read_more"><?php echo __("CF_continue")?></a>
					</div>	
					<?php else:?>
					<?php endif;?>
					<?php
				}
				?>
<?php else:?>
<p class="not_warning "><span class="img"></span><?php echo __("CF_mess_no_event")?><span class="close"></span></p>
<?php endif;?>
				
				</div>
			  <div id="left">
			  <!-- /.content_item -->
					<form id="contactform" action="<?php echo site_url('event/add')?>" method="post" enctype="multipart/form-data" class="global">	
					
					
			<?php
			if ($this->session->userdata('speaker_id')):?>
			<p>
						
				<input name="btnadd" type="submit" class="submit" value="<?php echo __("CF_add_new")?>" />
						
			</p>
			
			<?php else:?>
			<?php endif;?>			
					</form>
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

