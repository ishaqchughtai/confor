	<div class="content_item">
	<h3><?php echo __("CF_add_meta")?></h3>
						<?php
						echo form_open('metadata/add_static/'.$type_sources.'/'.$lg);
						?>
							<p>			
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input class="medium" name="title" id="title"/>						
						</p>
                        
                        <p>			
							<label for="description"><?php echo __("CF_des")?>:</label>
							<textarea class="medium" name="description" id="description" rows="5"></textarea>
													
						</p>
						
						
						<p>
						
							<label for="keywords"><?php echo __("CF_key")?>:</label>
							<input class="medium" name="keywords" id="keywords"/>
													
						</p>
                        
                        <p>
						
							<label for="author"><?php echo __("CF_author")?>:</label>
							<input class="medium" name="author" id="author"/>
													
						</p>
						
						<p>
						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_add")?>" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
						</p>
					<?php
						echo form_close();
						?>
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
                
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>