<?php $this->load->view("home/html_head");?>

<div id="header">
<div id="logo">                   
	<a href="<?php echo base_url();?>">	
	<?php echo img('logo.png',array('alt' => 'Confor.ca'));?>
	</a>	
</div>
<!-- /#logo -->
<?php $this->load->view("home/menu");?>
<!-- /#menu -->

<div id="header_info">



	<div class="left">
		<?php echo __("CF_you_here");?> :		
		<b><a href="<?php echo $path[0]['link']?>"><?php echo $path[0]['name']?></a></b>
		<?php for ($i=1; $i<count($path); $i++):?>
			/ <a href="<?php echo $path[$i]['link']?>"><?php echo $path[$i]['name']?></a>
		<?php endfor;?>			
	</div>
	
	<div class="right">
		<?php $feed = isset($feed_link)?$feed_link:'blog.rss';?>
		<a href="<?php echo site_url('feed').'/'.$feed?>" class="rss"><?php echo __("CF_subscribe")?></a>
	</div>	

</div>
</div>
<!-- /#header_info -->			

	<div id="top_box">		
		<span class="top_box_top"></span>		
		<?php $this->load->view($adv['page'], $adv);?>
		<!-- /#top_box -->
		
		<div id="content">
			<br />
			<div id="left">			