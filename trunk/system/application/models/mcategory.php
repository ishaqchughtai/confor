<?php
  class MCategory extends Model
  {
    function MCategory()
    {
      parent::Model();
      $this->load->database();
    }

    //function get_category()
    //    {
    //      $query = $this->db->get('tblcategory');
    //      return $query->result_array();
    //    }

    function get_video_by_category($id)
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
      $query = $this->db->get();
      return $query->result_array();
    }
    
  }
?>
