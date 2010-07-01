<?php
  class Mhome extends Model{
    function Mhome(){
      parent::Model();
      $this->load->database();
    }
    function get_top_viewed_video()
    {
      $query=$this->db->query("SELECT 
      videos.vid_id,
      videos.mem_id,
      videos.title,
      videos.description,
      videos.category,
      videos.tags,
      videos.`date`,
      videos.vhash,
      videos.shash,
      videos.viewed,
      videos.approved,
      users.username
      FROM videos ,users 
      WHERE videos.mem_id = users.id
      AND videos.approved='1'  
      order by videos.viewed DESC LIMIT 1");
      return $query;
    }
    function search_conference($keyword_to_search)
    {
      $query=$this->db->query('Select 
      vid_id,title,tags,description,vhash,mem_id,shash 
      from videos Where title LIKE '."'%".$keyword_to_search."%'");
      return $query->result_array();
    }
    function get_video_by_id($id)
    { 
      $query=$this->db->query('SELECT
      videos.vid_id,
      videos.mem_id,
      videos.title,
      videos.description,
      videos.category,
      videos.tags,
      videos.`date`,
      videos.vhash,
      videos.shash,
      videos.viewed,
      users.username
      FROM
      users
      Inner Join videos ON users.id = videos.mem_id
      Where vid_id= '.$id);
      return $query;
    }

    function count_video_search($keyword) 
    {
      $this->db->like('title', $keyword);
      $this->db->from('videos');
      return $this->db->count_all_results();
    }

    function search_paging($keyword, $num, $offset) {
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
      $this->db->where('videos.approved ', '1');
      $this->db->join('users','videos.mem_id = users.id');
      $this->db->like('title', $keyword);
      $this->db->order_by('viewed','desc');
      $this->db->limit($num, $offset);
      $video_speaker = $this->db->get();
      return $video_speaker->result_array();
    }


    function get_popular_video()
    {
      $query=$this->db->query("SELECT * FROM videos Where videos.approved='1' order by viewed DESC LIMIT 8");
      return $query->result_array();
    }
    function get_recent_video()
    {
      $query=$this->db->query("SELECT * FROM videos Where videos.approved='1' order by Date DESC LIMIT 4");
      return $query->result_array();
    }
    function update_view_time($id,$viewed)
    {
      $data = array('viewed'=>$viewed);
      $this->db->update('videos',$data,array('vid_id'=>$id));
    }
    function get_view_by_id($id)
    {
      $query=$this->db->query('Select title,viewed from videos Where vid_id= '.$id);
      return $query;
    }

    function get_category()
    {
      $query = $this->db->get('tblcategory');
      return $query->result_array();
    }

    function get_dates()
    {
      $dates = $this->db->query("SELECT DISTINCT Date as month_yy
      FROM videos order by Date desc");
      return $dates->result_array();
    }

    function get_count_by_month($date)
    {
      $date = 
      $this->db->where('MONTH(date)',$date);
      $this->db->from('tblvideoconference');
      return $this->db->count_all_results(); 
    }


    function count_record_archives()
    {

      $this->db->query("SELECT DISTINCT Date,count(ID) as total
      FROM tblvideoconference where ");
      $count_video = $this->db->count_all_results();
      return $count_video;
    }

    function get_top_speaker()
    {
      $query = $this->db->query("SELECT
      Max(videos.viewed) AS max_viewed,
      videos.mem_id,
      users.username
      FROM
      videos, users
      WHERE
      videos.mem_id =  users.ID
      GROUP BY
      users.Name
      ORDER BY
      videos.viewed DESC
      LIMIT 5
      ");
      return $query->result_array();
    }

    function get_random_by_video($category, $limit) 
    {
      $this->db->from('videos');
      //$this->db->where('category', $category);
      $this->db->order_by("RAND()");
      $this->db->limit($limit);
      return $this->db->get();
    }	

    function is_correct_captcha($str)
    {
      // First, delete old captchas
      $expiration = time()-7200; // Two hour limit		
      $this->db->where('captcha_time < ', $expiration);
      $this->db->delete('captcha'); 

      // Then see if a captcha exists:
      $sql = "SELECT COUNT(*) AS count FROM captcha WHERE word = ? AND ip_address = ? AND captcha_time > ?";
      $binds = array($_POST['captcha'], $this->input->ip_address(), $expiration);
      $query = $this->db->query($sql, $binds);
      $row = $query->row();
      if ($row->count == 0)
      {
        return false;
      }	
      return true;
    }
  }
?>
