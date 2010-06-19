<?php	
	//echo $var1.'/'.$var2.'/'.$side_bar['var3'];
?>
</div>
			<div id="right">
			
				<h3>Search</h3>
				<h5>Search through all events</h5>
				
			  <div class="sidebar_item" id="search">
					<?php echo form_open('event/search')?>
					
						<input name="search_field" type="text" class="search_field">
				        <input name="btnsubmit" type="submit" class="search_submit" value="" />
					<?php echo form_close()?>
					<!-- #search form -->
				
			  </div>
				<!-- /.sidebar_item #search -->
                
				<div class="sidebar_item">
				  <ul id="tabs">
				    <li>Categories</li>
				    <li>Archives</li>
				    <li>Speakers</li>
			      </ul>
				  <!-- /#tabs -->
				  <ul id="ctabs">
				    <li>
				      <ul class="ctabs_content">
				        <li><a href="#">Actuality</a></li>
				        <li><a href="#">Technology</a></li>
				        <li><a href="#">Interview</a></li>
				        <li><a href="#">Design</a></li>
				        <li><a href="#">Mobile</a></li>
				        <li><a href="#">Movies</a></li>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
				        <li><a href="#">March 2010 (8)</a></li>
				        <li><a href="#">February 2010 (3)</a></li>
				        <li><a href="#">January 2010 (14)</a></li>
				        <li><a href="#">December 2009 (17)</a></li>
				        <li><a href="#">November 2009 (22)</a></li>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
				        <li><a href="#">Robert Piche?</a></li>
				        <li><a href="#">Hubert Reeves</a></li>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
			      </ul>
				  <!-- /#ctabs -->
			  </div>
				<!-- /.sidebar_item tabbed content -->
				
				<div class="sidebar_item">
				
					<h3>Popular Video</h3>
					
					<ul id="popular_posts">
					
						<li>
						
							<ul class="popular_posts_content">
                                <?php $count=0;?>
							    <?php foreach($popular_video as $row):?>
								<li>
								
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>"><img src="<?php echo base_url().'thumbs/'.$row['ImagesLink'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>" class="title"><?php echo $row['Title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>">VIEW</a>
								
								</li>
                                <?php
                                    $count++;
                                    if($count==4){
                                        break;
                                    }
                                ?>
                                <?php endforeach?>
							<!-- /.popular_posts_content li -->
							
							</ul>
							<!-- /.popular_posts_content -->
						
						</li>
						<!-- /.popular_posts li - popular posts slider item -->
					
						<li>
						
							<ul class="popular_posts_content">
							    <?php $count=0;?>
                                <?php foreach($popular_video as $row):?>
                                <?php if($count>3){?>
                                <li>
								
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>"><img src="<?php echo base_url().'thumbs/'.$row['ImagesLink'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>" class="title"><?php echo $row['Title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$row['ID']?>">VIEW</a>
								
								</li>
                                <?php }?>
                                <?php
                                    $count++;
                                ?>
								<?php endforeach?>
							</ul>
							<!-- /.popular_posts_content -->
						
						</li>
						<!-- /.popular_posts li - popular posts slider item -->
					
					</ul>
					<!-- /#popular_posts -->
					
					
					<ul id="pop_nav">
					
						<li id="prev_pop"></li>
						<!-- /#prev_pop -->
					
						<li id="next_pop"></li>
						<!-- /#next_pop -->
					
					</ul>
					<!-- /#pop_nav -->
                    
                    
                    			
			  </div>
              
              
              <div class="sidebar_item">
				
					<h3>Recent Video</h3>

                    <ul class="popular_posts_content">
							    <?php foreach($recent_video as $rows):?>
								<li>
								
									<a href="<?php echo site_url('home/play').'/'.$rows['ID']?>"><img src="<?php echo base_url().'thumbs/'.$rows['ImagesLink']?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$rows['ID']?>" class="title"><?php echo $rows['Title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$rows['ID']?>">VIEW</a>
								
								</li><br /><br />
                                <?php endforeach?>
					</ul>
              					
			  </div>
              
              
				<div class="sidebar_item">
					<h3>E?vènements</h3>
					<div id="datepicker"></div>
                    <ul>
                    	<li><a href="a">E?vènement 1</a></li>
                        <li><a href="b">E?vènement 2</a></li>
                        <li><a href="c">E?vènement 3</a></li>
                        <li><a href="d">E?vènement 4</a></li>
                    </ul>
					
				</div>
			</div>
			<!-- /#content #right - right side of main content or sidebar -->

		</div>
		<!-- /#content -->
		
	</div>
	<!-- /#top-box -->
</div>
<!-- /#wrapper -->	
			