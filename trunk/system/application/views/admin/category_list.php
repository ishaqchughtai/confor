<div id="content">

    <div class="">
        <h3>List of Video Category</h3>
        <table border="1" width="833">
            <tr align="left">
                <th width="640">Category Name</th>
                <th width="83" colspan="2"><?php echo __("CF_action")?></th>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['Name']?></td>
                    <td><a href="<?php echo site_url("admin/modify_category/".$row['ID'])?>"><?php echo __("CF_modify")?></a></td>
                    <td width="88"><a href="<?php echo site_url("/admin/delete_category/".$row['ID'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
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
   