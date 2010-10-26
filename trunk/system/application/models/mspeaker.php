<?php
/**
 * MSpeaker Class
 *
 * @package		Confor
 * @subpackage	Models
 * @category	Speaker
 * @author		Nguyen Hai Dang - XEMMEX developer
 */

class MSpeaker extends Model
{
	function MSpeaker()
	{
		parent::Model();
		$this->load->database();
	}	
	
	// --------------------------------------------------------------------
	
	/**
	 * Get speaker's profile by ID
	 *
	 * @access	public
	 * @return	void
	 */		
	function get_by_id($id)
	{
		$this->db->select("
		tblspeaker.ID,
		tblspeaker.Name,
		tblspeaker.FirstName,
		tblspeaker.CompanyName,
		tblspeaker.Email,
		tblspeaker.Country,
		tblspeaker.Language,
		tblspeaker.Description,		  
		tblsubscription.SubcriptionDate,
		tblsubscription.SubscriptionExpiration,
		tblsubscriptiontype.TypeName");
		$this->db->from('tblspeaker');
		$this->db->where('tblspeaker.ID',$id);
		$this->db->join('tblsubscription','tblsubscription.ID = tblspeaker.Subscription');
		$this->db->join('tblsubscriptiontype','tblsubscriptiontype.ID = tblsubscription.SubscriptionType');
		$this->db->limit(1);
		$query = $this->db->get();
		if ($query->num_rows()>0) {return $query->row();}
		else {return 0;}		  		  
	}
	
	// --------------------------------------------------------------------
	
	function get_by_email($email) 
	{
		$this->db->select("
		tblspeaker.ID,
		tblspeaker.Email,
		tblspeaker.Name,
		tblspeaker.Language,
		tblsubscription.SubscriptionExpiration,
		tblsubscriptiontype.TypeName");	  
		$this->db->from('tblspeaker');
		$this->db->where('Email', $email);            
		$this->db->join('tblsubscription','tblsubscription.ID = tblspeaker.Subscription');
		$this->db->join('tblsubscriptiontype','tblsubscriptiontype.ID = tblsubscription.SubscriptionType');
		$this->db->limit(1);
		return $this->db->get();
	}
	
	// --------------------------------------------------------------------
	
	function save($id, $data)
	{
		$this->db->where('id', $id);
		$this->db->update('tblspeaker', $data);		 
	}
	
	// --------------------------------------------------------------------
	
	function get_speaker_for_login($email, $password) {
		$this->db->select("
		tblspeaker.ID,
		tblspeaker.Email,
		tblspeaker.Name,
		tblspeaker.Language,
		tblsubscription.SubscriptionExpiration,
		tblsubscriptiontype.TypeName");	  
		$this->db->from('tblspeaker');
		$this->db->where('Email', $email);
		$this->db->where('Password', $password);        
		$this->db->join('tblsubscription','tblsubscription.ID = tblspeaker.Subscription');
		$this->db->join('tblsubscriptiontype','tblsubscriptiontype.ID = tblsubscription.SubscriptionType');
		$this->db->limit(1);	
		return $this->db->get();
	}
	
	// --------------------------------------------------------------------
	
	function speaker_paging($num_per_page, $page_offset, $keyword) {	
		
		$this->db->select("
		tblspeaker.ID,
		tblspeaker.Email,
		tblspeaker.Name,
		tblsubscription.SubscriptionExpiration,
		tblsubscriptiontype.TypeName");	  
		$this->db->from('tblspeaker');
		if (($keyword)&&(strlen($keyword)>0)) {
			$this->db->like("tblspeaker.Email", $keyword); 
		}
		$this->db->order_by("tblspeaker.Email", "asc"); 
		$this->db->order_by("tblspeaker.ID", "asc"); 
		$this->db->join('tblsubscription','tblsubscription.ID = tblspeaker.Subscription');
		$this->db->join('tblsubscriptiontype','tblsubscriptiontype.ID = tblsubscription.SubscriptionType');
		$this->db->limit($num_per_page, $page_offset);
		return $this->db->get();		
	}
}
?>
