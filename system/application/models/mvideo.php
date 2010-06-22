<?php
  class MVideo extends Model
  {
    function MVideo()
    {
      parent::Model();
      $this->load->database();
    }

    
    //count record get video by speaker
    function count_record_speaker($speaker)
    {
      $this->db->from('tblvideoconference');
      $this->db->where('Speaker', $speaker);
      $query = $this->db->count_all_results();
      return $query;
    }
    
    //get video by speaker
    function get_video_by_speaker($speaker,$per_page,$offset)
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
      $this->db->limit($per_page,$offset);
      $video_speaker = $this->db->get();
      return $video_speaker->result_array();
    }
    
    
    
    //count record get video by archives
    function count_record_archives($month,$year)
    {
      $this->db->from('tblvideoconference');
      $this->db->where(array('MONTH(Date)'=>$month,'YEAR(Date)'=>$year));
      $count_video = $this->db->count_all_results();
      return $count_video;
    }
    
    //get video by archives
    function get_video_by_archives($month,$year,$per_page,$offset)
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
      $this->db->limit($per_page,$offset);
      $video_archives = $this->db->get();
      return $video_archives->result_array();
    }

  }
?>
