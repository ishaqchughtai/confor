<?php if(isset($row)):?>   
              							
                    <h3>Update Email Template</h3>
                    <?php echo form_open('email/template_edit/'.$row->id);?> 										
                    <p>
                        <label>Template Name</label>
                        <input type="text" class="medium" name="name" id="name" value="<?php echo $row->name ?>" />
                        <?php echo form_error('name')?>
                    </p>          					       

                    <p>
                        <label>Email Subject</label>
                        <input type="text" class="medium" name="subject" id="subject" value="<?php echo $row->subject ?>" />
                        <?php echo form_error('subject')?>
                    </p>
					
                    <p>
                        <label>Email Body</label>
                        <textarea name="body" id="body" rows="30" class="large"><?php echo $row->body?></textarea>
                        <?php echo form_error('body')?>
                    </p>					                    				
                    <p>
                        <label></label><input type="submit" name="submit" class="submit" value="<?php echo __("CF_update")?>" />
                    </p>

                    <?php echo form_close();?>
			  
              
                <div class="divider"></div>
<?php endif;?>
           
           