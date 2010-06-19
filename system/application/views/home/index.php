			
			  <div class="content_item">
		      <?php 
                if($video_path->num_rows()>0)
                {
                    $row = $video_path->row();
                   $top_view_video = $row->VideoLink;
                   $video_title=$row->Title;
                   $speaker=$row->FirstName.' '.$row->Name;
                   $description=$row->Description;
                }
              ?>		
					<h3><a href="blog_entry.html"><?php echo __("CON_top_video")?></a></h3>
					<h5><?php echo $speaker.'   '.$video_title?></h5>
				<p><a href="<?php echo base_url().'videos/'.$top_view_video;?>" style="display:block;width:621px;height:344px;"id="player"></a></p>
					
				  <p><?php echo $description?></p>
										
			  </div>
				<!-- /.content_item -->
              <div class="x3_2">

                    <div class="x3" style="border-color:#FFF; border:thick;">
                    <img src="<?php echo base_url();?>assets/bolck_285x285.png" />
					Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellen eu, pretium quis, sem.</div>
                    
                  <div class="x3 no_margin" style="border-color:#FFF; border:thick;">
                    <img src="<?php echo base_url();?>assets/bolck_285x285.png" />
                    Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</div>
                    
                </div>
                
              <div class="x3_2">

                    <div class="x3" style="border-color:#FFF; border:thick;">
                    <img src="<?php echo base_url();?>assets/bolck_285x285.png" />
					Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellen eu, pretium quis, sem.</div>
                    
                  <div class="x3 no_margin" style="border-color:#FFF; border:thick;">
                    <img src="<?php echo base_url();?>assets/bolck_285x285.png" />
                    Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo.</div>
                    
                </div>
			