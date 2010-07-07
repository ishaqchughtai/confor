<?php require 'SimpleRatings/rSystem.php';  ?>
				<?php foreach($your_vid as $rows):?>			  
			    <?php $keyword = explode(" ", $rows['tags']);?>
                <?php $speaker_id = $rows['mem_id']?>
                <?php $vid_id = $rows['vid_id']?>
				<div class="content_item">
				
					<h3><a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>
					
					<h5>By <?php echo $rows['username']?> in : 
                    
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
                      
                     // <?php echo mdate('%F %j%S %Y', $rows['date'])?></h5>
					
					 <div class="rate_balloon"><?php $SimpleRatings->create($vid_id);?>  
        </div>
					
					<p>
					<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="202" height="90" alt="" class="alignleft" /></a>
					</p>
					
					<p>
					<?php echo _substr($rows['description'],200);?>
					</p>
					
					<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>" class="read_more">View</a>
				
                <div id="left">
        <!-- /.content_item -->
        <?php
			if ($this->session->userdata('speaker_id')==$speaker_id):			
		?>
        <p>
        <form id="contactform" action="<?php echo site_url('video/edit_video_conference'.'/'.$speaker_id.'/'.$rows['vid_id'])?>" method="post" enctype="multipart/form-data" class="global">          
		  <input name="btnedit" type="submit" class="submit" value="Edit" />
        </form>
        <form id="contactform" action="<?php echo site_url('video/delete_video_conference'.'/'.$speaker_id.'/'.$rows['vid_id'])?>" method="post" enctype="multipart/form-data" class="global">
          <input name="btndelete" type="submit" class="submit" value="Delete" onclick="return confirm('<?php echo __("CF_mess_delete")?>')" />
        </form>
        </p>
        <?php else:?>
        <?php endif;?>
      </div>
                	
				</div>		  
				
                
				<?php endforeach?>
				
			
            
				<ul id="pagination">
				
					<?php echo $pagination?>		
				
				</ul>				