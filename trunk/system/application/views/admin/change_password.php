<?php 
    $admin_id=$this->session->userdata('admin_id');
    $admin_right=(int)$this->session->userdata('right');  
?>
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
        <h3>CHANGE YOUR PASSWORD</h3>
        <?php echo $this->validation->error_string; ?>
        <?php echo form_open('admin/change_pass/'.$admin_id); ?>

        <label for="oldPass">ENTER OLD PASSWORD:</label>
        <input class="medium" name="txtOldPass" type="password" id="txtOldPass" />
        <?php echo form_error("txtOldPass"); ?>

        <label for="newPass">ENTER NEW PASSWORD:</label>
        <input class="medium" name="txtNewPass" type="password" id="txtNewPass" />
        <?php echo form_error("txtNewPass"); ?>

        <label for="reconfirmPass">RECONFIRM NEW PASSWORD:</label>
        <input class="medium" name="txtConfirmPass" type="password" id="txtConfirmedPass" />
        <?php echo form_error("txtConfirmPass"); ?>
        <label style=" color: red;"><?php echo $error?> </label>
        <label>
            <input type="submit" name="submit" value="<?php echo __("CF_submit")?>" size="20" class="submit" />
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
   