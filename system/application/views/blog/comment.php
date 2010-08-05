<?php $this->load->view("admin/admin_menu_blog");?>  

<div id="header_info">
    <div class="left">
        <a href="<?php echo site_url('blog/comment_not_agree')?>"><?php echo __("CF_blog_not_approved")?></a> // <a href="<?php echo site_url('blog/comment_agree')?>"><?php echo __("CF_blog_approved")?></a>           
    </div>
</div>

<!-- /.content_item -->
<div class="content_item">     
    <table width="100%" border="1">
        <tr align="left">
            <th width="20%"><?php echo __("CF_your_name")?></th>       
            <th width="10%"><?php echo __("CF_email")?></th>    
            <th width="10%"><?php echo __("CF_blog_body")?></th>    
            <th width="15%"><?php echo __("CF_date")?></th>
            <th width="15%"><?php echo __("CF_approved")?></th>
            <th width="20%"><?php echo __("CF_action")?></th>
        </tr>
        <?php foreach($query_show_comment_agree as $row){                               
                $id = $row['ID'];
                $comment = $row['Comment'];                       
                $author = $row['Author'];                                
                $idbog = $row['Blog'];
                $email = $row['Email'];
                $CountComment = $row['CountComment'];
                $date = $row['Date'];
                $Status = $row['Status'];
                $Spamemail=$row['Spamemail'];
                if($Status==1)
                {
                    $str_status=__("CF_yes");
                }else
                {
                    $str_status=__("CF_No");
                }
                $final_date=date("d-m-Y", strtotime($date));      
            ?>    
            <tr>
                <td><?php echo $author?></td>
                <?php if($Spamemail==1){?>
                    <td><?php echo $email;?><img style="border:none; float: right;" src="<?php echo base_url().'assets/img/lock.png'?>" alt="" title="<?php echo __("CF_spamemail")?>"></td>
                    <?php }else{?>
                    <td><?php echo $email;?></td>
                    <?php }?>
                <td><label><a href="<?php echo site_url('blog/comment_entry'.'/'.$id)?>"><?php echo __("CF_views")?></a></label></td>
                <td><?php echo $final_date?></td>
                <td><?php echo $str_status?></td>
                <td><li style="list-style-type:none">
                        <div align="center"><label><a href="<?php echo site_url('blog/edit_comment').'/'.$id.'/'.$idbog.'/'.$Status.'/'.$CountComment?>" onclick="return confirm('<?php echo __("CF_mess_not_approved")?>')"><?php echo __("CF_edit")?></a></label></div>
                    </li>
                    <li style="list-style-type:none">
                        <div align="center"><label><a href="<?php echo site_url('blog/delete_comment').'/'.$id.'/'.$idbog.'/'.$Status.'/'.$CountComment?>"onclick="return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo __("CF_remove")?></a></label></div>
                    </li>
                    <li style="list-style-type:none">
                    <?php if($Spamemail==1){?>
                        <div align="center"><label><a href="<?php echo site_url('spamemail/index')?>"><?php echo __("CF_remove_spamemail")?></a></label></div>
                    <?php }else{?>    
                        <div align="center"><label><a href="<?php echo site_url('spamemail/add_spam_email_comment'.'/'.$email)?>"onclick="return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo __("CF_spamemail_add")?></a></label></div>
                    <?php }?>
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
    

