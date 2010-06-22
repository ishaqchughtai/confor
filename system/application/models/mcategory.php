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
      $this->db->join('tblvideoconference','tblcategory.ID = tblvideoconference.Category');
      $this->db->join('tblspeaker','tblvideoconference.Speaker = tblspeaker.ID');
      $this->db->where(array('tblvideoconference.Category'=>$id));
      $query = $this->db->count_all_results();
      return $query;
    }
    
    //get video by category
    function get_video_by_category($id,$per_page,$offset)
    {
      $this->db->select('
      tblvideoconference.`ID`,
      tblvideoconference.`Date`,
      tblvideoconference.Title,
      tblvideoconference.Subject,
      tblvideoconference.Keywords,
      tblvideoconference.Description,
      tblvideoconference.Viewed,
      tblvideoconference.Upload, 
      tblvideoconference.Recording,
      tblvideoconference.VideoLink,
      tblvideoconference.Ticket,
      tblvideoconference.ImagesLink,
      tblvideoconference.Category,
      tblcategory.Name,
      tblspeaker.Name as speaker_name
      ');
      $this->db->from('tblcategory');
      $this->db->join('tblvideoconference','tblcategory.ID = tblvideoconference.Category');
      $this->db->join('tblspeaker','tblvideoconference.Speaker = tblspeaker.ID');
      $this->db->where(array('tblvideoconference.Category'=>$id));
      $this->db->limit($per_page,$offset);
      $video_cate = $this->db->get();
      return $video_cate->result_array();
    }
    
  }
?>
