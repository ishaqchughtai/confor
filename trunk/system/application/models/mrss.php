<?php
/**
* MRss Model Class
*
* @package		Confor
* @subpackage	Models
* @category	RSS
* @author		Nguyen Hai Dang - XEMMEX developer
*/

class MRss extends Model
{
	function MRss()
	{
		parent::Model();
		$this->load->database();
	}	
	
	function get_video_rss($limit, $lg='en', $category=0)
	{
		$this->db->select('
			videos.*,
			tblcategory.Name as category_name
		');
		$this->db->where('videos.lang',$lg);
		if ($category>0) $this->db->where('videos.category',$category);
		$this->db->limit($limit);		 
		$this->db->order_by('videos.date','desc');		
		$this->db->from('videos');	
		$this->db->join('tblcategory','videos.category=tblcategory.ID');
		return $this->db->get();
	}

	function get_blog_rss($limit, $lg='en')
	{
		$this->db->select('
			tblblog.*,
			tbladmin.Name
		');
		
		$this->db->where('tblblog.Lang',$lg);
		$this->db->limit($limit);	
		$this->db->order_by('tblblog.Date','desc');	
		$this->db->from('tblblog');	
		$this->db->join('tbladmin','tbladmin.ID=tblblog.Author');		
		return $this->db->get();
	}	
	
	function get_category_name($id, $lg)
	{
		$this->db->where('ID',$id);
		$this->db->where('lang',$lg);
		$this->db->limit(1);		 
		$query = $this->db->get('tblcategory');
		if ($query->num_rows()==1)
		{
			$r = $query->row();
			return $r->Name;
		}
		else
		{
			return FALSE;
		}
	}
	
	// --------------------------------------------------------------------

}

/* End of file muser.php */ 
/* Location: ./system/application/models/muser.php */ 

