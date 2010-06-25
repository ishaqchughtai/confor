			
			  <div class="content_item">
		      <?php 
                if($video_path->num_rows()>0)
                {
                    $row = $video_path->row();
                   $top_view_video = $row->vhash;
                   $video_title=$row->title;
                   $speaker=$row->FirstName.' '.$row->Name;
                   $description=$row->description;
                }
              ?>		
					<h3><a href="blog_entry.html"><?php echo __("CON_top_video")?></a></h3>
					<h5><?php echo $speaker.'   '.$video_title?></h5>
				<p><a href="<?php echo base_url().'videos/'.$top_view_video;?>" style="display:block;width:621px;height:344px;"id="player"></a></p>
					
				  <p><?php echo $description?></p>
										
			  </div>
				<!-- /.content_item -->
                
                <?php 
	$advs = get_random_top_adv($category,4);
	//print_r($ar);
	$attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
?>
		<div class="x3_2">			
			<?php for($i=0; $i<count($advs); $i++):?>							
				<div class="x3<?php if(($i+1)%2==0) echo ' no_margin_r';?>" style="border-color:#FFF; border:thick;">
		        	<a href="<?php echo $advs[$i]['URL']?>"><img src="<?php echo base_url().'assets/uploads/adv/'.$advs[$i]['ImageLink']?>" width="285" height="285" class="icon"></a> 
                    <p><?php echo $advs[$i]['TextTips']?></p>
                </div>
				<!-- /.content .top_box_block -->
			<?php endfor;?>
		</div>

<script language="JavaScript">
	flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer-3.2.2.swf",{clip:{autoPlay: false,autoBuffering: true}});
</script>		