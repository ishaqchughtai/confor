 <?php 
            foreach($query as $row)
            {
                $id = $row['ID'];
                $category_name=$row['Name'];
        }?>
<div id="content">
<ul class="link_conttrol">
        <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/category/'.$id)?>"><?php echo __("CF_edit_category_meta")?></a></li>
    </ul>
    <br />
    <br />
    <div class="x2">
        <h3><?php echo __("CF_cate_update")?></h3>
        <p>&nbsp;</p>
       
        <?php echo form_open('admin/modify_category/'.$id); ?>

        <label for="name"><?php echo __("CF_name")?>:</label>
        <input class="medium" name="txtCateName" id="name" value="<?php echo $category_name?>" />
        <?php echo form_error("txtCateName"); ?>
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
   