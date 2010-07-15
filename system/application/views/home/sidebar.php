<?php $page = 5;?>
<?//php echo $count_video?>
</div>
			<div id="right">
			
				<h3><?php echo __("CF_search")?></h3>
				<h5><?php echo __("CF_search_vid")?></h5>
				
			  <div class="sidebar_item" id="search">
				
					<?php echo form_open(site_url('video/search'));?>
					
						<input name="search_field" type="text" class="search_field">
						<input name="search" type="submit" class="search_submit" value="&nbsp">
					
					<?php echo form_close();?>
					<!-- #search form -->
				
				</div>
				<!-- /.sidebar_item #search -->
                
                
                
				<div class="sidebar_item">
				  <ul id="tabs">
				    <li><?php echo __("CF_cate")?></li>
				    <li><?php echo __("CF_arch")?></li>
				    <li><?php echo __("CF_speaker")?></li>
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
					  <?php $archives = get_archives();?>
                      <?php foreach($archives as $item):?>
				        <li>                        
						<a href="<?php echo $item['link'];?>"><?php echo $item['title'];?> </a>                        
                        </li>
                      <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
                      <?php foreach($top_speaker as $row):?>
				        <li><a href="<?php echo site_url('video/speaker').'/'.$row['mem_id'].'/'.$page?>"><?php echo $row['username']?></a></li>
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
				
					<h3><?php echo __("CF_pop_vid")?></h3>
					
					<ul id="popular_posts">
					
						<li>
						
							<ul class="popular_posts_content">
                                <?php $count=0;?>
							    <?php foreach($popular_video as $row):?>
								<li>
								
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$row['shash'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><?php echo __("CF_view")?></a>
								
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
								
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$row['shash'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><?php echo __("CF_view")?></a>
								
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
				
					<h3><?php echo __("CF_recent_vid")?></h3>

                    <ul class="popular_posts_content">
							    <?php foreach($recent_video as $rows):?>
								<li>
								
									<a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>" class="title"><?php echo $rows['title']?></a>
									<a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><?php echo __("CF_view")?></a>
								
								</li><br /><br />
                                <?php endforeach?>
					</ul>
              					
			  </div>
              
              
				<div class="sidebar_item">
					<h3><?php echo __("CF_event")?></h3>
					<div id="datepicker"></div>
				</div>
			</div>
			<!-- /#content #right - right side of main content or sidebar -->

		</div>
		<!-- /#content -->
		
	</div>
	<!-- /#top-box -->
</div>
<!-- /#wrapper -->	
			
