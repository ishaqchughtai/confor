<div id="menu">			
	<div id="right_bg"></div>			
	<ul>
		<li><a href="<?php echo site_url("") ?>"><?php echo __("CON_home")?></a>
			<ul>
				<li><a href="<?php echo site_url("Accessories/show_element/about") ?>" ><?php echo __("CON_about")?></a>
					<ul>
                        <li><a href="<?php echo site_url("Accessories/show_element/how") ?>" ><?php echo __("CON_howto")?></a></li>
						<li><a href="<?php echo site_url("Accessories/show_element/rules") ?>" ><?php echo __("CON_howto")?></a></li>
					
						<li><a href="<?php echo site_url("Accessories/show_element/rules") ?>" ><?php echo __("CON_rules")?></a></li>
					</ul>
				</li>
				<li><a href="<?php echo site_url("home/contact")?>"><?php echo __("CON_contact")?></a></li>	
			</ul>
		</li>
		
		<li><a href="<?php echo site_url("home/video") ?>"><?php echo __("CON_conference_office")?></a></li>
			
		<li><a href="<?php echo site_url("Accessories/show_element/training") ?>"><?php echo __("CON_training")?></a></li>
	
		<li><a href="<?php echo site_url("blog") ?>"><?php echo __("CON_blog")?></a></li>
		
		<li><a href="<?php echo site_url("home/shop") ?>"><?php echo __("CON_shop")?></a></li>

		<?php if($this->session->userdata('admin')): ?>		
		<li><a href="<?php echo site_url("admin") ?>"><?php echo __("CON_setting")?></a></li>
		<li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CON_logout")?></a></li>		
		<?php elseif($this->session->userdata('speaker_id')): ?>
		<li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CON_setting")?></a></li>
		<li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CON_logout")?></a></li>		
		<?php else: ?>
		<li id="login_link"><a href="">Register</a></li>		
		<li id="login_link"><a href="#login_wrapper">Log in</a></li>	
		<?php $this->load->view("home/login");?>
		<?php endif ?>
	</ul>	
</div>	

	

