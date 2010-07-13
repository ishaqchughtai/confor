<?php
class Mvid extends Model{
	function Mvid(){
		parent::Model();
		$this->load->database();
	}
	function get_all($lg, $num,$offset,$approved = 1)
	{
		$this->db->select('
		videos.*,
		users.id,
		users.name,
		users.first_name');
		$this->db->from('videos');
		
		$this->db->where('videos.lang ', $lg);
		if ($approved==1) $this->db->where('videos.approved ', '1');
		
		$this->db->join('users','videos.mem_id = users.id'); 
		$this->db->order_by("videos.`date`", "desc"); 
		$this->db->limit($num,$offset);
		
		$query = $this->db->get();
		return $query->result_array();
	}
	function get_by_category($lg, $category, $num, $offset, $approved=1)
	{
		$this->db->select('
		users.name as SpeakerName,
		users.first_name,
		users.company_name,
		videos.*,    
		tblcategory.Name');
		$this->db->from('videos');
		$this->db->join('users','videos.mem_id = users.ID');
		$this->db->join('tblcategory','videos.category = tblcategory.ID');
		
		$this->db->where('videos.lang ', $lg);
		if ($category>0) $this->db->where('videos.category',$category);
		if ($approved==1) $this->db->where('videos.approved ', '1');			            
		$this->db->order_by("videos.`date`", "desc");			
		$this->db->limit($num,$offset); 
		
		$query = $this->db->get();
		return $query->result_array();    
	}
	
	function count_by_category($lg, $category=0) 
	{
		$this->db->from('videos');
		if ($category>0) $this->db->where('videos.category',$category);			
		$this->db->where('videos.lang', $lg);
		return $this->db->count_all_results();
	}
	
	function get_by_id($id)
	{
		$query = $this->db->get_where('videos',array('vid_id'=>$id));
		return $query;
	}

	function get_info_by_id($vid_id)
	{
		$this->db->select('
		users.username,
		users.name,
		videos.*
		');
		$this->db->from('videos');
		$this->db->join('users','videos.mem_id = users.id');
		$this->db->where('vid_id', $vid_id);            
		$this->db->limit(1);
		return $this->db->get();            
	}
	
	function update_conference($data,$id)
	{
		$this->db->update('videos',$data,array('vid_id'=>$id)); 
	}		
	
    function get_popular_video($lg = 'en')
    {
		$this->db->where('approved','1');
		$this->db->where('lang',$lg);
		$this->db->order_by('viewed','desc');
		$this->db->limit(8);
		$query = $this->db->get('videos');
		return $query->result_array();
    }
	
    function get_recent_video($lg = 'en')
    {
		$this->db->where('approved','1');
		$this->db->where('lang',$lg);
		$this->db->order_by('date','desc');
		$this->db->limit(8);
		$query = $this->db->get('videos');
		return $query->result_array();	
    }	
	
}
?>
