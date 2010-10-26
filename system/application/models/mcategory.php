<?php
  class MCategory extends Model
  {
    function MCategory()
    {
      parent::Model();
      $this->load->database();
    }
    
    //count record
    function count_record($id)
    {
      $this->db->from('tblcategory');
      $this->db->join('videos','tblcategory.ID = videos.category');
      $this->db->where(array('videos.category'=>$id));
      $query = $this->db->count_all_results();
      return $query;
    }
    
    function get_category_by_id($id)
    {
      $this->db->from('tblcategory');
      $this->db->where(array('ID'=>$id));
      $cate = $this->db->get();
      return $cate->result_array();
    }
    
    //get video by category
    function get_video_by_category($id,$per_page,$offset)
    {
      $this->db->select('
      videos.vid_id,
      videos.mem_id,
      users.username,
      users.first_name,
      users.name,
      videos.date,
      videos.title,
      videos.tags,
      videos.description,
      videos.viewed,
      videos.vhash,
      videos.shash,
      videos.category,
      tblcategory.Name
      ');
      $this->db->from('tblcategory');
      $this->db->join('videos','tblcategory.ID = videos.category');
      $this->db->join('users','videos.mem_id = users.id');
      $this->db->where(array('videos.category'=>$id));
      $this->db->limit($per_page,$offset);
	  set_order_from_setting('videos','order_video_field','order_video_sort','date');
      $video_cate = $this->db->get();
      return $video_cate->result_array();
    }
    
  }
?>
