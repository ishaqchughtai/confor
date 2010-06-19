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
    }
?>
