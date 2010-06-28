<script type="text/javascript">
function search_click (){
 keyword = $('#keyword').val();
 gogo = XEMMEX.baseUrl + "event/search_event/" + keyword + "/5";
 window.location = gogo;
 return false;
}
</script>
</div>
			<div id="right">
			
				<h3>Search</h3>
				<h5>Search through all events</h5>
				
			  <div class="sidebar_item" id="search">
					<?php echo form_open('event/search_event')?>
					
						<input name="search_field" type="text" class="search_field" id="keyword">
				        <input name="btnsubmit" type="submit" class="search_submit" value="" onclick="return search_click();" />
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
				        <?php foreach($categories as $row):?>
				        <li><a href="<?php echo site_url('category/get_category/'.$row['ID'])?>"><?php echo $row['Name']?></a></li>
                        <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
				        <?php foreach($dates as $row):?>
				        <li>
                        <a href="<?php echo site_url('video/archives/'.date("m", mdate($row['month_yy'])).'/'.date("Y", mdate($row['month_yy'])))?>"><?php echo mdate('%F %Y',$row['month_yy']);?></a>
                        </li>
                      <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
				        <?php foreach($top_speaker as $row):?>
				        <li><a href="<?php echo site_url('video/speaker').'/'.$row['mem_id']?>"><?php echo $row['first_name'].' '.$row['name']?></a></li>
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
				
					<h3>Popular Video</h3>
					
					<ul id="popular_posts">
					
						<li>
						
							<ul class="popular_posts_content">
                                <?php $count=0;?>
							    <?php foreach($popular_video as $row):?>
								<li>
								
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$row['shash'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>">VIEW</a>
								
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
								
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$row['shash'];?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$row['vid_id']?>">VIEW</a>
								
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
								
									<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>" class="title"><?php echo $rows['title']?></a>
									<a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>">VIEW</a>
								
								</li><br /><br />
                                <?php endforeach?>
					</ul>
              					
			  </div>
              
              
				<div class="sidebar_item">
					<h3>E?vènements</h3>
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
			