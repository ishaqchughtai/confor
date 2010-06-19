		
<div id="menu">			
				<div id="right_bg"></div>			
				<ul>
					<li><a href="<?php echo site_url("") ?>"><?php echo __("CON_home")?></a></li>			
<?php if($this->session->userdata('admin')): ?>							
					<li><a href="<?php echo site_url("admin") ?>"><?php echo __("CON_setting")?></a></li>
				    <li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CON_logout")?></a></li>
<?php else:?>
					<li><a href="<?php echo site_url("admin/login") ?>"><?php echo __("CON_login")?></a></li>
<?php endif ?>
					
				</ul>						
</div>								
