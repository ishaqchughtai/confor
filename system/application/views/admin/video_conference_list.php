            <div class="">

                <h3>Administrator Menu</h3>
                <ul>
                    <li><a href="<?php echo site_url('admin/list_admin')?>">Administrator List</a></li>
                    <li><a href="<?php echo site_url('admin/add_new_admin')?>">New administrator</a></li>
                    <li><a href="<?php echo site_url('admin/list_user')?>">User List</a></li>
                    <li><a href="<?php echo site_url('admin/list_ticket')?>">Ticket List</a></li>
                    <li><a href="<?php echo site_url('admin/list_video_conference')?>">Video conference List</a></li>
                    <li><a href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
					
                </ul>
                <p>&nbsp;	</p>
                <h3>VIDEO CONFERENCE LIST </h3>
				
				
<table border="0" cellpadding="0" cellspacing="1" style="width:100%">
 <tr>
	<th>Edit</th>
	<th>Delete</th>
	<th width="120">Screenshot</th>	
	<th width="157">Date</th>
	<th width="139">Tittle</th>
	<th width="157">Subject</th>
	<th width="114">Category </th>
	<th width="114">Viewed</th>	
</tr>
<?php foreach ($query as $row):?>
 <tr>
	<td>&nbsp;<a href="<?php echo site_url('admin/edit_video_conference/'.$row['ID'])?>">Edit</a>&nbsp;</td>
 	<td>&nbsp;<a href="<?php echo site_url('admin/delete_video_conference/'.$row['ID'])?>">Delete</a>&nbsp;</td>
	<td><?php echo img('noimage.gif');?></td>
	<td><?php echo $row['Date']?></td>
	<td><?php echo $row['Title']?></td>
	<td><?php echo $row['Subject']?></td>
	<td>--</td>
	<td><?php echo $row['Viewed']?></td>
	
 </tr>
<?php endforeach?>
</table>

<?php //echo $paginate; ?>
				
                <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
       