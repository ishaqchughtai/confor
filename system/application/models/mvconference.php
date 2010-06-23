<?php
    class Mvconference extends Model{
        function Mvconference(){
            parent::Model();
            $this->load->database();
        }
        function get_top_viewed_video()
        {
            $query=$this->db->query("SELECT tblvideoconference.vid_id,tblvideoconference.title,tblvideoconference.description,tblvideoconference.viewed,tblvideoconference.vhash,tblspeaker.Name,tblspeaker.FirstName FROM tblvideoconference ,tblspeaker WHERE tblvideoconference.Speaker =  tblspeaker.vid_id order by tblvideoconference.viewed DESC LIMIT 1");
            return $query;
        }
        function search_conference($keyword_to_search)
        {
            $query=$this->db->query('Select vid_id,Title,Subject,Keywords,Description,vhash,Speaker,ImagesLink from tblvideoconference Where keywords LIKE '."'%".$keyword_to_search."%'");
            return $query->result_array();
        }
        function get_video_by_id($id)
        {
            $query=$this->db->query('Select ID,Title,Subject,Keywords,Description,VideoLink,Speaker,ImagesLink from tblvideoconference Where ID= '.$id);
            return $query;
        }

        function count_video_search($keyword) 
        {
            $this->db->like('Keywords', $keyword);
            $this->db->from('tblvideoconference');
            return $this->db->count_all_results();
        }

        function search_paging($keyword, $num, $offset) {
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
        function get_all_video_conference(){
            $query=$this->db->query('SELECT videos.vid_id,videos.mem_id,videos.title,videos.description,videos.category,videos.tags,videos.`date`,videos.vhash,videos.approved,videos.viewed,tblspeaker.ID,tblspeaker.Name,tblspeaker.FirstName FROM tblspeaker ,videos WHERE videos.mem_id =  tblspeaker.ID');
            return $query->result_array();
        }
        function get_video_conference_by_id($id)
        {
            $query = $this->db->get_where('videos',array('vid_id'=>$id)); 
            return $query;
        }
        function get_category()
        {
            $this->db->select('ID,Category');
            $query = $this->db->get('Category');
            return $query->result_array();
        }
        function add_new_video($data)
        {
            $this->db->insert('videos', $data);
        }

    }
?>
