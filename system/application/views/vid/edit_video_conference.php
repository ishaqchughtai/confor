<?php
	$this->load->view('admin/speaker_selector');
		
	$selected_cate_setting = array
	(
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name'
	);		
	
	$lang_option = array(
		'en' => 'English',
		'fr' => 'French'
	);	
	
?>   
              <div class="x2">
					<?php $this->load->view("vid/menu_video_admin");?>
                   
                    <?php 
                        if($query->num_rows()>0)
                        {
                            $row=$query->row();                      
                            $id=$row->vid_id;
                            $title=$row->title;							
							$selected_cate = $row->category;
                            $keywords=$row->tags;
                            $description=$row->description;							
							$appr = $row->approved;	
							$speaker_id = $row->mem_id;
							$speaker_name = $row->username . '('.$row->name.')';
							$lg = $row->lang;
                        }
                    ?>
                    <br />

                    <h3> <?php echo __("CF_vid_update")?> </h3>
                    <?php echo form_open('vid/edit_video_conference/'.$id);?> 

					<div class="input text">
						<label>Display language</label>		
						<?php choose_your_language($lg);?>
					</div>	
					
					<p>
					<input id="speaker_id" type="hidden" name="speaker" value="<?php echo $speaker_id?>"/>
					<label for="title"><?php echo __("CF_one_speaker")?>:</label>
					<input id="speaker_email" name="speaker_email" class="short" type="text" value="<?php echo $speaker_name?>"/>					
					</p>					
					
                    <p>
                        <label for="title"><?php echo __("CF_title")?>:</label>
                        <input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" />
                        <?php echo form_error('title')?>
                    </p>
          					
                    <p>
                        <label for="video_cate"><?php echo __("CF_cate_vid")?>:</label>
						<?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>			
                    </p>

                    <p>

                        <label for="keywords"><?php echo __("CF_key")?>:</label>

                        <input type="text" class="medium" name="keywords" id="keywords" value="<?php echo $keywords ?>" />
                        <?php echo form_error('keywords')?>
                    </p>
					
                    <p>
                        <label for="description"><?php echo __("CF_des")?>:</label>
                        <textarea name="description" id="description" rows="4" cols=""><?php echo $description ?></textarea>
                        <?php echo form_error('description')?>
                    </p>
					                    					
                    <p>
                        <label for="approved"><?php echo __("CF_approved")?>:</label>
                    </p>					
                    <select name="approved" class="short">
                        <option value="1" <?php if($appr==1) echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
                        <option value="0" <?php if($appr==0) echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
                    </select>					
			
                    <p>
                        <label for="name"></label><input type="submit" name="submit" class="submit" value="<?php echo __("CF_update")?>" />
                    </p>

                    <?php echo form_close();?>
			  
                   </div>
              <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

           
           