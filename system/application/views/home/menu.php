<div id="menu">			
	<div id="right_bg"></div>			
	<ul id="nav">
		<li><a href="<?php echo site_url("") ?>"><?php echo ucfirst(__("CF_home"))?></a>
			<ul >				
				<li>
					<?php echo out_static_page('About')?>
					<ul id="showIE7error">
						<li><?php echo out_static_page('How')?></li>
						<li><?php echo out_static_page('Rules')?></li>
					</ul>
				</li>
				<li><a href="<?php echo site_url("contact")?>"><?php echo __("CF_contact")?></a></li>	
			</ul>
		</li>
		
		<li><a href="<?php echo site_url("office_frontend/office") ?>"><?php echo __("CF_conference_office")?></a>
		
        	<!--<li><a href="<?php echo site_url("office_frontend/office/5") ?>"><?php echo __("CF_conference_office")?></a>
        		<ul>
				<li><a href="<?php echo site_url("conference") ?>"><?php echo __("CF_conference")?></a></li>
			</ul>
        	</li>-->
        	
		<li><a href="<?php echo site_url("training_frontend/index/".$lang) ?>"><?php echo __("CF_training")?></a></li>
	
		<li><a href="<?php echo site_url("blog_frontend") ?>"><?php echo __("CF_blog")?></a></li>
		
		<li><a href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>

		<?php if($this->session->userdata('admin')): ?>
		<li><a href="#"><?php echo __("CF_account")?></a>
			<ul>
				<li id="meber_lifix"><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
				<li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>
			</ul>
		</li>
				
		<?php elseif($this->session->userdata('speaker_id')): ?>
		<li><a href="#"><?php echo __("CF_account")?></a>
			<ul>
				<li id="meber_lifix"><a href="<?php echo site_url("speaker") ?>"><?php echo __("CF_setting")?></a></li>
				<li><a href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>
			</ul>
		</li>		
		<?php else: ?>
		
		<li ><a href="<?php echo site_url('#') ?>"><?php echo ucfirst(__("CF_member"))?></a>
			<ul   id="member">
				<li id="meber_lifix"><a href="<?php echo site_url("home/register") ?>"><?php echo ucfirst(__("CF_register"))?></a></li>
				<li id="login_link"><a href="#login_wrapper"><?php echo __("CF_login")?></a></li>	
			</ul>
		</li>		
		<?php $this->load->view("home/login");?>
		<?php endif ?>
	</ul>	
</div>	

	