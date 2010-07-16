<?php

/**
  * Product preferences tab for admin panel, AdminPPreferences.php
  * @category admin
  *
  * @author PrestaShop <support@prestashop.com>
  * @copyright PrestaShop
  * @license http://www.opensource.org/licenses/osl-3.0.php Open-source licence 3.0
  * @version 1.3
  *
  */

include_once(PS_ADMIN_DIR.'/../classes/AdminTab.php');
include_once(PS_ADMIN_DIR.'/tabs/AdminPreferences.php');

class AdminPPreferences extends AdminPreferences
{
	public function __construct()
	{
		$this->className = 'Configuration';
		$this->table = 'configuration';
 		
 		$this->_fieldsProduct = array(
			'PS_ORDER_OUT_OF_STOCK' => array('title' => $this->l('Allow ordering out-of-stock product:'), 'desc' => $this->l('Add to cart button is hidden when product is unavailable'), 'validation' => 'isBool', 'cast' => 'intval', 'required' => true, 'type' => 'bool'),
			'PS_STOCK_MANAGEMENT' => array('title' => $this->l('Enable stock management:'), 'desc' => '', 'validation' => 'isBool', 'cast' => 'intval', 'required' => true, 'type' => 'bool', 'js' => array('on' => 'onchange="stockManagementActivationAuthorization()"', 'off' => 'onchange="stockManagementActivationAuthorization()"')),
			'PS_DISPLAY_QTIES' => array('title' => $this->l('Display available quantities on product page:'), 'desc' => '', 'validation' => 'isBool', 'cast' => 'intval', 'required' => true, 'type' => 'bool'),
			'PS_DISPLAY_JQZOOM' => array('title' => $this->l('Enable JqZoom instead of Thickbox on product page:'), 'desc' => '', 'validation' => 'isBool', 'cast' => 'intval', 'required' => true, 'type' => 'bool'),
			'PS_DISP_UNAVAILABLE_ATTR' => array('title' => $this->l('Display unavailable product attributes on product page:'), 'desc' => '', 'validation' => 'isBool', 'cast' => 'intval', 'required' => true, 'type' => 'bool'),
			'PS_PURCHASE_MINIMUM' => array('title' => $this->l('Minimum purchase total required in order to validate order:'), 'desc' => $this->l('Set to 0 to disable this feature'), 'validation' => 'isFloat', 'cast' => 'floatval', 'type' => 'price'),
			'PS_LAST_QTIES' => array('title' => $this->l('Display last quantities when qty is lower than:'), 'desc' => $this->l('Set to 0 to disable this feature'), 'validation' => 'isUnsignedId', 'required' => true, 'cast' => 'intval', 'type' => 'text'),
			'PS_NB_DAYS_NEW_PRODUCT' => array('title' => $this->l('Number of days during which the product is considered \'new\':'), 'validation' => 'isUnsignedInt', 'cast' => 'intval', 'type' => 'text'),
			'PS_CART_REDIRECT' => array('title' => $this->l('Re-direction after adding product to cart:'), 'desc' => $this->l('Concerns only the non-AJAX version of the cart'), 'cast' => 'intval', 'show' => true, 'required' => true, 'type' => 'radio', 'validation' => 'isBool', 'choices' => array(0 => $this->l('previous page'), 1 => $this->l('cart summary'))),
			'PS_PRODUCTS_PER_PAGE' => array('title' => $this->l('Products per page:'), 'desc' => $this->l('Products displayed per page. Default is 10.'), 'validation' => 'isUnsignedInt', 'cast' => 'intval', 'type' => 'text'),
			'PS_PRODUCTS_ORDER_BY' => array('title' => $this->l('Default order by:'), 'desc' => $this->l('Default order by for product list'), 'type' => 'select', 'list' => 
				array(
					array('id' => '0', 'name' => $this->l('Product name')),
					array('id' => '1', 'name' => $this->l('Product price')),
					array('id' => '2', 'name' => $this->l('Product added date')),
					array('id' => '4', 'name' => $this->l('Position inside category')),
					array('id' => '5', 'name' => $this->l('Manufacturer')),
					array('id' => '3', 'name' => $this->l('Product modified date'))
				), 'identifier' => 'id'),
			'PS_PRODUCTS_ORDER_WAY' => array('title' => $this->l('Default order way:'), 'desc' => $this->l('Default order way for product list'), 'type' => 'select', 'list' => array(array('id' => '0', 'name' => $this->l('Ascending')), array('id' => '1', 'name' => $this->l('Decreasing'))), 'identifier' => 'id'),
			'PS_IMAGE_GENERATION_METHOD' => array('title' => $this->l('Image generated by:'), 'validation' => 'isUnsignedId', 'required' => true, 'cast' => 'intval', 'type' => 'select', 'list' => array(array('id' => '0', 'name' => $this->l('auto')), array('id' => '1', 'name' => $this->l('width')), array('id' => '2', 'name' => $this->l('height'))), 'identifier' => 'id'),
			'PS_PRODUCT_PICTURE_MAX_SIZE' => array('title' => $this->l('Maximum size of product pictures:'), 'desc' => $this->l('The maximum size of pictures uploadable by customers (in Bytes)'), 'validation' => 'isUnsignedId', 'required' => true, 'cast' => 'intval', 'type' => 'text'),
			'PS_PRODUCT_PICTURE_WIDTH' => array('title' => $this->l('Product pictures width:'), 'desc' => $this->l('The maximum width of pictures uploadable by customers'), 'validation' => 'isUnsignedId', 'required' => true, 'cast' => 'intval', 'type' => 'text'),
			'PS_PRODUCT_PICTURE_HEIGHT' => array('title' => $this->l('Product pictures height:'), 'desc' => $this->l('The maximum height of pictures uploadable by customers'), 'validation' => 'isUnsignedId', 'required' => true, 'cast' => 'intval', 'type' => 'text')
		);
	
		parent::__construct();
	}
	
	public function postProcess()
	{
		if (isset($_POST['submitProducts'.$this->table]))
		{
		 	if ($this->tabAccess['add'] === '1')
		 		{
		 			if(!Tools::getValue('PS_STOCK_MANAGEMENT'))
		 			{
		 				$_POST['PS_ORDER_OUT_OF_STOCK'] = 1;
		 				$_POST['PS_DISPLAY_QTIES'] = 0;
		 			}
					$this->_postConfig($this->_fieldsProduct);
				}
			else
				$this->_errors[] = Tools::displayError('You do not have permission to add anything here.');
		}
	}

	public function display()
	{
		$this->_displayForm('products', $this->_fieldsProduct, $this->l('Products'), 'width3', 'tab-orders');
		echo '<script type="text/javascript">stockManagementActivationAuthorization();</script>';
	}
}

?>