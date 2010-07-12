	<div id="menu">			
				<div id="right_bg"></div>			
				<ul>
					<li><a href="<?php echo site_url("") ?>"><?php echo __("CF_home")?></a></li>	
<?php if($this->session->userdata('admin')): ?>	
					<li><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
					<li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>		
<?php elseif($this->session->userdata('speaker_id')): ?>		
					<li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_set")?></a></li>
				    <li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>
<?php endif ?>					
				</ul>						
</div>								
