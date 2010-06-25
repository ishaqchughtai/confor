<h2>Forgotten Password</h2>
<form action="" method="post">
    
        <fieldset class="login">            
            <div class="input text"><label>Your Email Address :</label>        
                <input name="email" type="text" id="email" value="<?php if(isset($_POST['email'])){ echo $_POST['email'] ;}?>" class="short"/>
        </div>                    
        <?php echo form_error('email');?>
        <?php if(isset($error)):?>
        <p class="not_warning medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>                  
        <input type="submit" name="submit" style="width:80px" value="Submit" class="submit">    
    </fieldset>    
        </form>
        <label><a href="javascript:history.go(-1);">Back</a></label>
 