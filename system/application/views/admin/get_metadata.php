	<div class="content_item">
	<?php if($meta):?>
	<?php		
		foreach($meta as $row)
		{
			$id = $row['id'];
			$author = $row['author'];
			$title = $row['title'];
			$keywords = $row['keywords'];
			$description = $row['description'];						
		}
	?>
			
				
				
					<h3><?php echo __("CF_edit_meta")?></h3>
						<?php
						echo form_open('metadata/edit/'.$id);
						?>
							<p>			
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input class="short" name="title" id="title" value="<?php echo $title?>" />						
						</p>
                        
                        <p>			
							<label for="description"><?php echo __("CF_des")?>:</label>
							<input class="short" name="description" id="description" value="<?php echo $description?>" />
													
						</p>
						
						
						<p>
						
							<label for="keywords"><?php echo __("CF_key")?>:</label>
							<input class="short" name="keywords" id="keywords" value="<?php echo $keywords?>" />
													
						</p>
                        
                        <p>
						
							<label for="author"><?php echo __("CF_author")?>:</label>
							<input class="short" name="author" id="author" value="<?php echo $author?>" />
													
						</p>
						
						<p>
						
							<input name="btnedit" type="submit" class="submit" value="<?php echo __("CF_edit")?>" onclick="return confirm('<?php echo __("CF_mess_update")?>');" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
						
						</p>
					<?php
						echo form_close();
						?>
                        <?php else:?>
<p class="not_warning "><span class="img"></span><?php echo __("CF_not_meta")?>. <?php echo __("CF_click")?> <a href="<?php echo site_url('metadata/add/'.$type_sources.'/'.$id_sources)?>"><?php echo __("CF_here")?></a> <?php echo __("CF_to_add_meta")?><span class="close"></span></p><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<?php endif;?>
	
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
                
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>