<?php $page = 5;?>
</div>
			<div id="right">
			
				<h3><?php echo __("CON_search")?></h3>
				<h5>Search through all conferences</h5>
				
			  <div class="sidebar_item" id="search">
				
					<?php echo form_open(site_url('home/search'));?>
					
						<input name="search_field" type="text" class="search_field">
						<input name="search" type="submit" class="search_submit" value="submit">
					
					<?php echo form_close();?>
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
                      <?php foreach($categories as $row):?>
				        <li><a href="<?php echo site_url('category/get_category/'.$row['ID']).'/'.$page?>"><?php echo $row['Name']?></a></li>
                        <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
                      <?php foreach($dates as $row):?>
				        <li>
                        <a href="<?php echo site_url('video/archives/'.date("m", strtotime($row['month_yy'])).'/'.date("Y", strtotime($row['month_yy'])).'/'.$page)?>"><?php echo $row['month_yy'];?>
                        
                        </a>
                        </li>
                      <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
                      <?php foreach($top_speaker as $row):?>
				        <li><a href="<?php echo site_url('video/speaker').'/'.$row['Speaker'].'/'.$page?>"><?php echo $row['Name']?></a></li>
                      <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
			      </ul>
				  <!-- /#ctabs -->
			  </div>
				<!-- /.sidebar_item tabbed content -->
				
				<div class="sidebar_item">
				
					<h3><?php echo __("CON_popular_video")?></h3>
					
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
				
					<h3><?php echo __("CON_recent_video")?></h3>

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
					<h3><?php echo __("CON_event")?></h3>
					<div id="datepicker"></div>
                    <ul>
                    	<li><a href="a">E?vènement 1</a></li>
                        <li><a href="b">E?vènement 2</a></li>
                        <li><a href="c">E?vènement 3</a></li>
                        <li><a href="d">E?vènement 4</a></li>
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
			