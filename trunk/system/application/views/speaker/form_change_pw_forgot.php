<h2><?php echo __("CF_change_pass")?></h2>

<form action="" method="post">
    <?php if(isset($error)):?>
        <p class="not_warning medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>  
    <fieldset class="change_pw">           
        <div class="input text"><label><?php echo __("CF_user_name")?> :</label>
            <input name="username" type="text" id="username" value="<?php if(isset($_POST['username'])){ echo $_POST['username'] ;}?>" class="short"/> 
        </div> 
        <?php echo form_error('username'); ?>            
        <div class="input text"><label><?php echo __("CF_email")?> :</label>
            <input name="email" type="text" id="email" value="<?php if(isset($_POST['email'])){ echo $_POST['email'] ;}?>" class="short"/> 
        </div>
        <?php echo form_error('email'); ?>
        <div class="input text"><label><?php echo __("CF_new_pass")?></label>               
            <input name="new_password" type="password" id="new_password" value="<?php if(isset($_POST['new_password'])){ echo $_POST['new_password'] ;}?>" class="short"/> 
        </div>                       
        <?php echo form_error('new_password'); ?>
        <div class="input text"><label><?php echo __("CF_confirm_pass")?></label>
            <input name="passconf" type="password" id="passconf" value="<?php if(isset($_POST['passconf'])){ echo $_POST['passconf'] ;}?>" class="short"/> 
        </div>            
        <?php echo form_error('passconf'); ?>
        <input type="submit" class="submit" name="submit" value="<?php echo __("CF_change_pass")?>">            
    </fieldset>
        </form>    
