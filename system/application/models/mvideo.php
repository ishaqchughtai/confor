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
      $this->db->from('videos');
      $this->db->where('mem_id', $speaker);
      $query = $this->db->count_all_results();
      return $query;
    }
    
    //get video by speaker
    function get_video_by_speaker($speaker,$per_page,$offset)
    {
      $this->db->select('
      users.name,
      users.first_name,
      videos.vid_id,
      videos.date,
      videos.title,
      videos.tags,
      videos.description,
      videos.viewed,
      videos.vhash,
      videos.mem_id,
      videos.shash,
      videos.category
      ');
      $this->db->from('videos');
      $this->db->join('users','videos.mem_id = users.id');
      $this->db->where(array('mem_id'=>$speaker));
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
      users.Name,
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
      users.Name as speaker_name,
      tblvideoconference.ImagesLink,
      tblvideoconference.Category
      ");
      $this->db->from('tblvideoconference');
      $this->db->join('users','tblvideoconference.Speaker = users.ID');
      $this->db->where(array('MONTH(Date)'=>$month,'YEAR(Date)'=>$year));
      $this->db->order_by('Viewed','desc');
      $this->db->limit($per_page,$offset);
      $video_archives = $this->db->get();
      return $video_archives->result_array();
    }

  }
?>
