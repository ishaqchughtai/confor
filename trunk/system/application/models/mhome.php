<?php
  class Mhome extends Model{
    function Mhome(){
      parent::Model();
      $this->load->database();
    }
    function get_top_viewed_video()
    {
      $query=$this->db->query("SELECT tblvideoconference.ID,tblvideoconference.Title,tblvideoconference.Description,tblvideoconference.Viewed,tblvideoconference.VideoLink,tblspeaker.Name,tblspeaker.FirstName FROM tblvideoconference ,tblspeaker WHERE tblvideoconference.Speaker =  tblspeaker.ID order by tblvideoconference.Viewed DESC LIMIT 1");
      return $query;
    }
    function search_conference($keyword_to_search)
    {
      $query=$this->db->query('Select ID,Title,Subject,Keywords,Description,VideoLink,Speaker,ImagesLink from tblvideoconference Where Title LIKE '."'%".$keyword_to_search."%'");
      return $query->result_array();
    }
    function get_video_by_id($id)
    {
      $query=$this->db->query('Select ID,Title,Subject,Keywords,Description,VideoLink,Speaker,ImagesLink from tblvideoconference Where ID= '.$id);
      return $query;
    }

    function count_video_search($keyword) 
    {
      $this->db->like('Title', $keyword);
      $this->db->from('tblvideoconference');
      return $this->db->count_all_results();
    }

    function search_paging($keyword, $num, $offset) {
      $this->db->like('Title', $keyword);
      $this->db->from('tblvideoconference');         
      $this->db->limit($num, $offset);
      $query=$this->db->get();
      return $query->result_array();
    }


    function get_popular_video()
    {
      $query=$this->db->query("SELECT * FROM tblvideoconference order by viewed DESC LIMIT 8");
      return $query->result_array();
    }
    function get_recent_video()
    {
      $query=$this->db->query("SELECT * FROM tblvideoconference order by Date DESC LIMIT 4");
      return $query->result_array();
    }
    function update_view_time($id,$viewed)
    {
      $data = array('Viewed'=>$viewed);
      $this->db->update('tblvideoconference',$data,array('ID'=>$id));
    }
    function get_view_by_id($id)
    {
      $query=$this->db->query('Select Viewed from tblvideoconference Where ID= '.$id);
      return $query;
    }

    function get_category()
    {
      $query = $this->db->get('tblcategory');
      return $query->result_array();
    }

    function get_date()
    {
      $this->db->select('
      tblvideoconference.`Date`,
      ');
      $this->db->from('tblvideoconference');
      $this->db->order_by('Date','desc');
      $query = $this->db->get();
      return $query->result_array();
    }

    function get_dates()
    {
      $dates=$this->db->query("SELECT DISTINCT DATE_FORMAT(Date,'%M %Y') as month_yy
      FROM tblvideoconference order by date_format(Date,'%Y %M') desc");
      return $dates->result_array();
    }

    function count_record_archives()
    {
      $this->db->query("SELECT DISTINCT DATE_FORMAT(Date,'%M %Y') as month_yy
      FROM tblvideoconference where DATE_FORMAT(Date,'%M %Y') = month_yy order by date_format(Date,'%Y %M') desc");
      $count_video = $this->db->count_all_results();
      return $count_video;
    }

    function get_top_speaker()
    {
      $this->db->select('
      tblvideoconference.Speaker,
      tblvideoconference.Viewed,
      tblspeaker.Name
      ');
      $this->db->from('tblvideoconference');
      $this->db->join('tblspeaker','tblvideoconference.Speaker = tblspeaker.ID');
      $this->db->order_by('Viewed','desc');
      $this->db->limit(5);
      $query = $this->db->get();
      return $query->result_array();
    }
  }
?>
