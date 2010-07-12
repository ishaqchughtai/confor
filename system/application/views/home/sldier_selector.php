<div class="clear">
<div id="slider">
		<ul>
        <?php foreach($query as $row){                               
        $id = $row['ID'];
        $video = $row['Video'];
        $images = $row['SpeakerImages'];
        ?>                               			
			<li style="background: #020e13;"><a href="<?php echo site_url('home/play/'.$video)?>"><img src="<?php echo base_url().'assets/uploads/image/'.$images;?>"width="880" height="300"></a></li>
			<!-- /slider item -->	
        <?php }?>     
		</ul>
	<!-- /#slider ul -->	
	</div>
	<!-- /#slider -->		
	<div id="slider_selector">		
		<div id="slider_selector_right"></div>
		<!-- /#sldier_selector_right - right background of selector -->	
	</div>			
</div>