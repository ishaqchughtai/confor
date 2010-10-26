<div id="content">

    <div class="">
    
        <h3><?php echo __("CF_user_list")?></h3>
        <table border="1" width="100%">
            <tr align="left">
                <th width="34%"><?php echo __("CF_name")?></th>
                <th width="40%"><?php echo __("CF_email")?></th>
                <th width="14%"><?php echo __("CF_status_acc")?> </th>
                <th width="2%"><?php echo __("CF_details")?> </th>
                <th width="10%"><?php echo __("CF_action")?></th>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['username']?></td>
                    <td><?php echo $row['email']?></td>
                    <td><?php if((int)$row['status']=='0'){echo 'suspended';}else{echo 'activate';} ?></td>
                    <td><a href="<?php echo site_url('admin/user_details/'.$row['id'])?>"><?php echo __("CF_view_details")?></a>
                    </td>
                    <td>
                        <ul>
                            <li><a href="<?php echo site_url("admin/modify_user/".$row['id'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></li>
                            <li><a href="<?php echo site_url("/admin/delete_user/".$row['id'])?>" onClick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></li>
                        </ul>
                    </td>
                </tr>
                <?php endforeach;?>
            <tr>
                <td colspan="8" height="50" valign="midle">               
                    <ul id="pagination">
                        <?php echo $pagination?>
                    </ul>
                </td>
            </tr>
        </table>
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <div class="divider"></div>
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->
</div>
        
    </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
   