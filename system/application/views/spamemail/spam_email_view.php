<?php $this->load->view("spamemail/admin_menu_spam_menu.php");?>  
  <!-- /.content_item -->
  <h2><?php echo __("CF_spamemail_list")?></h2>
<div class="content_item">     
    <table width="100%" border="1">
        <tr align="left">
            <th width="90%">Email</th>       
            <th width="10%"><?php echo __("CF_action")?></th>
        </tr>
                <?php foreach($query as $row){                               
                                $id = $row['ID'];
                                $Email = $row['Email'];                                                           
        ?>    
            <tr>
                <td><?php echo $Email?></td>
                <td>
                    <li style="list-style-type:none">
                        <div align="center"><label><a href="<?php echo site_url('spamemail/delete_spam_email').'/'.$id.'/'.$Email?>"onclick="return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo __("CF_remove")?></a></label></div>
                    </li>
                </td> 
            </tr>
            <?php }?>
        <tr>
            <td colspan="8" valign="center">               
                <ul id="pagination">
                    <?php echo $pagination?>
                </ul>
            </td>
        </tr> 
    </table>
</div>
