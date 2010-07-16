<?php
  class Mcoffice extends Model{
    function Mcoffice(){
      parent::Model();
      $this->load->database();
    }

    function count_office_by_lang($lg)
    {
      $this->db->from('tbloffice');
      $this->db->where(array('lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }
    function get_all_office($lg,$offset,$num)
    {
      $this->db->select("
      tbloffice.id,
      tbloffice.title,
      tbloffice.content,
      tbloffice.date,
      tbloffice.lang
      ");
      $this->db->from('tbloffice');
      $this->db->where(array('lang'=>$lg));
      $this->db->order_by("tbloffice.ID", "desc");
      $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }
    function get_video_by_id($id)
    {
      $query=$this->db->query('Select 
      vid_id,title ,tags,description,vhash,mem_id,shash
      from videos Where vid_id= '.$id);
      return $query;
    }
    function count_video_confernce() 
    {
      $this->db->get('videos');
      return $this->db->count_all_results();
    }

    function list_conference_office($offset,$num ) 
    {
      $this->db->select('
      users.username,
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
      $this->db->order_by('Viewed','desc');
      $this->db->limit($num,$offset);
      $query = $this->db->get();
      return $query->result_array();
    }
  }
?>
