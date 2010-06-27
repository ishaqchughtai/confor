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
    
    //get video by category
    function get_video_by_category($id,$per_page,$offset)
    {
      $this->db->select('
      videos.vid_id,
      videos.date,
      videos.title,
      videos.tags,
      videos.description,
      videos.viewed,
      videos.vhash,
      videos.shash,
      videos.category,
      tblcategory.Name,
      users.name as speaker_name
      ');
      $this->db->from('tblcategory');
      $this->db->join('videos','tblcategory.ID = videos.category');
      $this->db->join('users','videos.mem_id = users.id');
      $this->db->where(array('videos.category'=>$id));
      $this->db->limit($per_page,$offset);
      $video_cate = $this->db->get();
      return $video_cate->result_array();
    }
    
  }
?>