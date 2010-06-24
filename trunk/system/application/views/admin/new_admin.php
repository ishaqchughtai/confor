<div id="content">
    <div class="x2">
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
        <h3>Add new administrator</h3> 
        <h4 style=" color: red"><?php echo $error;?></h4>
        <?php echo form_open('admin/add_new_admin/'); ?>
        <p>
            <label for="name">Name:</label>
            <input class="medium" name="txtName" id="name" /><?php echo form_error("txtName"); ?>
        </p>
        <p>
            <label for="FirstName">First Name:</label>
            <input class="medium" name="txtFirstName" id="name" /><?php echo form_error("txtFirstName"); ?>
        </p>
        <p>
            <label for="email">Email address:</label>
            <input class="medium" name="txtEmail" id="name" /><?php echo form_error("txtEmail"); ?>
        </p>
        <p>
            <label for="paypayacount">PayPal Account:</label>
            <input class="medium" name="txtpayPayAccount" id="name" /><?php echo form_error("txtpayPayAccount"); ?>
        </p>
        <p>
            <label for="password">Password:</label>
            <input class="medium" name="txtPassword" id="name" /><?php echo form_error("txtPassword"); ?>
        </p>
        <p>
            <input name="submit" type="submit" class="submit" value="ADD" />
            <input name="reset" type="reset" class="reset" value="RESET" />
        </p>
        <?php form_close();?>
    </div>
    <!-- /.x2 - represents a half windows size div -->
    <!-- /.x2 - represents a half windows size div -->
    <!--                  -->
    <!-- END OF .x2 CLASS -->
    <!--                  -->
    <div class="divider"></div>
    <!-- /.divider -->
    <!-- /.x4 - represents a fourth windows size div -->

            </div>
  