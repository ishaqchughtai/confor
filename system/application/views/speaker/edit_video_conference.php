<?php			
	$selected_cate_setting = array
	(
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name'
	);		
	
?>   
              <div class="x2">
                   
                    <?php 
                        if($query->num_rows()>0)
                        {
                            $row=$query->row();                      
                            $id=$row->vid_id;
                            $title=$row->title;                            
							$selected_cate = $row->category;
                            $keywords=$row->tags;
                            $description=$row->description;
                        }
                    ?>
                    <h3> <?php echo __("CF_vid_update")?> </h3>
                    <?php echo form_open('video/edit_video_conference/'.$speaker_id.'/'.$id);?> 
                    <p>
                        <label for="title"><?php echo __("CF_title")?>:</label>
                        <input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" />
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="video_cate"><?php echo __("CF_cate_vid")?>:</label>
						<?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>			
                    </p>

                    <p>

                        <label for="keywords"><?php echo __("CF_key")?>:</label>

                        <input type="text" class="medium" name="keywords" id="keywords" value="<?php echo $keywords ?>" />
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
                        <label for="description"><?php echo __("CF_des")?>:</label>
                        <textarea name="description" id="description" rows="4" cols=""><?php echo $description ?></textarea>
                        <?php echo form_error('description')?>
                    </p>
 
                    <p>
                        <label for="name"></label><input type="submit" name="submit" class="submit" value="<?php echo __("CF_update")?>" />
                    </p>

                    <?echo form_close();?>
			  
                   </div>
              <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

           
           