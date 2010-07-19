<div style="float:left;height:400px">
<?php
	$msg = $this->session->flashdata('msg');
	$class_msg = $this->session->flashdata('class_msg');
	$msg_link = $this->session->flashdata('msg_link');
	$msg_link_name = $this->session->flashdata('msg_link_name');
	// $msg = isset($msg)?$msg:'{No message here}';
	// $class_msg = isset($class_msg)?$class_msg:'warning';	
?>

<?php if ( $msg && $class_msg):?>
<p class="not_<?php echo $class_msg?>"><span class="img"></span><?php echo $msg?><span class="close"></span></p>
<?php endif;?>

</br>
<?php if ($msg_link):?>
	<?php if ($msg_link_name):?>
	<p>
		Go to : <a href="<?php echo $msg_link;?>"><?php echo $msg_link_name;?></a>
	</p>
	<?php else:?>
	<p>
		<?php echo __("CF_click")?> <a href="<?php echo $msg_link;?>"><?php echo __("CF_here")?></a> <?php echo __("CF_to_continue")?>.
	</p>
	<?php endif;?>	
<?php endif;?>

</div>