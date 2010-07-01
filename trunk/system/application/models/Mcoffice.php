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
            $this->db->where('videos.approved ', '1');
            $this->db->join('users','videos.mem_id = users.id');
            $this->db->order_by('Viewed','desc');
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            if ($query->num_rows()<1) 
            {
                return FALSE;
            }
            else
            {
                return $query->result_array();
            }

        }
    }
?>
