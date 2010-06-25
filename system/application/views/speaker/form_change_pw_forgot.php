<h2>CHANGE PASSWORD</h2>

<form action="" method="post">
    <?php if(isset($error)):?>
        <p class="not_warning medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>  
    <fieldset class="change_pw">           
        <div class="input text"><label>User Name :</label>
            <input name="username" type="text" id="username" value="<?php if(isset($_POST['username'])){ echo $_POST['username'] ;}?>" class="short"/> 
        </div> 
        <?php echo form_error('username'); ?>            
        <div class="input text"><label>Email :</label>
            <input name="email" type="text" id="email" value="<?php if(isset($_POST['email'])){ echo $_POST['email'] ;}?>" class="short"/> 
        </div>
        <?php echo form_error('email'); ?>
        <div class="input text"><label>New password</label>               
            <input name="new_password" type="password" id="new_password" value="<?php if(isset($_POST['new_password'])){ echo $_POST['new_password'] ;}?>" class="short"/> 
        </div>                       
        <?php echo form_error('new_password'); ?>
        <div class="input text"><label>Confirm new password</label>
            <input name="passconf" type="password" id="passconf" value="<?php if(isset($_POST['passconf'])){ echo $_POST['passconf'] ;}?>" class="short"/> 
        </div>            
        <?php echo form_error('passconf'); ?>
        <input type="submit" class="submit" name="submit" value="Change password">            
    </fieldset>
        </form>    
