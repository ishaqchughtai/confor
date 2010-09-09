<script type="text/javascript">
function search_click_speaker (){
 keyword = $('#keyword').val();
 gogo = XEMMEX.baseUrl + "event_frontend/search_event/" + keyword + "/5";
 window.location = gogo;
 return false;
}
</script>
<?php $page = 5;?>
<?php $statistic_event = 15;?>
</div>
			<div id="right">
			
				<h3><?php echo __("CF_search")?></h3>
				<h5><?php echo __("CF_event_search")?></h5>
				
			  <div class="sidebar_item" id="search">
					<?php echo form_open('event_frontend/search_event')?>
					
						<input name="search_field" type="text" class="search_field" id="keyword">
				        <input name="btnsubmit" type="submit" class="search_submit" value="&nbsp" onclick="return search_click_speaker();" />
					<?php echo form_close()?>
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
				        <li><a alt="<?php echo __("CF_cate").' - '.$row['Name']?>" title="<?php echo __("CF_cate").' - '.$row['Name']?>" href="<?php echo site_url('category/get_category/'.$row['ID']).'/'.$page?>"><?php echo $row['Name']?></a></li>
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
						<a href="<?php echo $item['link'];?>" alt="<?php echo __("CF_arch").' - '.$item['title'];?>" title="<?php echo __("CF_arch").' - '.$item['title'];?>"><?php echo $item['title'];?></a>                         
                        </li>
                      <?php endforeach?>
			          </ul>
				      <!-- /.ctabs_content -->
			        </li>
				    <!-- /#ctabs item -->
				    <li>
				      <ul class="ctabs_content">
				        <?php foreach($top_speaker as $row):?>
				        <li><a alt="<?php echo __("CF_speaker").' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo __("CF_speaker").' - '.$row['first_name'].' '.$row['name']?>" href="<?php echo site_url('video/speaker').'/'.$row['mem_id'].'/'.$page?>"><?php echo $row['first_name'].' '.$row['name']?></a></li>
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
							<?php for($i=0;$i<count($popular_video);$i++):
								$row = $popular_video[$i];
							?>								
							<?php if ($i%4==0):?>
							<li>
							<ul class="popular_posts_content">						
							<?php endif;?>
							
							<li>
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$row['shash'];?>" width="81" height="52" class="alignleft" alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>"></a>
									<a alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" href="<?php echo site_url('video/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><?php echo __("CF_view")?></a>								
							</li>
							
							<?php if($i%4==3):?>
							</ul>
							</li>
							<?php endif;?>															
							<?php endfor;?>		
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
							    <?php foreach($recent_video as $row):?>
								<li>
								
									<a href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><img alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" src="<?php echo base_url().'thumbs/'.$row['shash']?>" width="81" height="52" alt="Popular video" class="alignleft"></a>
									<a alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" href="<?php echo site_url('video/play').'/'.$row['vid_id']?>" class="title"><?php echo $row['title']?></a>
									<a alt="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" title="<?php echo $row['title'].' - '.$row['first_name'].' '.$row['name']?>" href="<?php echo site_url('video/play').'/'.$row['vid_id']?>"><?php echo __("CF_view")?></a>
								
								</li><br /><br />
                                <?php endforeach?>
					</ul>
              					
			  </div>
              
              
				<div class="sidebar_item">
					<h3><?php echo __("CF_event")?></h3>
					<div id="datepicker"></div>
                    <ul>
                    	<li><a alt="<?php echo __("CF_today_events").' - confor.tv'?>" title="<?php echo __("CF_today_events").' - confor.tv'?>" href="<?php echo site_url('event_frontend/today_event/'.date('Y-m-d').'/'.$statistic_event)?>"><?php echo __("CF_today_events")?></a></li>
                        
                        <li><a alt="<?php echo __("CF_week_events").' - confor.tv'?>" title="<?php echo __("CF_week_events").' - confor.tv'?>" href="<?php echo site_url('event_frontend/week_event/'.date('W').'/'.$statistic_event)?>"><?php echo __("CF_week_events")?></a></li>
                        
                        <li><a alt="<?php echo __("CF_month_events").' - confor.tv'?>" title="<?php echo __("CF_month_events").' - confor.tv'?>" href="<?php echo site_url('event_frontend/month_event/'.date("m").'/'.$statistic_event)?>"><?php echo __("CF_month_events")?></a></li>
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