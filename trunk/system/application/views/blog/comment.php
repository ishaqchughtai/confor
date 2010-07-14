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
            <th width="10%"><?php echo __("CF_your_name")?></th>   
            <th width="30%"><?php echo __("CF_blog_body")?></th>    
            <th width="15%"><?php echo __("CF_date")?></th>
            <th width="15%"><?php echo __("CF_approved")?></th>
            <th width="15%"><?php echo __("CF_action")?></th>
        </tr>
                <?php foreach($query_show_comment_agree as $row){                               
                                $id = $row['ID'];
                                $comment = $row['Comment'];                       
                                $author = $row['Author'];                                
                                $idbog = $row['Blog'];
                                $CountComment = $row['CountComment'];
                                $date = $row['Date'];
                                $Status = $row['Status'];
                                if($Status==1)
                                {
                                    $str_status=__("CF_yes");
                                }else
                                {
                                    $str_status=__("CF_No");
                                }
                                $final_date=date("F jS Y", strtotime($date));      
        ?>    
            <tr>
                <td><?php echo $author?></td>
                <td><?php echo $comment;?></td>
                <td><?php echo $final_date?></td>
                <td><?php echo $str_status?></td>
                <td><li style="list-style-type:none">
                        <div align="center"><label><a href="<?php echo site_url('blog/edit_comment').'/'.$id.'/'.$idbog.'/'.$Status.'/'.$CountComment?>" onclick="return confirm('<?php echo __("CF_mess_not_approved")?>')"><?php echo __("CF_edit")?></a></label></div>
                    </li>
                    <li style="list-style-type:none">
                        <div align="center"><label><a href="<?php echo site_url('blog/delete_comment').'/'.$id.'/'.$idbog.'/'.$Status.'/'.$CountComment?>"onclick="return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo __("CF_remove")?></a></label></div>
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
    

