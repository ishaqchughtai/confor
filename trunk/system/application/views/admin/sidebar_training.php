<script type="text/javascript">
function search_click(){
 keyword = $('#keyword').val();
 gogo = XEMMEX.baseUrl + "training_frontend/search_training/" + keyword + "/5";
 window.location = gogo;
 return false;
}
</script>
<?php $page = 5;?>
<?php $statistic_event = 15;?>
<?//php echo $count_video?>
</div>
			<div id="right">
			
				<h3><?php echo __("CF_search")?></h3>
				<h5><?php echo __("CF_search_training")?></h5>
				
			  <div class="sidebar_item" id="search">				
					<?php echo form_open(site_url('training_frontend/search_training'));?>					
						<input name="search_field" type="text" class="search_field" id="keyword">
						<input name="key" type="text" style="display:none">
						<input name="search" type="submit" class="search_submit" value="&nbsp" onclick="return search_click();">
					<?php echo form_close();?>
					<!-- #search form -->
				<?php
					foreach(range('A', 'Z') as $letter):?>
						<a href="<?php echo site_url('office_frontend/search/'.$letter)?>"><?php echo $letter.' '; ?></a>
					<?php endforeach;?>
				</div>
                
				<!-- /.sidebar_item #search -->
                <div class="sidebar_item">
					<h3><?php echo __("CF_event")?></h3>
					<div id="datepicker"></div>
                    <ul>
                    	<li><a href="<?php echo site_url('event_frontend/today_event/'.date('Y-m-d').'/'.$statistic_event)?>"><?php echo __("CF_today_events")?></a></li>
                        
                        <li><a href="<?php echo site_url('event_frontend/week_event/'.date('W').'/'.$statistic_event)?>"><?php echo __("CF_week_events")?></a></li>
                        
                        <li><a href="<?php echo site_url('event_frontend/month_event/'.date("m").'/'.$statistic_event)?>"><?php echo __("CF_month_events")?></a></li>
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
			
