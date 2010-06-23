<?php
	$this->load->view('admin/speaker_selector');
?>   
              <div class="x2">

                    <h3>Add new video</h3>
					<?php $this->load->view("admin/admin_menu_video");?>
                    <p>&nbsp;	</p>
                    <h3>Add video conference </h3> 
					  <?php echo form_open_multipart('admin/new_video_conference/');?>
						
						<p>
						<input id="speaker_id" type="hidden" name="speaker" value="0"/>
						<label for="title">Speaker:</label>
						<input id="speaker_email" class="short" type="text" value=""/>
						</p>
						
						<p>
                        <label for="title">Title:</label>
                        <input class="medium" name="title" id="title" value="<?php echo set_value('title');?>"/>
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" rows="4" cols="" value="<?php echo set_value('description');?>"></textarea>
                        <?php echo form_error('description')?>
                    </p>
                    <p>
                        <label for="category">Category:</label>
                        <select class="medium" name="category">
                            <?php foreach($query as $row):?>
                            <option value="<?php echo $row['ID']?>"><?php echo $row['Category']?></option>
                            <?php endforeach;?>
                        </select>
                        <a href="#">Category Management</a>
                        <?php echo form_error('category')?>
                    </p>
                    <p>
                        <label for="keywords">Keywords:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php echo set_value('keywords');?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
                        <label for="video">Video:</label>
                        <input type="file" name="userfile" size="20" />
                        <?php echo form_error('video')?>
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

           
           