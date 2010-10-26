<div id="content">
    <div class="x2">
        <h3>Add New Category</h3>
        <p>&nbsp;</p>
        <?php echo form_open('admin/add_new_category'); ?>
        <div class="input text">
                        <label>Display language</label>        
                        <?php choose_your_language($lg);?>
        </div>
        <p>
            <label for="catename"><?php echo __("CF_name")?>:</label>
            <input class="medium" name="txtCateName" id="CateName" /><?php echo form_error("txtCateName"); ?>
        </p>
        <p>
            <input name="submit" type="submit" class="submit" value="<?php echo __("CF_add")?>" />
            <input name="reset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
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
  