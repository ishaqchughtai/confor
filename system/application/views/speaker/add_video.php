<?php 
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

                    <h3>Add new video</h3>
					  <?php echo form_open_multipart('video/add_video');?>
						
						<p>
                        <label for="title">Title:</label>
                        <input class="medium" name="title" id="title" value="<?php if(isset($_POST['title'])){ echo $_POST['title'];}?>"/>
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" rows="4" cols=""><?php if(isset($_POST['title'])){ echo $_POST['description'];}?></textarea>
                        <?php echo form_error('description')?>
                    </p>
                    <p>
                        <label for="category">Category:</label>
                        <?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>
                    </p>
                    <p>
                        <label for="keywords">Keywords:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php if(isset($_POST['keywords'])){ echo $_POST['title'];}?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
							<?php $this->load->view('uploader');?>
							<?php if(isset($error)):?>
        					<p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        					<?php endif?>
                    </p>
                    <p>
                        <input name="submit" type="submit" class="submit" value="ADD" />
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