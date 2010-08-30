<?php
// included from popup.php

if($image_count >= 1){ 
	?>
	<td valign="top" width="230" align="center">
		
		<div id="image_box">
			<?php if($image_count>1){
				// show left/righ arrows
				?>
				<a href="#" id="image_nav_left">&laquo;</a>
				<a href="#" id="image_nav_right">&raquo;</a>
				<?php
			}
			?>
			<ul id="images">
			<?php 
			$image_id = 0;
			$first_image = false;
			foreach($images as $image){ 
				// work out the real path to the image.
				if(!preg_match('#^https?://#i',$image)){
					if($image[0] == '/'){
						// relative to base of host.
						$parts = parse_url($url);
						$image = ($parts['scheme'] ? $parts['scheme'] : 'http') . '://' . $parts['host'] . $image;
					}else{
						$image = dirname($url) . '/' . $image;
					}
				}
				if(!$first_image){
					$first_image = $image;
				}
				?>
				<li id="image_<?php echo $image_id;?>"<?php if($image_id>0)echo ' style="display:none;"';?>>
					<a href="<?php echo $image;?>" title="Cliquez ici pour visualiser l'image" target="_blank"><img src="<?php echo $image;?>" border="0"></a>
				</li>
				<?php 
				$image_id++;
			} 
			?>
			</ul>
			<span id="images_none">
				<input type="checkbox" name="no_image" id="no_image" value="true"> <span>pas  d'image</span>
			</span>
		</div>
		<input type="hidden" name="image_url" id="image_url" value="<?php echo htmlspecialchars($first_image);?>">
	</td>
<?php } 

?>