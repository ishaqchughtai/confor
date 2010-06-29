  <div class="hidden">
    
        <div id="login_wrapper">
    
            <div id="login_top"></div>
            
            <div id="login">
            
            <form id="login_form" action="" method="post">
            
                <div class="login_block">
                
                    <label for="login_username"><?php echo __("CF_user")?></label>
                    <input type="text" id="login_username" name="username" />
                
                </div>
            
                <div class="login_block">
                
                    <label for="login_password"><?php echo __("CF_pass");?></label>
                    <input type="password" id="login_password" name="password" />
                
                </div>
            
                <div class="login_block_submit">
                
                    <input type="submit" id="login_submit" name="submit" value="" onclick="return loginSubmit()" />
                
                </div>
                
                <p class="not_login_info">
                
                    <span class="left"><input id="is_cookie" name="is_cookie" type="checkbox" class="checkbox" /> <?php echo __("CF_remember")?></span>
                
                    <a href="<?php echo site_url('forgot_password')?>" class="right"><?php echo __("CON_forgotten_password_label");?></a>
                    
                </p>
                <div id="message_holder">                
                </div>
                </form>
            
            </div>            
            
            <div id="login_bottom"></div>
        
        </div>
    
    </div>
