<div id="content">

    <div class="x2">
        <?php 

            $selected_country_setting = array
            (
            'table_name' => 'geo_countries',
            'key_field' => 'con_id',
            'value_field' => 'name'
            );        
            if ($query)
            {
                $id = $query->id;
                $name=$query->name;
                $firstname=$query->first_name; 
                $company=$query->company_name;
                $email=$query->email;
                $password=$query->password;
                $description=$query->description;
                $subscription=$query->userlevel;     
                $suspend=$query->status;
                $selected_country = $query->country;     //
            }                     
        ?>           
        <h3><?php echo __("CF_modify_speaker")?></h3>                              
        <?php echo form_open('admin/modify_user/'.$id); ?>
        <label for="name"><?php echo __("CF_name")?>:</label>
        <input class="medium" name="txtName" id="name" value="<?php echo $name?>" onblur="alert('<?php echo __("CF_check_update_user")?>');" /><?php echo form_error("txtName"); ?>
        <label for="firstname"><?php echo __("CF_first_name")?>:</label>
        <input class="medium" name="txtFirstName" id="firstname" value="<?php echo $firstname?>"  /><?php echo form_error("txtFirstName"); ?>
        <label for="CompanyName"><?php echo __("CF_Company_name")?>:</label>
        <input class="medium" name="txtCompanyName" id="companyName" value="<?php echo $company?>" /><?php echo form_error("txtCompanyName"); ?>
        <label for="email"><?php echo __("CF_admin_email")?>:</label>
        <input class="medium" name="txtEmail" id="email" value="<?php echo $email?>" /><?php echo form_error("txtEmail"); ?>
        <label><?php echo __("CF_country")?>(*)</label>
        <?php echo  form_dropdown('country', dropdown_data($selected_country_setting),$selected_country, ' class="short"');?>

        <label for="Description"><?php echo __("CF_des")?>:</label>
        <textarea name="txtDescription" id="txtDescription" rows="4" cols=""><?php echo $description ?></textarea>
        <?php echo form_error("txtDescription"); ?>

            <label>(<?php echo __("CF_active")?> , <?php echo __("CF_suspended")?>)</label>                   
            <select name="approved" class="short">
                <option value="1" <?php if($suspend==1) echo 'selected="selected"';?>><?php echo __("CF_active")?></option>
                <option value="0" <?php if($suspend==0) echo 'selected="selected"';?>><?php echo __("CF_suspended")?></option>
            </select>

        <p><input name="submit" type="submit" class="submit" value="<?php echo __("CF_save")?>"/></p>
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
          