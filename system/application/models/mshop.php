<?php
  class MShop extends Model
  {
    function MShop()
    {
      parent::Model();
      $this->load->database();
    }
    
    function get_shop_status()
    {
      $this->db->select('status');
      $status = $this->db->get('tblshop');
      return $status->result();
    }
    
    function active_shop()
    {
      $data = array(
      'Status' => 1
      );
      $this->db->update('tblshop',$data);  
    }

    function deactive_shop()
    {
      $data = array(
      'Status' => 0
      );
      $this->db->update('tblshop',$data);  
    }
  }
?>
