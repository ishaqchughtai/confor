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
        <?php 
            foreach($query as $row)
            {
                $id = $row['ID'];
                $name=$row['Name'];
                $firstname=$row['FirstName'];
                $email=$row['Email'];
                $paypalaccount=$row['PayPalAccount'];
                $password=$row['Password'];
        }?>
        <h3><?php echo __("CF_udpate_admin")?></h3>
        <?php 
        if($admin_right==1)
        {
            $link_edit='admin/edit_admin/'.$id;
        }
        else
        {
            $link_edit='admin/edit_profile/'.$id;
        }
        ?> 
        <?php echo $this->validation->error_string; ?>
        <?php echo form_open($link_edit); ?>

        <label for="name"><?php echo __("CF_name")?>:</label>
        <input class="medium" name="txtName" id="name" value="<?php echo $name?>" />
        <?php echo form_error("txtName"); ?>

        <label for="first_name"><?php echo __("CF_first_name")?>:</label>
        <input name="txtFirstName" type="text" value="<?php echo $firstname ?>" size="40" />
        <?php echo form_error("txtFirstName"); ?>

        <label for="email"><?php echo __("CF_email")?>:</label>
        <input name="txtEmail" type="text" value="<?php echo $email ?>" size="40" />
        <?php echo form_error("txtEmail"); ?>

        <label for="PayPalAccount"><?php echo __("CF_paypal")?>:</label>
        <input name="txtpayPayAccount" type="text" value="<?php echo $paypalaccount ?>" size="40" />
        <?php echo form_error("txtpayPayAccount"); ?>
        <label>
            <input type="submit" name="Submit" value="<?php echo __("CF_submit")?>" size="20" class="submit" />
        </label>
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
   