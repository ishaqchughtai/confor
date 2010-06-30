<?php
	$msg = $this->session->flashdata('msg');
	$class_msg = $this->session->flashdata('class_msg');
	// $msg = isset($msg)?$msg:'{No message here}';
	// $class_msg = isset($class_msg)?$class_msg:'warning';	
?>

<?php if ( $msg && $class_msg):?>
<p class="not_<?php echo $class_msg?>"><span class="img"></span><?php echo $msg?><span class="close"></span></p>
<?php endif;?>