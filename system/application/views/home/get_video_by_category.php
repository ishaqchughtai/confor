				<?php foreach($video_cate as $rows):?>			  
			    <?php $keyword = explode(" ", $rows['tags']);?>
				<div class="content_item">
				
					<h3><a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>
					
					<h5>By <?php echo $rows['first_name'].' '.$rows['name']?> in : 
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>

                     // <?php echo mdate('%F %j%S %Y', $rows['date'])?></h5>
					
					<div class="rate_balloon"><img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements_grey.png" style="border:none" alt="rate" />
					<img src="images/rElements_grey.png" style="border:none" alt="rate" />
					</div>
					
					<p>
					<img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="202" height="90" alt="" class="alignleft" />
					</p>
					
					<p>
					<?php echo $rows['description'];?>
					</p>
					
					<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>" class="read_more">View</a>
					
				</div>		  
				
				<?php endforeach?>
				
			
				<ul id="pagination">
				
					<?php echo $pagination?>		
				
				</ul>				