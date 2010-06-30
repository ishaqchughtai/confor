				<?php foreach($video_archives as $rows):?>
                <?php $keyword = explode(" ", $rows['Keywords']);?>			  
			    
				<div class="content_item">
				
					<h3><a href="<?php echo site_url('home/play').'/'.$rows['ID']?>"><?php echo $rows['Title'];?></a></h3>
					
					<h5><?php echo __("CF_by")?> <?php echo $rows['speaker_name']?> <?php echo __("CF_in")?> : 
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
                     // <?php echo date("F jS Y", strtotime($rows['Date']))?></h5>
					
					<div class="rate_balloon"><img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements.png" style="border:none" alt="rate" />
					<img src="images/rElements_grey.png" style="border:none" alt="rate" />
					<img src="images/rElements_grey.png" style="border:none" alt="rate" />
					</div>
					
					<p>
					<img src="<?php echo base_url().'thumbs/'.$rows['ImagesLink']?>" width="202" height="90" alt="" class="alignleft" />
					</p>
					
					<p>
					<?php echo $rows['Description'];?>
					</p>
					
					<a href="<?php echo site_url('home/play').'/'.$rows['ID']?>" class="read_more"><?php echo __("CF_view")?></a>
					
				</div>		  
				
				<?php endforeach?>
				
			
				<ul id="pagination">
				
					<?php echo $pagination?>		
				
				</ul>				