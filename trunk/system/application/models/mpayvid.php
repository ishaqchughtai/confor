<?php
class MPayvid extends Model{
	function MPayvid(){
		parent::Model();
		$this->load->database();
	}
	
	function get_all($num, $offset, $approved=0)
	{
		$this->db->from('payvideos');				
		if ($approved==1) $this->db->where('payvideos.approved ', '1');	
		$this->db->order_by('payvideos.date', 'desc'); 
		$this->db->limit($num,$offset);		
		$query = $this->db->get();
		return $query->result_array();
	}
		
	function get_by_code($code)
	{
		$query = $this->db->get_where('payvideos',array('code'=>$code));
		return $query->row();
	}		

	function get_by_vid($vid_id)
	{
		return $this->db->get_where('payvideos',array('vid_id'=>$vid_id));		
		// $this->db->select('
		// users.username,
		// users.name,
		// videos.*
		// ');
		// $this->db->from('videos');
		// $this->db->join('users','videos.mem_id = users.id');
		// $this->db->where('vid_id', $vid_id);            
		// $this->db->limit(1);
		// return $this->db->get();            
	}
	
	function get_by_vid_customer($vid_id, $customer_id)
	{
		$this->db->from('payment_videos');		
		$this->db->where('vid_id', $vid_id);            
		$this->db->where('customer_id', $customer_id);  		
		return $this->db->get();            
	}	
	
	function update($data,$id)
	{
		$this->db->update('payvideos',$data,array('vid_id'=>$id)); 
	}			
	
}
?>
