<?php
    class Mcoffice extends Model{
        function Mcoffice(){
            parent::Model();
            $this->load->database();
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

        function list_conference_office($offset,$num ) {
            $this->db->from('videos');         
            $this->db->limit($num, $offset);
            $query=$this->db->get();
            return $query->result_array();
        }
    }
?>
