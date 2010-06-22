            <div class="">

                <h3><?php echo __("CON_video_list")?></h3>
				<?php $this->load->view("admin/admin_menu_video");?>				
                <p>&nbsp;	</p>
                <h3><?php echo __("CON_list_view")?></h3>
<label>Category</label>
<select id="category" name="video_category" style="width:200px">
  <option value="0" selected="selected" >(all)</option>
  <option value="1">Action</option>
  <option value="2">Animation</option>
  <option value="3">Comedy</option>
</select>				

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
	<td>&nbsp;<a href="<?php echo site_url('admin/edit_video_conference/'.$row['ID'])?>">Edit</a>&nbsp;|&nbsp;<a href="<?php echo site_url('admin/delete_video_conference/'.$row['ID'])?>">Del</a>&nbsp;</td>
	<td><?php echo img('flickr1.gif');?></td>
	<td><?php echo $row['Date']?></td>
	<td><?php echo $row['Title']?></td>
	<td><?php echo $row['Subject']?></td>	
	<td><?php echo $row['Viewed']?></td>
	
 </tr>
<?php endforeach?>
</table>

<?php //echo $paginate; ?>

                <div class="divider"></div>


            </div>
       