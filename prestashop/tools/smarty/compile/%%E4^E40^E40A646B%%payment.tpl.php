<?php /* Smarty version 2.6.20, created on 2010-07-08 17:55:49
         compiled from /home/conferen/public_html/prestashop/modules/cheque/payment.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'l', '/home/conferen/public_html/prestashop/modules/cheque/payment.tpl', 2, false),)), $this); ?>
<p class="payment_module">
	<a href="<?php echo $this->_tpl_vars['this_path_ssl']; ?>
payment.php" title="<?php echo smartyTranslate(array('s' => 'Pay by cheque','mod' => 'cheque'), $this);?>
">
		<img src="<?php echo $this->_tpl_vars['this_path']; ?>
cheque.jpg" alt="<?php echo smartyTranslate(array('s' => 'Pay by cheque','mod' => 'cheque'), $this);?>
" />
		<?php echo smartyTranslate(array('s' => 'Pay by cheque (order process will be longer)','mod' => 'cheque'), $this);?>

	</a>
</p>