<div id="content">

    <div class="x2">
        <?php         
            if ($query)
            {
                $id = $query->id;
                $name=$query->name;
				$first_name = $query->first_name;
                $company=$query->company_name;
                $email=$query->email;
                $password=$query->password;
                $description=$query->description;
                $subscription=$query->userlevel;     
                $suspend=$query->status;
				$country = $query->country_name;  
            }                     
        ?>           
        <h3><?php echo __("CF_user_details")?></h3><br> 
        
        <p>
        <label for="name"><?php echo __("CF_name")?>:</label>
        <?php echo $first_name?> <?php echo $name?>
        </p>
        
        <p>
        <label for="CompanyName"><?php echo __("CF_Company_name")?>:</label>
        <?php echo $company?>
        </p>
        
        <p>
        <label for="email"><?php echo __("CF_admin_email")?>:</label>
        <?php echo $email?>
        </p>
        
        <p>
        <label><?php echo __("CF_country")?>:</label>
        <?php echo $country;?>
        </p>

		<p>
        <label for="Description"><?php echo __("CF_des")?>:</label>
        <?php echo $description ?>
        </p>


		<p>
     	<label><?php echo __("CF_status")?>:</label>
        <?php if((int)$suspend == 1):?>

            <?php echo ucfirst(strtolower(__("CF_active")))?>
            <?php else:?>
            <?php echo ucfirst(strtolower(__("CF_suspended")))?>
            <?php endif;?>

			<?php
			  echo form_open('admin/modify_user'.'/'.$id);
			?>
        <p><input name="edit" type="submit" class="submit" value="<?php echo __("CF_edit")?>" /></p>
        <?php echo form_close();?>
        
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
          