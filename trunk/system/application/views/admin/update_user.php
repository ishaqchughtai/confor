            <div id="content">

                <div class="x2">
                    <?php 
                        foreach($query as $row)
                        {
                            $id = $row['id'];
                            $name=$row['name'];
                            $company=$row['company_name'];
                            $email=$row['email'];
                            $country=$row['country'];
                            $password=$row['password'];
                            $description=$row['description'];
                            $subscription=$row['userlevel'];     
                            $suspend=$row['status'];
                    }?>
                    <h3>MODIFY SPEAKER</h3> 
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
          