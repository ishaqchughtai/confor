            <div id="content">

                <div class="x2">
                    <?php 
                        foreach($query as $row)
                        {
                            $id = $row['id'];
                            $name=$row['name'];
                            $company=$row['company_name'];
                            $email=$row['email'];
                            $password=$row['password'];
                            $description=$row['description'];
                            $subscription=$row['userlevel'];     
                            $suspend=$row['status'];
                    }?>
                    <h3><?php echo __("CF_modify_speaker")?></h3> 
                    <?php echo form_open('admin/modify_user/'.$id); ?>
                        <label for="name"><?php echo __("CF_name")?>:</label>
                        <input class="medium" name="txtName" id="name" value="<?php echo $name?>" /><?php echo form_error("txtName"); ?>
                        <label for="CompanyName"><?php echo __("CF_Company_name")?>:</label>
                        <input class="medium" name="txtCompanyName" id="companyName" value="<?php echo $company?>" /><?php echo form_error("txtCompanyName"); ?>
                        <label for="email"><?php echo __("CF_admin_email")?>:</label>
                        <input class="medium" name="txtEmail" id="email" value="<?php echo $email?>" /><?php echo form_error("txtEmail"); ?>
                        <label for="Country"><?php echo __("CF_country")?>:</label>
                        <select name="txtCountry" class="medium">
                        <?php foreach($country as $countries):?>
                        <option  value="<?php echo $countries['con_id']?>"><?php echo $countries['name']?></option>
                        <?php endforeach;?>
                        </select>
                        <label for="Description"><?php echo __("CF_des")?>:</label>
                        <textarea name="txtDescription" id="txtDescription" rows="4" cols=""><?php echo $description ?></textarea>
                        <?php echo form_error("txtDescription"); ?>
                        <?php if((int)$suspend==0){?>
                            <label>(<?php echo __("CF_suspended")?>,</label> 
                            <input name="radiobutton" type="radio" value="0" class="checkbox" checked="<?php echo 'checked';?>"/>
                            <label><?php echo __("CF_active")?>)</label> 
                            <input name="radiobutton" type="radio" value="1" class="checkbox" />
                            <?php }else{?>
                            <label>(<?php echo __("CF_suspended")?>,</label>
                            <input name="radiobutton" type="radio" value="0" class="checkbox" />
                            <label><?php echo __("CF_active")?>)</label>
                            <input name="radiobutton" type="radio" value="1" class="checkbox"  checked="<?php echo 'checked';?>"/>
                            <?php }?>
                        <p><input name="submit" type="submit" class="submit" value="<?php echo __("CF_save")?>" /></p>
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
          