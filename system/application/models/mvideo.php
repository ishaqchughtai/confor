<?php
  class MVideo extends Model
  {
    function MVideo()
    {
      parent::Model();
      $this->load->database();
    }

    function get_video_by_speaker($speaker)
    {
      $this->db->select('
      tblspeaker.Name,
      tblvideoconference.ID,
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
      tblvideoconference.Speaker,
      tblspeaker.Name as speaker_name,
      tblvideoconference.ImagesLink,
      tblvideoconference.Category

      ');
      $this->db->from('tblvideoconference');
      $this->db->join('tblspeaker','tblvideoconference.Speaker = tblspeaker.ID');
      $this->db->where(array('speaker'=>$speaker));
      $this->db->order_by('Viewed','desc');
      $query = $this->db->get();
      return $query->result_array();
    }
    //var $date = date("F jS Y", strtotime($rows['Date']));
    function get_video_by_archives($month,$year)
    {
      $this->db->select("
      MONTH(Date) as month,
      YEAR(Date) as year,
      tblspeaker.Name,
      tblvideoconference.ID,
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
      tblspeaker.Name as speaker_name,
      tblvideoconference.ImagesLink,
      tblvideoconference.Category

      ");
      $this->db->from('tblvideoconference');
      $this->db->join('tblspeaker','tblvideoconference.Speaker = tblspeaker.ID');
      $this->db->where(array('MONTH(Date)'=>$month,'YEAR(Date)'=>$year));
      $this->db->order_by('Viewed','desc');
      $query = $this->db->get();
      return $query->result_array();
    }

  }
?>
