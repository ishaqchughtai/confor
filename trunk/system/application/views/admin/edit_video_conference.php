              <div class="x2">

                    <h3>Administrator Menu</h3>
                    <ul>
                        <li><a href="<?php echo site_url('admin/list_admin')?>">Administrator List</a></li>
                        <li><a href="<?php echo site_url('admin/add_new_admin')?>">New administrator</a></li>
                        <li><a href="<?php echo site_url('admin/list_user')?>">User List</a></li>
                        <li><a href="<?php echo site_url('admin/list_ticket')?>">Ticket List</a></li>
                        <li><a href="<?php echo site_url('admin/list_video_conference')?>">Video conference List</a></li>
                        <li><a href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
                    </ul>
                    <p>&nbsp;	</p>
                    <?php 
                        if($query->num_rows()>0)
                        {
                            $row=$query->row();
                            $id=$row->ID;
                            $fullname=$row->FirstName.' '.$row->Name;
                            $title=$row->Title;
                            $subject=$row->Subject;
                            $keywords=$row->Keywords;
                            $discription=$row->Description;
                        }
                    ?>
                    <h3> Video conference update </h3> 
					<?php echo form_open('admin/edit_video_conference/'.$id);?> 
                    <?php// echo form_open('admin/modify_user/'.$id); ?>    
						<p>
							<label for="name">Full Name:</label>
							<input type="text" class="medium" name="name" id="name" readonly="readonly" value="<?php echo $fullname?>" />
						</p>
						
						<p>
							<label for="email">Title:</label>
							<input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" /><?php echo form_error('title')?>
						</p>
					  <p>
						
						  <label for="message"></label>
						  <label for="name">Subject:</label>

						  <input type="text" class="medium" name="subject" id="subject" value="<?php echo $subject ?>" /><?php echo form_error('subject')?>
						</p>
						
						<p>
						
							<label for="name">Keywords:</label>

							<input type="text" class="medium" name="keywords" id="keywords" value="<?php echo $keywords ?>" /><?php echo form_error('keywords')?>
						</p>
						<p>
						  <label for="message">Description:</label>
                          <textarea name="Description" id="message" rows="8" cols="">  "<?php echo $discription ?>"</textarea></p><?php echo form_error('Description')?>
						<p>
						  <label for="label">Video:</label>
                          <input type="file" class="long" name="video" id="file" /></p>
					  <p>
						
						  <label for="name"></label><input type="submit" name="Submit" class="submit" value="Update" />
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
