<?php /* Smarty version 2.6.20, created on 2010-07-08 17:55:49
         compiled from /home/conferen/public_html/prestashop/modules/paypal/paypal.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'l', '/home/conferen/public_html/prestashop/modules/paypal/paypal.tpl', 2, false),)), $this); ?>
<p class="payment_module">
	<a href="modules/paypal/redirect.php" title="<?php echo smartyTranslate(array('s' => 'Pay with PayPal','mod' => 'paypal'), $this);?>
">
		<img src="<?php echo $this->_tpl_vars['module_template_dir']; ?>
paypal.gif" alt="<?php echo smartyTranslate(array('s' => 'Pay with PayPal','mod' => 'paypal'), $this);?>
" />
		<?php echo smartyTranslate(array('s' => 'Pay with PayPal','mod' => 'paypal'), $this);?>

	</a>
</p>