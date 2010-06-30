<div id="content">

    <div class="">
        <h3><?php echo __("CF_user_list")?></h3>
        <table border="1" width="1000">
            <tr align="left">
                <th width="88"><?php echo __("CF_first_name")?></th>
                <th width="121"><?php echo __("CF_company")?></th>
                <th width="205"><?php echo __("CF_email")?></th>
                <th width="109"><?php echo __("CF_country")?></th>
                <th width="124"><?php echo __("CF_des")?></th>
                <th width="96"><?php echo __("CF_sup")?></th>
                <th width="111"><?php echo __("CF_status_acc")?> </th>
                <th width="44"><?php echo __("CF_action")?></th>
            </tr>
            <tr>
                <ul id="pagination">
                    <li><?php echo $pagination?></li>
                </ul>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['username']?></td>
                    <td><?php echo $row['company_name']?></td>
                    <td><?php echo $row['email']?></td>
                    <td><?php echo $row['name']?></td>
                    <td><?php echo $row['description']?></td>
                    <td><?php echo $row['userlevel']?></td>
                    <td><?php if((int)$row['status']=='0'){echo 'suspended';}else{echo 'activate';} ?></td>
                    <td><a href="<?php echo site_url("admin/modify_user/".$row['id'])?>"><?php echo __("CF_modify")?></a></td>
                    <td width="45"><a href="<?php echo site_url("/admin/delete_user/".$row['id'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
                </tr>
                <?php endforeach;?>
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
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
   