<?php $this->load->view($side_bar['page'], $side_bar); 
?> 
    <!-- /#footer -->
    
    <div id="copyright">
    
        <div id="copyright_wrapper">
        
            <ul class="left">
            
                <li><a href="<?php echo base_url()?>"><?php echo __("CF_home")?></a></li>
            
                <li><a href="<?php echo site_url("accessories/show_element/about") ?>"><?php echo __("CF_about")?></a></li>
            
                <li><a href="<?php echo site_url("blog") ?>"><?php echo __("CF_blog")?></a></li>
            
                <li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>
                
                <li><a href="<?php echo site_url("home/contact")?>"><?php echo __("CF_contact")?></a></li>
            
         <?php if($this->session->userdata('admin')): ?>        
        <li><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php elseif($this->session->userdata('speaker_id')): ?>
        <li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php else: ?>
        <li><a href="<?php echo site_url("home/register") ?>"><?php echo __("CF_register")?></a></li>        
        <li><a href="<?php echo site_url("home/login") ?>"><?php echo __("CF_login")?></a></li>        
        <?php endif ?>
            
            </ul>
            <!-- /.left content-->
            
            <span class="right">&copy; 2010 Confor.ca | <?php echo __("CF_copy_right")?> <a href="http://xemmex.com/">XemmeX</a></span>
            <!-- /.right content-->
        
        </div>
        <!-- /#copyright _wrapper-->
    
    </div>
    <!-- /#copyright -->            
</body>
</html>