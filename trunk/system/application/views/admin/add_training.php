				<div class="content_item">
     <?php $this->load->view("admin/admin_menu_training");?>
    <br>
					<h3><?php echo __("CF_add_new_article")?></h3>
					<?php
						$data=array('name' => 'training-form','id' => 'training-form'); 
						echo form_open('training/add_article',$data);
					?>
                    <div class="input text">
						<label><?php echo __("CF_dis_lang")?></label>		
						<?php choose_your_language($lg);?>
					</div>
					        <p>
            <label><?php echo __("CF_blog_thum")?> :</label>                 
            <?php $this->load->view('image_upload');?>
        </p>	
						<p>
						
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input name="title" class="short" id="title" value="<?php if(isset($_POST['title'])){ echo $_POST['title'];}?>" />
							<?php echo form_error('title')?>
						
						</p>
						
						<p>
						
							<label for="content"><?php echo __("CF_content")?>:</label>
                            <p>
							<?php 
									
                                    if ( ! isset($_POST['content']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['content'];
                                    }
                                    $data = array('name' => 'content',
                                    'id' => 'content',
                                    'width' => '600',
                                    'height' => '400');
                                    echo form_fckeditor($data);
									echo form_error('content');
                                    ?>
                                    </p>
						</p>						
						<p>						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_send")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />						
						</p>
					<?php echo form_close();?>
					
				</div>
				<div id="left">
			  </div>			
