<?php
	$this->load->view('admin/speaker_selector');
?>
				<div class="content_item">
				
					<h3><?php echo __("CF_add_event")?></h3>
					<?php
						$data=array('name' => 'event-form','id' => 'event-form'); 
						echo form_open('event/add_event',$data);
					?>
						<p>
						<input id="speaker_id" type="hidden" name="speaker" value="0"/>
						<label for="title"><?php echo __("CF_one_speaker")?>:</label>
						<input id="speaker_email" name="speaker_name" class="short" type="text" value=""/>
                        <?php echo form_error('speaker_name')?>
						</p>
						
						<p>
						
							<label for="en_title"><?php echo __("CF_en_title")?>:</label>
							<input name="en_title" class="short" id="en_title" value="<?php if(isset($_POST['en_title'])){ echo $_POST['en_title'];}?>" />
							<?php echo form_error('en_title')?>
						
						</p>
                        
                        <p>
						
							<label for="fr_title"><?php echo __("CF_fr_title")?>:</label>
							<input name="fr_title" class="short" id="fr_title" value="<?php if(isset($_POST['fr_title'])){ echo $_POST['fr_title'];}?>" />
							<?php echo form_error('fr_title')?>
						
						</p>
						
						<p>
						
							<label for="en_subject"><?php echo __("CF_en_subject")?>:</label>
							<input class="short" name="en_subject" id="en_subject" value="<?php if(isset($_POST['en_subject'])){ echo $_POST['en_subject'];}?>" />
							<?php echo form_error('en_subject')?>
						
						</p>
                        
                        <p>
						
							<label for="fr_subject"><?php echo __("CF_fr_subject")?>:</label>
							<input class="short" name="fr_subject" id="fr_subject" value="<?php if(isset($_POST['fr_subject'])){ echo $_POST['fr_subject'];}?>" />
							<?php echo form_error('fr_subject')?>
						
						</p>
						
						<p>
						
							<label for="keywords"><?php echo __("CF_key")?>:</label>
							<input class="short" name="keywords" id="keywords" value="<?php if(isset($_POST['keywords'])){ echo $_POST['keywords'];}?>" />
							<?php echo form_error('keywords')?>
						
						</p>
						
						<p>
						
							<label for="en_description"><?php echo __("CF_en_des")?>:</label>
							<?php 
									
                                    if ( ! isset($_POST['en_description']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['en_description'];
                                    }
                                    $data = array('name' => 'en_description',
                                    'id' => 'en_description',
                                    'width' => '600',
                                    'height' => '400');
                                    echo form_fckeditor($data);
									echo form_error('en_description');
                                    ?>
						</p>
                        
                        <p>
						
							<label for="fr_description"><?php echo __("CF_fr_des")?>:</label>
							<?php 
									
                                    if ( ! isset($_POST['fr_description']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['fr_description'];
                                    }
                                    $data = array('name' => 'fr_description',
                                    'id' => 'fr_description',
                                    'width' => '600',
                                    'height' => '400');
                                    echo form_fckeditor($data);
									echo form_error('fr_description');
                                    ?>
						</p>
                        
                        						
						<p>						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_send")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />						
						</p>
					<?php echo form_close();?>
					
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>			
