<div id="content">
    <div class="x2">
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
        <h3><?php echo __("CF_add_admin")?></h3> 
        <h4 style=" color: red"><?php echo $error;?></h4>
        <?php echo form_open('admin/add_new_admin/'); ?>
        <p>
            <label for="name"><?php echo __("CF_name")?>:</label>
            <input class="medium" name="txtName" id="name" /><?php echo form_error("txtName"); ?>
        </p>
        <p>
            <label for="FirstName"><?php echo __("CF_first_name")?>:</label>
            <input class="medium" name="txtFirstName" id="name" /><?php echo form_error("txtFirstName"); ?>
        </p>
        <p>
            <label for="email"><?php echo __("CF_email")?>:</label>
            <input class="medium" name="txtEmail" id="name" /><?php echo form_error("txtEmail"); ?>
        </p>
        <p>
            <label for="paypayacount"><?php echo __("CF_paypal")?>:</label>
            <input class="medium" name="txtpayPayAccount" id="name" /><?php echo form_error("txtpayPayAccount"); ?>
        </p>
        <p>
            <label for="password"><?php echo __("CF_pass")?>:</label>
            <input class="medium" name="txtPassword" id="name" /><?php echo form_error("txtPassword"); ?>
        </p>
        <p>
            <input name="submit" type="submit" class="submit" value="<?php echo __("CF_add")?>" />
            <input name="reset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
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
  