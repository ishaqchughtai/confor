<?php
	$this->load->view('admin/speaker_selector');
?>   
              <div class="x2">

                    <h3>Add new video</h3>
					<?php $this->load->view("admin/admin_menu_video");?>
                    <p>&nbsp;	</p>
                    <h3>Add video conference </h3> 
					  <?php echo form_open('admin/add_new_video_conference/');?>
						
						<p>
						<input id="speaker_id" type="hidden" name="speaker" value="0"/>
						<label for="title">Speaker:</label>
						<input id="speaker_email" class="short" type="text" value=""/>
						</p>
						
						<p>
						
							<label for="title">Title:</label>
							<input class="medium" name="title" id="title" value="<?php echo set_value('title');?>"/><?php echo form_error('title')?>
						</p>
                        
                        <p>
                        
                            <label for="subject">Subject:</label>
                            <input class="medium" name="subject" id="subject" value="<?php echo set_value('subject');?>" />
                        </p>
                        
						<p>
						
							<label for="message">Description:</label>

							<textarea name="message" id="message" rows="8" cols=""></textarea>
						</p>
						
						<p>
						
							<label for="name">Keywords:</label>

							<input class="medium" name="keywords" id="keywords" />
						</p>
						
						<p>
						
							<label for="image">Image:</label>

							<input type="file" class="medium" name="image" size="50" id="image" />
						</p>
						
						<p>
						
							<label for="video">Upload Video:</label>

							<input type="file" class="medium" name="video" id="video" size="50" />
						</p>
						
                        <p>
						
							<input name="Submit" type="submit" class="submit" value="Send" />
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

           
           