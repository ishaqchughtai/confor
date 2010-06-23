<?php
	$this->load->view('admin/speaker_selector');
?>   
              <div class="x2">

                    <h3>Add new video</h3>
					<?php $this->load->view("admin/admin_menu_video");?>
                   
                    <?php 
                        if($query->num_rows()>0)
                        {
                            $row=$query->row();                      
                            $id=$row->vid_id;
                            $title=$row->title;
                            $subject=$row->category;
                            $keywords=$row->tags;
                            $discription=$row->description;
                        }
                    ?>
                    <h3> Video conference update </h3> 
                    <?php echo form_open_multipart('admin/edit_video_conference/'.$id);?> 
                    <p>
                        <label for="title">Title:</label>
                        <input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" />
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="subject">Subject:</label>

                        <input type="text" class="medium" name="subject" id="subject" value="<?php echo $subject ?>" />
                        <?php echo form_error('subject')?>
                    </p>

                    <p>

                        <label for="keywords">Keywords:</label>

                        <input type="text" class="medium" name="keywords" id="keywords" value="<?php echo $keywords ?>" />
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" rows="4" cols=""><?php echo $discription ?></textarea>
                        <?php echo form_error('description')?>
                    </p>
                    
                    <p>
                        <label for="name">Approved:</label>
                    </p>
                    <select name="approved" class="short">
                        <option selected="selected">Yes</option>
                        <option>No</option>
                    </select>
                    <p>
                        <label for="label">Video:</label>
                        <input type="file" class="long" name="video" id="file" /></p>
                    <p>

                        <label for="name"></label><input type="submit" name="submit" class="submit" value="Update" />
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

           
           