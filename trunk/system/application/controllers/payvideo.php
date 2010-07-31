<?php
/**
 * Vid Class
 *
 * @package		Confor
 * @subpackage	Controllers
 * @category	Admin Video
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
class Payvideo extends Frontend_controller {
		
	function Payvideo()
	{	
		parent::Frontend_controller();		
		$this->load->helper('date');			              
        $this->load->model('Mshopproduct','mshopproduct');
		$this->load->model('MOrdershop');	
	}
	
	function play($code)
	{        
        $this->_data['path'][] = array(
        'name' => __("CF_pay_vid"),
        'link' => '#'
        );    
 
		//$ok = TRUE;

		/*
		* Check view video file
		* @return 1 if all information is right
		* @return 2 if the user dont login at prestashop
		* @return 3 if the user logged but they dont have payment
		*/		
		//$id_product = $this->MOrdershop->get_product_id_by_code($code);	
		$physically_filename = $this->uri->segment(4);
		if (!$physically_filename)
		{
			is_admin();
			$this->db->where('code',$code);
			$this->db->limit(1);
			$query = $this->db->get('payvideos');
			
			if ($query->num_rows()>0)
			{			
				$this->_data['row'] = $query->row();
				// $this->_load_view('vid/payvideo_play');		
				//$data['row'] = $query->row();
				$this->load->view('vid/payvideo_play', $this->_data);						
			}
			else
			{
				$this->_message('payvideo', __("CF_pay_vid_not_exist"), 'error');
			}		
			return;
		}
		
		//$id_product = $this->MOrdershop->get_product_id_by_code($physically_filename);	
		$product = $this->MOrdershop->get_product_by_code($physically_filename);	
		$id_product = $product->id_product;
		
		if ($id_product==0)
		{								
			$this->_message('payvideo', __("CF_pay_vid_not_belong"), 'warning');
		}		
		
		//$check = chk_view_video_shop($id_product);
		$check = 2; // must login
		$result = 0;
        @session_start();
        if(isset($_SESSION['chk_login_download_video']) && !empty($_SESSION['chk_login_download_video']) && is_numeric($_SESSION['chk_login_download_video']))
		{
			$ret = $this->MOrdershop->get_order($id_product, $_SESSION['chk_login_download_video']);
			$result = $ret['result'];
			$check = 1;
			switch ($result)
			{
				case 0: 
					$check=3; // must pay
					break;
				case -1:
					$check=4; // view limit
					break;
			}
		}
						
		if ($check==2)
		{		
			$link_shop_login = base_url().'prestashop/authentication.php';
			$this->_message('payvideo', __("CF_pay_vid_must_login"), 'warning',$link_shop_login);
		}
		
		if ($check==3)
		{
			$link_pay = base_url().'prestashop/product.php?id_product='.$id_product;
			$this->_message('payvideo', __("CF_pay_vid_must_pay"), 'warning',$link_pay);			
		}

		if ($check==4)
		{
			$link_pay = base_url().'prestashop/product.php?id_product='.$id_product;
			$this->_message('payvideo', __("CF_pay_vid_reach_limit"), 'warning',$link_pay);			
		}		
				
		$this->db->where('code',$code);
		$this->db->limit(1);
		$query = $this->db->get('payvideos');
		
		if ($query->num_rows()>0)
		{			
			$this->_data['row'] = $query->row();
			$this->_data['product'] = $product;
			$this->_data['order'] = $ret['order'];
			// $this->_load_view('vid/payvideo_play');		
			//$data['row'] = $query->row();
			$this->load->view('vid/payvideo_play',$this->_data);					
		}
		
		else
		{
			$this->_message('payvideo', __("CF_pay_vid_not_exist"), 'error');
		}		
	}  	
	
	function getvideo($fname)
	{
		// $user_data = is_speaker(FALSE);
		// if ($user_data==FALSE)
		// {					
			// $this->_message('payvid', "You must login to download this file", 'success',site_url("home/login"));						
		// }
		//$fullPath = $_SERVER['DOCUMENT_ROOT'].'/confor/payvids/'.$fname;	
		
		$fullPath ='./payvids/'.$fname;	
		if ($fd = fopen ($fullPath, "r")) {
			//$fname = basename($fullPath);
			header('Content-type: application/octet-stream');
			header('Content-Disposition: filename="'.$fname.'"');
			header('Content-length: '.filesize($fullPath));
			header('Cache-control: private');
			while(!feof($fd)) {
				$buffer = fread($fd, 2048);
				echo $buffer;
			}
			fclose ($fd);
			exit;
		}				
	}	
	

}