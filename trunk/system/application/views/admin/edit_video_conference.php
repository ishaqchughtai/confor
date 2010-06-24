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
                        <label for="category">Category:</label>
                        <select class="medium" name="category">
                            <?php foreach($category as $row):?>
                            <option value="<?php echo $row['ID']?>"><?php echo $row['Name']?></option>
                            <?php endforeach;?>
                        </select>
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
                        <option value="1" selected="selected">Yes</option>
                        <option value="0">No</option>
                    </select>
                    <p>
                        <label for="video">Video:</label>
                        <input type="file" name="userfile" size="20" />
                        <b style="color: red"><?php echo $error ;?></b>
                    </p>
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

           
           