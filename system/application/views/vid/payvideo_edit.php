<?php
	if(isset($row)):
		$id=$row->vid_id;
		$title=$row->title;									
		$keywords=$row->tags;
		$description=$row->description;							
		$appr = $row->approved;			
?>   
              <div class="x2">					
					<?php $this->load->view("vid/payvideo_menu",array("lg"=>$lg));?>                    
                    <h3> Update video for sale </h3>
                    <?php echo form_open('payvid/edit_payvideo/'.$id);?> 										
                    <p>
                        <label for="title"><?php echo __("CF_title")?>:</label>
                        <input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" />
                        <?php echo form_error('title')?>
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
                <div class="divider"></div>
<?php endif;?>
           
           