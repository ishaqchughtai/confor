<?php
	$this->load->view('admin/speaker_selector');	

	$selected_cate = isset($video_cate)?$video_cate:1; 
	$selected_cate_setting = array
	(
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name'
	);	
	$speaker_id = isset($speaker_id)?$speaker_id:0;	
?>   
              <div class="x2">

                    <h3><?php echo __("CF_add_vid")?></h3>
					<?php $this->load->view("vid/menu_video_admin");?>
                    <p>&nbsp;	</p>
                    <h3><?php echo __("CF_add_vid")?> (<?php echo lang_name_by_short_key($lg)?>) </h3> 
					  <?php echo form_open('vid/new_video_conference/'.$lg);?>
						
					<p>
					<input id="speaker_id" type="hidden" name="speaker" value="<?php echo $speaker_id?>"/>
					<label for="title"><?php echo __("CF_one_speaker")?>:</label>
					<input id="speaker_email" name="speaker_email" class="short" type="text" value="<?php echo set_value('speaker_email');?>"/>
					<?php echo form_error('speaker_email')?>
					</p>
					
					<p>
					<label for="title"><?php echo __("CF_title")?></label>
					<input class="medium" name="title" id="title" value="<?php echo set_value('title');?>"/>
					<?php echo form_error('title')?>
					</p>
				
                    <p>
                        <label for="description"><?php echo __("CF_des")?></label>
                        <textarea name="description" id="description" rows="4" cols=""><?php echo set_value('description');?></textarea>
                        <?php echo form_error('description')?>
                    </p>
					
                    <p>
					<label><?php echo __("CF_cate_vid")?></label>
					<?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>			
                        <a href="<?php echo site_url('admin/category_managing')?>"><?php echo __("CF_cate_man")?></a>
                    </p>
                    <p>
                        <label for="keywords"><?php echo __("CF_key")?>:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php echo set_value('keywords');?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    
					<p>
					<label for="vidupload">Upload video</label>
					</p>
					
							<?php $this->load->view('vid/vid_uploader');?>
							<?php if(isset($error)):?>
        					<p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        					<?php endif?>
                    
                    <p>
                        <input name="submit" type="submit" class="submit" value="<?php echo __("CF_add")?>" />
                    </p>
					<?php echo form_close()?>	
                   </div>				   				   
              <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->                      