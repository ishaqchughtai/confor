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
                    <h3>Administrator Data Update</h3> 
                    <?php echo $this->validation->error_string; ?>
                    <?php echo form_open('admin/edit_admin/'.$id); ?>
                    <table width="415" border="0">
                        <tr>
                            <td width="162">Name:</td>
                            <td><input name="txtName" type="text" value="<?php echo $name  ?>" size="40" /><?php echo form_error("txtName"); ?></td>
                        </tr>
                        <tr>
                            <td>First Name </td>
                            <td><input name="txtFirstName" type="text" value="<?php echo $firstname ?>" size="40" /><?php echo form_error("txtFirstName"); ?></td>
                        </tr>
                        <tr>
                            <td>Email address: </td>
                            <td><input name="txtEmail" type="text" value="<?php echo $email ?>" size="40" /><?php echo form_error("txtEmail"); ?></td>
                        </tr>
                        <tr>
                        <tr>
                            <td>PayPalAccount</td>
                            <td><input name="txtpayPayAccount" type="text" value="<?php echo $paypalaccount ?>" size="40" /><?php echo form_error("txtpayPayAccount"); ?></td>
                        </tr> 
                        <td><label>
                          <input type="submit" name="Submit" value="Submit" size="20" class="submit" />
                        </label></td>
                        <td><label>
                            </label></td>
                        </tr>
                    </table>
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
   