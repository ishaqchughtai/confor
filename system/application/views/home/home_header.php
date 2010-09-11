<?php $this->load->view("home/html_head");?>

	<style type="text/css">
	
	<!--
	
		body { background: #ffffff url(images/bg.gif) repeat-x center 100px; }
	
	-->
	
	</style>

		<div id="header_index">
		
			<div id="logo">
			
				<a alt="Confor.tv" title="Confor.tv" href="<?php echo base_url();?>">				
				<?php echo img('logo.png',array('alt' => 'Confor.tv'));?>
				</a>				
			</div>
			<!-- /#logo -->
			<?php $this->load->view("home/menu");?>		
			<!-- /#menu -->						
		</div>
				
		<!-- /#header -->
		
		<?php $this->load->view("home/sldier_selector");?>
		<div id="top_box_index">		
			<span class="top_box_top"></span>
			<!-- /.top_box_top - adds the top Background -->
			<?php $this->load->view($adv['page'], $adv);?>

		<!-- /#top_box -->
		
		<div id="content">
			<br />

			<div id="left">		