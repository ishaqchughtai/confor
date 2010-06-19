  <div class="hidden">
    
        <div id="login_wrapper">
    
            <div id="login_top"></div>
            
            <div id="login">
            
            <form id="login_form" action="" method="post">
            
                <div class="login_block">
                
                    <label for="login_username">Email:</label>
                    <input type="text" id="login_username" name="username" />
                
                </div>
            
                <div class="login_block">
                
                    <label for="login_password"><?php echo lang('CON_user_password_label');?></label>
                    <input type="password" id="login_password" name="pass" />
                
                </div>
            
                <div class="login_block_submit">
                
                    <input type="submit" id="login_submit" name="submit" value="" onclick="return loginSubmit()" />
                
                </div>
                
                <p class="not_login_info">
                
                    <span class="left"><input id="is_cookie" name="is_cookie" type="checkbox" class="checkbox" /> Remember me</span>
                
                    <a href="#" class="right"><?php echo $this->lang->line('CON_forgotten_password_label');?></a>
                    
                </p>
                <div id="message_holder">                
                </div>
                </form>
            
            </div>            
            
            <div id="login_bottom"></div>
        
        </div>
    
    </div>
