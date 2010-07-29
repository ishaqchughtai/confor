<?php

/**

 * MOrdershop Model Class

 *

 * @package		Confor

 * @subpackage	Models

 * @category	Shopping

 * @author		Tham - XEMMEX developer

 */



class MOrdershop extends Model

{

	function MOrdershop()

	{

		parent::Model();

		$this->load->database();

	}	
	
	function get_product_id_by_code($code)
	{
		$this->db->select('id_product');		
		$this->db->where('display_filename',$code.'.html');
		$this->db->limit(1);
		$query = $this->db->get('presshop_product_download');
		
		if ($query->num_rows()>0)
		{
			$r = $query->row();
			return $r->id_product;
		}
		else
		{	
			return 0;
		}
	}
	
	// --------------------------------------------------------------------
	/**

     * Get order information according to id_product and id customer

     *

     * @access    public

     * @return    boolean true if it had paid, else

     */        

    function get_order_customer($id_product, $id_customer)
    {
       $sql = 'SELECT o.id_order,download_nb 
               FROM presshop_orders o 
               INNER JOIN presshop_order_detail od ON o.id_order=od.id_order 
               WHERE od.product_id = '.intval($id_product).' 
               AND o.id_customer = '.intval($id_customer).' 
               AND o.valid > 0
               AND od.download_nb >0
               AND od.download_deadline >=\''.date('Y-m-d').' 00:00:00\' 
               GROUP BY o.id_order';
       $rst = $this->db->query($sql);
       $num_row_rc = $rst->num_rows();
       if($num_row_rc>0)
       {
            $this->db->select('nb_downloadable');
            $this->db->from('presshop_product_download');
            $this->db->where(array('id_product'=>$id_product,'nb_downloadable >'=>0,'active'=>1));
            $this->db->limit(1);
            $row_down = $this->db->get();
			$row_down = $row_down->row();			
			$row = $rst->row();
			if(intval($row->download_nb)>intval($row_down->nb_downloadable)) return false;					            			
			$upview['download_nb'] = intval($row->download_nb)+1;
			$this->db->update('presshop_order_detail',$upview, array('id_order'=>$row->id_order));						
            return true;
       }       
       return false; 
    }
}



/* End of file mordershop.php */ 

/* Location: ./system/application/models/mordershop.php */ 



