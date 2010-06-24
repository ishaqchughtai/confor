<div class="">
    <?php 
        $admin_id=$this->session->userdata('admin_id');
        $admin_right=(int)$this->session->userdata('right');  
    ?>
    <h3>Administrator Panel</h3>
    <ul class="link_conttrol">
        <?php if($admin_right==1){?>
            <li><a class="icon_list" href="<?php echo site_url('admin/list_admin');?>">Administrator List</a></li>
            <li><a class="icon_add" href="<?php echo site_url('admin/add_new_admin');?>">New administrator</a></li>
            <?php }?>
        <li><a class="icon_add" href="<?php echo site_url('admin/edit_profile/'.$admin_id);?>">Edit Profile</a></li>
    </ul>
    <p>&nbsp;</p>
    <table width="759" border="1">
        <tr align="left">
            <th width="92">Name</th>   
            <th width="112">First Name</th>
            <th width="211">Email</th>    
            <th width="223">PayPal Account Email</th>
            <th width="87">Action</th>
        </tr>
        <?php foreach($query as $row):?>
            <tr>
                <td><?php echo $row['Name']?></td>
                <td><?php echo $row['FirstName']?></td>
                <td><?php echo $row['Email']?></td>
                <td><?php echo $row['PayPalAccount']?></td>
                <td><li style="list-style-type:none">
                        <div align="center"><a href="<?php echo site_url("/admin/edit_admin/".$row['ID'])?>">EDIT</a></div>
                    </li></td>  
            </tr>
            <?php endforeach; ?>
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