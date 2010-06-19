            <div id="content">

              <div class="x2">

                    <h3>Profile administrator</h3>
                    <ul>
                        <li><a href="<?php echo site_url('admin/list_admin')?>">Administrator List</a></li>
                        <li><a href="<?php echo site_url('admin/add_new_admin')?>">New administrator</a></li>
                        <li><a href="<?php echo site_url('admin/list_user')?>">User List</a></li>
                        <li><a href="<?php echo site_url('admin/list_video_conference')?>">Video conference List</a></li>
                        <li><a href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
                    </ul>
                    <p>&nbsp;	</p>
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
  