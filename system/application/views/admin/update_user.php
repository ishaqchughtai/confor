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
                    <?php 
                        foreach($query as $row)
                        {
                            $id = $row['ID'];
                            $name=$row['Name'];
                            $company=$row['CompanyName'];
                            $email=$row['Email'];
                            $country=$row['Country'];
                            $password=$row['Password'];
                            $description=$row['Description'];
                            $subscription=$row['Subscription'];     
                            $suspend=$row['Suspend'];
                    }?>
                    <h3>User List</h3> 
                    <?php echo form_open('admin/modify_user/'.$id); ?>
                        <label for="name">Name:</label>
                        <input class="medium" name="txtName" id="name" value="<?php echo $name?>" /><?php echo form_error("txtName"); ?>
                        <label for="CompanyName">Company name:</label>
                        <input class="medium" name="txtCompanyName" id="companyName" value="<?php echo $company?>" /><?php echo form_error("txtCompanyName"); ?>
                        <label for="email">Email address:</label>
                        <input class="medium" name="txtEmail" id="email" value="<?php echo $email?>" /><?php echo form_error("txtEmail"); ?>
                        <label for="Country">Country:</label>
                        <input class="medium" name="txtCountry" id="country" value="<?php echo $country?>" /><?php echo form_error("txtCountry"); ?>
                        <label for="Description">Description:</label>
                        <input class="medium" name="txtDescription" id="description" value="<?php echo $description?>" /><?php echo form_error("txtDescription"); ?>
                        <label for="Subcription">Type of Subcription:</label>
                        <input class="medium" name="txtSubcription" id="subcription" value="<?php echo $subscription?>" /><?php echo form_error("txtSubcription"); ?>
                        <?php if((int)$suspend==0){?>
                            <label>(Active,</label> 
                            <input name="radiobutton" type="radio" value="0" class="checkbox" checked="<?php echo 'checked';?>"/>
                            <label>Suspended)</label> 
                            <input name="radiobutton" type="radio" value="1" class="checkbox" />
                            <?php }else{?>
                            <label>(Active,</label>
                            <input name="radiobutton" type="radio" value="0" class="checkbox" />
                            <label>Suspended)</label>
                            <input name="radiobutton" type="radio" value="1" class="checkbox"  checked="<?php echo 'checked';?>"/>
                            <?php }?>
                        <p><input name="submit" type="submit" class="submit" value="SAVE" /></p>
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
          