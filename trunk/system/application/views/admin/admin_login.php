				<div class="content_item" align="left" style="height:300px">
					<h3>ADMINISTRATOR LOGIN </h3>
					<div>
					<?php echo form_open('admin/login/')?>
                      <div class="login_block">
                        <label for="label" >Email Address :</label>
                        <input type="text" id="label" name="admin_email" />
                      </div>
					  <div class="login_block">
                        <label for="label2">Password:</label>
                        <input type="password" id="label2" name="admin_pass" />
                      </div>					  
					  <div class="login_block_submit">
                        <p>
                          <input type="submit" name="Submit" value="Submit" class="submit" />
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