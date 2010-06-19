		
			  <div class="content_item">
              <?php 
              if($video_url->num_rows()>0)
              {
                  $row=$video_url->row();
                  $video_link=$row->VideoLink;
                  $video_title=$row->Title;
              }
              ?>
              <h3><?php echo $video_title?></h3>
			  <p><a href="<?php echo base_url().'videos/'.$video_link?>" style="display:block;width:621px;height:344px;"id="player"></a></p>		
					
			  </div>
