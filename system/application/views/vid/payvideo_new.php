              <div class="x2">                    
					<?php $this->load->view("vid/payvideo_menu");?>                   
				
                    <h3><?php echo __("CF_pay_vid_new")?></h3> 
					<?php echo form_open('payvid/new_payvideo/');?>
													
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
                        <label for="keywords"><?php echo __("CF_key")?>:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php echo set_value('keywords');?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    
					<p>
					<label for="vidupload"><?php echo __("CF_upload_video")?></label>
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