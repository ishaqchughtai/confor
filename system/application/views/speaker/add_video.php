<?php 
	$selected_cate = isset($video_cate)?$video_cate:1; 
	$selected_cate_setting = array
	(
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name'
	);	
	//$speaker_id = isset($speaker_id)?$speaker_id:0;
?>

                 <div class="x2">

                    <h3><?php echo __("CF_add_vid")?></h3>
					  <?php echo form_open('video/add_video');?>
						
						<p>
                        <label for="title"><?php echo __("CF_title")?>:</label>
                        <input class="medium" name="title" id="title" value="<?php if(isset($_POST['title'])){ echo $_POST['title'];}?>"/>
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="description"><?php echo __("CF_des")?>:</label>
                        <textarea name="description" id="description" rows="4" cols=""><?php if(isset($_POST['title'])){ echo $_POST['description'];}?></textarea>
                        <?php echo form_error('description')?>
                    </p>
                    <p>
                        <label for="category"><?php echo __("CF_cate_vid")?>:</label>
                        <?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>
                    </p>
                    <p>
                        <label for="keywords"><?php echo __("CF_key")?>:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php if(isset($_POST['keywords'])){ echo $_POST['keywords'];}?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
							<script>
							XEMMEX.ajax_upload_url = 'video/do_upload_ajax';
							</script>
							<?php $this->load->view('uploader');?>
							<?php if(isset($error)):?>
        					<p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        					<?php endif?>
                    </p>
					<p>
					<a href="<?php echo site_url('ticket/send_ticket_by_speaker')?>"><?php echo __("CF_order")?></a>
					</p>
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