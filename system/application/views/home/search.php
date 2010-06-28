                <?php require 'SimpleRatings/rSystem.php'; ?>
				<div class="content_item">
				<h3>Search result for: "<?php echo $keyword?>" </h3>
				</div>
				<?php foreach($search_results as $rows):?>			  
                <?php $keyword = explode(" ", $rows['tags']);?>
			    
				<div class="content_item">
				
					<h3><a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>
					
					<h5>By <?php echo $rows['mem_id']?> in : 
                    <?php for($i=0;$i<count($keyword);$i++){?>
                      <a href="#"><?php echo $keyword[$i]?></a>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
                     // <?php echo mdate('%F %j%S %Y', $rows['date'])?></h5>
 
					<div class="rate_balloon"><?php $SimpleRatings->create($rows['vid_id']);?>
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
				
					<?php echo $link_html?>		
				
				</ul>				