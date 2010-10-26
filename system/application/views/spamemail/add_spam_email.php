<?php $this->load->view("spamemail/admin_menu_spam_menu.php");?> 
<h2><?php echo __("CF_spamemail_add")?></h2>
       <!-- /#comments -->
      <div class="content_item" id="comment">
        <form action="<?php echo site_url("spamemail/add_spam_email")?>" method="post">
          <p>
            <label for="spamemail"><?php echo __("CF_spamemail")?>*:</label>
            <?php echo form_error('spamemail'); ?> </p>
            <input type="text" class="short" id="spamemail" name="spamemail"/>
            <input type="submit" class="submit" value="<?php echo __("CF_submit")?>" name="btnsubmit" onclick="return confirm('<?php echo __("CF_spamemail_add_confirm")?>')" />
          </p>
        </form>
      </div>
