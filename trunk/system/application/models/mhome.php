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
      videos.title,
      videos.description,
      videos.viewed,
      videos.vhash,
      users.name,
      users.first_name
      FROM videos ,users 
      WHERE videos.mem_id = users.id 
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
      $query=$this->db->query('Select 
      vid_id,title,tags,description,vhash,mem_id,shash
      from videos Where vid_id= '.$id);
      return $query;
    }

    function count_video_search($keyword) 
    {
      $this->db->like('title', $keyword);
      $this->db->from('videos');
      return $this->db->count_all_results();
    }

    function search_paging($keyword, $num, $offset) {
      $this->db->like('title', $keyword);
      $this->db->from('videos');         
      $this->db->limit($num, $offset);
      $query=$this->db->get();
      return $query->result_array();
    }


    function get_popular_video()
    {
      $query=$this->db->query("SELECT * FROM videos order by viewed DESC LIMIT 8");
      return $query->result_array();
    }
    function get_recent_video()
    {
      $query=$this->db->query("SELECT * FROM videos order by Date DESC LIMIT 4");
      return $query->result_array();
    }
    function update_view_time($id,$viewed)
    {
      $data = array('viewed'=>$viewed);
      $this->db->update('videos',$data,array('vid_id'=>$id));
    }
    function get_view_by_id($id)
    {
      $query=$this->db->query('Select viewed from videos Where vid_id= '.$id);
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
      users.name,
      users.first_name
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