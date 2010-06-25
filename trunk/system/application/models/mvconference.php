<?php
    class Mvconference extends Model{
        function Mvconference(){
            parent::Model();
            $this->load->database();
        }
        function get_top_viewed_video()
        {
            $query=$this->db->query("SELECT 
            tblvideoconference.vid_id,
            tblvideoconference.title,
            tblvideoconference.description,
            tblvideoconference.viewed,
            tblvideoconference.vhash,
            users.Name,
            users.first_name 
            FROM tblvideoconference ,users 
            WHERE tblvideoconference.Speaker =  users.vid_id 
            order by tblvideoconference.viewed DESC LIMIT 1");
            return $query;
        }
        function search_conference($keyword_to_search)
        {
            $query=$this->db->query('Select vid_id,Title,Subject,Keywords,Description,vhash,Speaker,ImagesLink from tblvideoconference Where keywords LIKE '."'%".$keyword_to_search."%'");
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
            from tblvideoconference
            Where ID= '.$id);
            return $query;
        }
        function count_video_search($keyword) 
        {
            $this->db->like('Keywords', $keyword);
            $this->db->from('tblvideoconference');
            return $this->db->count_all_results();
        }
        function search_paging($keyword, $num, $offset) 
        {
            $this->db->like('Keywords', $keyword);
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
            $data = array('viewed'=>$viewed);
            $this->db->update('tblvideoconference',$data,array('vid_id'=>$id));
        }
        function get_view_by_id($id)
        {
            $query=$this->db->query('Select viewed from tblvideoconference Where vid_id= '.$id);
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

    }
?>
