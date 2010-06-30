<div id="menu">			
	<div id="right_bg"></div>			
	<ul>
		<li><a href="<?php echo site_url("") ?>"><?php echo ucfirst(__("CF_home"))?></a>
			<ul>
				<li><a href="<?php echo site_url("accessories/show_element/about") ?>" ><?php echo ucfirst(__("CF_about"))?></a>
					<ul>
                        <li><a href="<?php echo site_url("accessories/show_element/how") ?>" ><?php echo __("CF_how")?></a></li>

						<li><a href="<?php echo site_url("accessories/show_element/rules") ?>" ><?php echo __("CF_rules")?></a></li>
					</ul>
				</li>
				<li><a href="<?php echo site_url("contact")?>"><?php echo __("CF_contact")?></a></li>	
			</ul>
		</li>
		
		<li><a href="<?php echo site_url("conference_office") ?>"><?php echo __("CF_conference_office")?></a></li>
			
		<li><a href="<?php echo site_url("accessories/show_element/training") ?>"><?php echo __("CF_training")?></a></li>
	
		<li><a href="<?php echo site_url("blog") ?>"><?php echo __("CF_blog")?></a></li>
		
		<li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>

		<?php if($this->session->userdata('admin')): ?>		
		<li><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
		<li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>		
		<?php elseif($this->session->userdata('speaker_id')): ?>
		<li><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_setting")?></a></li>
		<li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>		
		<?php else: ?>
		<li><a href="<?php echo site_url("home/register") ?>"><?php echo ucfirst(__("CF_register"))?></a></li>		
		<li id="login_link"><a href="#login_wrapper"><?php echo __("CF_login")?></a></li>	
		<?php $this->load->view("home/login");?>
		<?php endif ?>
	</ul>	
</div>	

	