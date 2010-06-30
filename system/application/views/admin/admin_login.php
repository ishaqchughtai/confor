				<div class="content_item" align="left" style="height:300px">
					<h3><?php echo __("CF_admin_login")?> </h3>
					<div>
					<?php echo form_open('admin/login/')?>
                      <div class="login_block">
                        <label for="label" ><?php echo __("CF_admin_email")?> :</label>
                        <input type="text" id="label" name="admin_email" />
                      </div>
					  <div class="login_block">
                        <label for="label2"><?php echo __("CF_admin_pass")?>:</label>
                        <input type="password" id="label2" name="admin_pass" />
                      </div>					  
					  <div class="login_block_submit">
                        <p>
                          <input type="submit" name="Submit" value="<?php echo __("CF_submit")?>" class="submit" />
                        </p>              
                      </div>
				  </form>
				  </div>
					<p>&nbsp;</p>

				</div>
 
				  <div>
					<?php echo $this->validation->error_string; ?>  
					<?php echo $error?>					
				  </div>