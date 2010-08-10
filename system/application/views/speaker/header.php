<?php $this->load->view("speaker/html_head");?>

<div id="header">
<div id="logo">                   
	<a href="<?php echo base_url();?>">	
	<?php echo img('logo.png',array('alt' => 'Confor.ca'));?>
	</a>	
</div>
<!-- /#logo -->
<?php $this->load->view("speaker/menu");?>
<!-- /#menu -->

<div id="header_info">

	<div class="left">
		<?php echo __("CF_you_are_here");?>		
		<b><a href="<?php echo $path[0]['link']?>"><?php echo $path[0]['name']?></a></b>
		<?php for ($i=1; $i<count($path); $i++):?>
			/ <a href="<?php echo $path[$i]['link']?>"><?php echo $path[$i]['name']?></a>
		<?php endfor;?>			
	</div>

</div>
</div>
<!-- /#header_info -->			

	<div id="top_box">		
		<br />
		<!-- /#top_box -->
		
		<div id="content">
			<br />
			<div id="left">			