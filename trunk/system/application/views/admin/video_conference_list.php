            <div class="">
<form action="" method="post" enctype="multipart/form-data" class="global" name="video">
                <h3><?php echo __("CON_video_list")?></h3>
				<?php $this->load->view("admin/admin_menu_video");?>				
                <p>&nbsp;	</p>
                <h3><?php echo __("CON_list_view")?></h3>
<label>Category</label>
<select id="category" name="video_category" style="width:200px">
<option value="0" selected="selected" >(all)</option>
<?php foreach($category as $cat):?>
  <option value="<?php echo $cat['ID'];?>"><?php echo $cat['Name'];?></option>
<?php endforeach ?>  
</select>
<input name="btnsubmit" type="submit" class="submit" value="Show" /> 				
</form>       <ul id="pagination">
        <li><?php echo $pagination?></li>
      </ul><p>
  
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
</table>
<p/>


                <div class="divider"></div>


            </div>
       