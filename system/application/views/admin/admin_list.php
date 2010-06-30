<div class="">
    <?php 
        $admin_id=$this->session->userdata('admin_id');
        $admin_right=(int)$this->session->userdata('right');  
    ?>
    <h3><?php echo __("CF_admin_panel")?></h3>
    <ul class="link_conttrol">
        <?php if($admin_right==1){?>
            <li><a class="icon_list" href="<?php echo site_url('admin/list_admin');?>"><?php echo __("CF_admin_list")?></a></li>
            <li><a class="icon_add" href="<?php echo site_url('admin/add_new_admin');?>"><?php echo __("CF_new_admin")?></a></li>
            <?php }?>
        <li><a class="icon_add" href="<?php echo site_url('admin/edit_profile/'.$admin_id);?>"><?php echo __("CF_edit_admin")?></a></li>
    </ul>
    <p>&nbsp;</p>
    <table width="820" border="1">
        <tr align="left">
            <th width="92"><?php echo __("CF_name")?></th>   
            <th width="112"><?php echo __("CF_first_name")?></th>
            <th width="211"><?php echo __("CF_email")?></th>    
            <th width="223"><?php echo __("CF_paypal")?></th>
            <th width="87"><?php echo __("CF_action")?></th>
        </tr>
        <?php foreach($query as $row):?>
            <tr>
                <td><?php echo $row['Name']?></td>
                <td><?php echo $row['FirstName']?></td>
                <td><?php echo $row['Email']?></td>
                <td><?php echo $row['PayPalAccount']?></td>
                <td><li style="list-style-type:none">
                        <div align="center"><a href="<?php echo site_url("/admin/edit_admin/".$row['ID'])?>"><?php echo __("CF_edit")?></a></div>
                    </li></td>  
            </tr>
            <?php endforeach; ?>
    </table>
    <ul id="pagination">
                <li><?php echo $pagination?></li>
            </ul>

    <!-- /.x2 - represents a half windows size div -->
    <!-- /.x2 - represents a half windows size div -->
    <!--                  -->
    <!-- END OF .x2 CLASS -->
    <!--                  -->
    <div class="divider"></div>
    <!-- /.divider -->
    <!-- /.x4 - represents a fourth windows size div -->

            </div>        
