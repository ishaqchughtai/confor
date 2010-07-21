<style>
	.order_field
	{
		width:100px;float:left;margin-right:8px;
	}
</style>
<?php
	$num_per_page_video_i = array(
		'name' => 'num_per_page_video',
		'style' => 'width:60px',
		'value' => $num_per_page_video
	);		
	$num_per_page_conf_i = array(
		'name' => 'num_per_page_conf',
		'style' => 'width:60px',
		'value' => $num_per_page_conf
	);		
	$num_per_page_blog_i = array(
		'name' => 'num_per_page_blog',
		'style' => 'width:60px',
		'value' => $num_per_page_blog
	);			
	$yes_no_option = array(
		0 => 'no',
		1 => 'yes'
	);		
	$sort_option = array(
		'asc' => 'ASC',
		'desc' => 'DESC'
	);			
?>
<?php echo form_open('system/setting');?>

<div class="x2 frame">       
    	<h3>Frontend settings</h3>		
		<div class="frame_content">								
			<div class="input text">
				<label>Conferences per page</label>
				<?php echo form_input($num_per_page_conf_i);?>
			</div>					
			<?php echo form_error('num_per_page_conf');?>
			
			<div class="input text">
				<label>Videos per page</label>		
				<?php echo form_input($num_per_page_video_i);?>
			</div>					
			<?php echo form_error('num_per_page_video');?>
							
			<div class="input text">
				<label>Blogs per page</label>
				<?php echo form_input($num_per_page_blog_i);?>
			</div>					
			<?php echo form_error('num_per_page_blog');?>							
			
			<div class="input text">
				<label>Conference : Order by field</label>
				<p>
				<?php echo form_dropdown('order_conf_field', $order_conf_option, $order_conf_field,'class="order_field"');?>
				<?php echo form_dropdown('order_conf_sort', $sort_option, $order_conf_sort,'style="width:70px"');?>
				</p>
			</div>					
			<?php echo form_error('order_conf_field');?>	
			
			<div class="input text">
				<label>Video : Order by field</label>
				<p>				
				<?php echo form_dropdown('order_video_field', $order_video_option, $order_video_field,'class="order_field"');?>
				<?php echo form_dropdown('order_video_sort', $sort_option, $order_video_sort,'style="width:70px"');?>
				</p>				
			</div>					
			<?php echo form_error('order_video_field');?>	
			
			<div class="input text">
				<label>Blog : Order by field</label>
				<p>
				<?php echo form_dropdown('order_blog_field', $order_blog_option, $order_blog_field,'class="order_field"');?>
				<?php echo form_dropdown('order_blog_sort', $sort_option, $order_blog_sort,'style="width:70px"');?>
				</p>
			</div>					
			<?php echo form_error('order_blog_field');?>													
		</div>				
    <div class="frame_bottom"></div>	
</div>

<div class="x2 frame no_margin">	
    <h3>System settings</h3>
	<div class="frame_content">
		<div class="input text">
			<label>Site offline</label>		
			<?php echo form_dropdown('site_off', $yes_no_option, $site_off,'style="width:60px"');?>
		</div>	
	</div>
    <div class="frame_bottom"></div>		
</div>
<p>&nbsp;</p>
<input type="submit" class="submit" name="update" value="Update">
<div class="divider"></div>
</form>			