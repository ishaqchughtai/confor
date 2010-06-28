                 <div class="x2">

                    <h3>Edit video</h3>
                    <?php 
                        if($query->num_rows()>0)
                        {
                            $row=$query->row();                      
                            $id=$row->vid_id;
							echo $id;
							$speaker_id->mem_id;
							echo $speaker_id;
							return;
                            $title=$row->title;
                            $subject=$row->category;
                            $keywords=$row->tags;
                            $discription=$row->description;
                        }
                    ?>
                    <?php echo form_open_multipart('video/edit_video_conference/'.$speaker_id.'/'.$id);?> 
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

           
           