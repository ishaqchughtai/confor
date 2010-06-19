<?php 
	$advs = get_random_top_adv($category);
	//print_r($ar);
	$attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
?>
		<div class="content">			
			<?php for($i=0; $i<count($advs); $i++):?>							
				<div class="top_box_block<?php if(($i+1)%3==0) echo ' no_margin_r';?>">                
					<h4 class="top_box_block"><?php echo $advs[$i]['AdvertiserName']?></h4>
					<p><?php echo $advs[$i]['TextTips']?></p>
		        	<a href="<?php echo $advs[$i]['URL']?>"><img src="<?php echo base_url().'assets/uploads/adv/'.$advs[$i]['ImageLink']?>" width="89" height="75" class="icon"></a> 
                </div>
				<!-- /.content .top_box_block -->
			<?php endfor;?>
		</div>
		<!-- /#top_box -->