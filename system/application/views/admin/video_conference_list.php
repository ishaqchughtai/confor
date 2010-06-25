<?php
	$selected_cate = isset($video_cate)?$video_cate:0; // united kingdom
	$selected_cate_setting = array
	(
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name',
		'init_data' => array('key'=>0,'name'=>'(all)')
	);	
?>

<script type="text/javascript">
$(function(){
	$('#vid_cate').change(function()
	{
		$('#vid_cate :selected').each(function(i, selected){ 		  
			gogo = XEMMEX.baseUrl + "admin/list_video_conference/" + $(selected).val() +"/3";			
			window.location = gogo;			
		});	
	});
});	
	
	
    //-->
</script>
<div class="">
    <h3><?php echo __("CON_video_list")?></h3>
    <?php $this->load->view("admin/admin_menu_video");?>				
    <p>&nbsp;	</p>
    <h3><?php echo __("CON_list_view")?></h3>
    
	<label>Category</label>
	<?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>	
  
    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="65">Action</th>	
            <th width="85">Preview</th>	
            <th width="157">Date</th>
            <th>Tittle</th>
            <th width="157">Subject</th>	
            <th width="40">Viewed</th>	
        </tr>
        <?php foreach ($query as $row):?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('admin/edit_video_conference/'.$row['vid_id'])?>">Edit</a>&nbsp;|&nbsp;<a href="<?php echo site_url('admin/delete_video_conference/'.$row['vid_id'])?>">Del</a>&nbsp;</td>
                <td><?php echo img('flickr1.gif');?></td>
                <td><?php echo $row['date']?></td>
                <td><?php echo $row['title']?></td>
                <td><?php echo $row['category']?></td>	
                <td><?php echo $row['viewed']?></td>
            </tr>

            <?php endforeach ?>
		<tr>
			<td colspan="6" height="50" valign="midle">				
				<ul id="pagination">
					<?php echo $pagination?>
				</ul>
			</td>
		</tr>
			
    </table>
    <p/>


    <div class="divider"></div>


            </div>
       