<?php 
	//echo $rows;
	//echo $category;
	$advs = get_random_top_adv($category);
	//print_r($ar);
	$attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
?>
			<div class="content">
			
			<?php for($i=0; $i<count($advs); $i++):?>							
				<div class="top_box_block">                
					<h4 class="top_box_block"><?php echo $advs[$i]['AdvertiserName']?></h4>
					<p><?php echo $item['TextTips']?></p>
		        	<a href="<?php echo $advs[$i]['url']?>"><img src="<?php echo base_url().'assets/uploads/adv/'.$advs[$i]['image_link']?>" width="89" height="75" alt="Works Everywhere" class="icon"></a> 
                </div>
				<!-- /.content .top_box_block -->
			
				<div class="top_box_block">
				
					<h4>Shop ad 2</h4>
					<p>Modèle original de la classe Business Jet de Boing</p>
					<?php echo img('top_box_icon_2.png', $attr);?>
				</div>
				<!-- /.content .top_box_block -->
			
				<div class="top_box_block no_margin_r">
				
					<h4>Shop ad  3</h4>
					<p>Aenean commodo, dui porta consequat.</p>
					<?php echo img('top_box_icon_2.png', $attr);?>
				<!-- /.content .top_box_block -->
			
			</div>
			<!-- /#top_box .content -->

		</div>
		<!-- /#top_box -->