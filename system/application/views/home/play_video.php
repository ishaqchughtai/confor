		
			  <div class="content_item">
              <?php 
              if($video_url->num_rows()>0)
              {
                  $row=$video_url->row();
                  $video_link=$row->vhash;
                  $video_title=$row->title;
              }
              ?>
              <h3><?php echo $video_title?></h3>
			  <p><a href="<?php echo base_url().'videos/'.$video_link?>" style="display:block;width:621px;height:344px;"id="player"></a></p>		
					
			  </div>

<script language="JavaScript">
	flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer-3.2.2.swf",{clip:{autoPlay: false,autoBuffering: true}});
</script>			  