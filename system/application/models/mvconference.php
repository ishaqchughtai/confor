<?php
  class Mvconference extends Model{
    function Mvconference(){
      parent::Model();
      $this->load->database();
    }
    function get_top_viewed_video()
    {
      $query=$this->db->query("SELECT 
      users.vid_id,
      users.title,
      users.description,
      users.viewed,
      users.vhash,
      users.shash,
      users.name,
      users.first_name 
      FROM users ,users 
      WHERE users.Speaker =  users.vid_id 
      order by users.viewed DESC LIMIT 1");
      return $query;
    }
    function search_conference($keyword_to_search)
    {
      $query=$this->db->query('Select vid_id,Title,Subject,Keywords,Description,vhash,Speaker,ImagesLink from users Where keywords LIKE '."'%".$keyword_to_search."%'");
      return $query->result_array();
    }
    function get_video_by_id($id)
    {
      $query=$this->db->query('Select
      ID,
      Title,
      Subject,
      Keywords,
      Description,
      VideoLink,
      Speaker,
      ImagesLink 
      from users
      Where ID= '.$id);
      return $query;
    }
    function count_video_search($keyword) 
    {
      $this->db->like('Keywords', $keyword);
      $this->db->from('users');
      return $this->db->count_all_results();
    }

    //count record get video by speaker
    function count_record_speaker($speaker)
    {
      $this->db->from('videos');
      $this->db->where('mem_id', $speaker);
      $query = $this->db->count_all_results();
      return $query;
    }
    //get video by speaker side bar
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

    function search_paging($keyword, $num, $offset) 
    {
      $this->db->like('Keywords', $keyword);
      $this->db->from('users');         
      $this->db->limit($num, $offset);
      $query=$this->db->get();
      return $query->result_array();
    }
    function get_popular_video()
    {
      $query=$this->db->query("SELECT * FROM users order by viewed DESC LIMIT 8");
      return $query->result_array();
    }
    function get_recent_video()
    {
      $query=$this->db->query("SELECT * FROM users order by Date DESC LIMIT 4");
      return $query->result_array();
    }
    function update_view_time($id,$viewed)
    {
      $data = array('viewed'=>$viewed);
      $this->db->update('users',$data,array('vid_id'=>$id));
    }
    function get_view_by_id($id)
    {
      $query=$this->db->query('Select viewed from users Where vid_id= '.$id);
      return $query;
    }
    function get_all_video_conference($num,$offset)
    {
      $this->db->select('
      videos.vid_id,
      videos.mem_id,
      videos.title,
      videos.description,
      videos.category,
      videos.tags,
      videos.`date`,
      videos.vhash,
      videos.shash,
      videos.approved,
      videos.viewed,
      users.ID,
      users.Name,
      users.first_name');
      $this->db->from('videos');
      $this->db->join('users','videos.mem_id = users.ID'); 
      $this->db->order_by("videos.`date`", "desc"); 
      $this->db->limit($num,$offset);
      $query = $this->db->get();
      return $query->result_array();
    }
    function get_video_conference_by_category($Category,$num,$offset)
    {
      $this->db->select("
      users.`Name` as SpeakerName,
      users.first_name,
      users.company_name,
      videos.vid_id,
      videos.mem_id,
      videos.title,
      videos.description,
      videos.category,
      videos.tags,
      videos.date,
      videos.vhash,
      videos.approved,
      videos.viewed,
      tblcategory.`Name`");
      $this->db->from('videos');
      $this->db->join('users','videos.mem_id = users.ID');
      $this->db->join('tblcategory','videos.category = tblcategory.ID');
      $this->db->where('videos.category',$Category);
      $this->db->order_by("videos.`date`", "desc");
      $this->db->limit($num,$offset); 
      $query = $this->db->get();
      return $query->result_array();    
    }
    function count_video_Category($Category) 
    {
      $this->db->from('videos');
      $this->db->where('videos.category',$Category); 
      return $this->db->count_all_results();
    }
    function get_video_conference_by_id($id)
    {
      $query = $this->db->get_where('videos',array('vid_id'=>$id)); 
      return $query;
    }
    function get_category()
    {
      $this->db->select('ID,Name');
      $query = $this->db->get('tblcategory');
      return $query->result_array();
    }
    function add_new_video($data)
    {
      $this->db->insert('videos', $data);
    }
    function update_conference($data,$id)
    {
      $this->db->update('videos',$data,array('vid_id'=>$id)); 
    }

    function count_video_speaker($id)
    {
      $this->db->from('videos');
      $this->db->where('videos.mem_id',$id);
      return $this->db->count_all_results();
    }

    //get all video of speaker
    function video_speaker($id,$per_page,$offset)
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
      $this->db->where(array('mem_id'=>$id));
      $this->db->order_by('Viewed','desc');
      $this->db->limit($per_page,$offset);
      $your_vid = $this->db->get();
      return $your_vid->result_array();
    }





  }
?>
