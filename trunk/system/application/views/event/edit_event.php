					<?php
						foreach($query as $row)
						{
							$id = $row->ID;
							$speaker_id = $row->Speaker;
							$date =  $row->Date;
							$title = $row->Title;
							$subject = $row->Subject;
							$keywords = $row->Keywords;
							$description = $row->Description;
						}
					?>
				<div class="content_item">
				
					<h3><?php echo __("CF_edit_event")?></h3>
						<?php
						echo form_open('manage_event/edit_event/'.$speaker_id.'/'.$id);
						?>
						<p>
						
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input class="short" name="title" id="title" value="<?php echo $title?>" />
							<?php echo form_error('title');?>
						
						</p>
						
						<p>
						
							<label for="subject"><?php echo __("CF_subject")?>:</label>
							<input class="short" name="subject" id="subject" value="<?php echo $subject?>"/>
							<?php echo form_error('subject');?>
						
						</p>
						
						<p>
						
							<label for="keywords"><?php echo __("CF_key")?>:</label>
							<input class="short" name="keywords" id="keywords" value="<?php echo $keywords?>" />
							<?php echo form_error('keywords');?>
						
						</p>
						
						<p>
						
							<label for="description"><?php echo __("CF_des")?>:</label>
							<?php 
									
                                    if ( ! isset($_POST['description']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['description'];
                                    }
                                    $data = array('name' => 'description',
                                    'id' => 'description',
                                    'width' => '600',
                                    'height' => '400',
									'value'=> $description);
                                    echo form_fckeditor($data);
									echo form_error('description');
                                    ?>
						
						</p>
						
						<p>
						
							<input name="btnedit" type="submit" class="submit" value="<?php echo __("CF_edit")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
						</p>
					<?php
						echo form_close();
						?>	
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>			