<?php if($this->session->userdata('speaker_id')): ?>			
<div id="menu">			
				<div id="right_bg"></div>			
				<ul>
					<li><a href="<?php echo site_url("") ?>"><?php echo __("CF_home")?></a></li>					
					<li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_set")?></a></li>
				    <li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>
				</ul>						
</div>								
<?php endif ?>