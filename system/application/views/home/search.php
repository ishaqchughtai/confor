				<div class="content_item">
				<h3>Search result for: "<?php echo $keyword?>" </h3>
				</div>
				<?php foreach($search_results as $rows):?>			  
			    
				<div class="content_item">
				
					<h3><a href="<?php echo site_url('home/play').'/'.$rows['ID']?>"><?php echo $rows['Title'];?></a></h3>
					
					<h5>By <?php echo $rows['Speaker']?> in : <a href="#">Interview</a> , <a href="#">Design</a> // February 2nd 2010</h5>
					
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
					
					<a href="<?php echo site_url('home/play').'/'.$rows['ID']?>" class="read_more">View</a>
					
				</div>		  
				
				<?php endforeach?>
				
			
				<ul id="pagination">
				
					<?php echo $link_html?>		
				
				</ul>				