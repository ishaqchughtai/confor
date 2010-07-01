<?php
    class Mshowroom extends Model{
        function Mshowroom()
        {
            parent::Model();
            $this->load->database();
        }
        function get_show_room()
        {
            $this->db->select("
            tblshowroom.ID,
            tblshowroom.Video,
            tblshowroom.SpeakerImages,
            videos.mem_id,
            videos.viewed");
            $this->db->from('tblshowroom');
            $this->db->join('videos','tblshowroom.Video = videos.vid_id');
            $this->db->order_by("videos.viewed", "desc");
            $this->db->limit(3);
            $query = $this->db->get();
            return $query->result_array();
        }
        function add_image($Video,$SpeakerImages)
        {        
            $data = array(
            'Video'=>$Video,
            'SpeakerImages'=>$SpeakerImages);       
            $this->db->insert('tblshowroom',$data);
            return TRUE;            
        }
        function select_speaker_video($Speaker)
        {
            $this->db->select("
            videos.vid_id,
            videos.title,
            users.`name`,
            users.id");
            $this->db->from('videos');
            $this->db->join('users','users.id = videos.mem_id'); 
            $this->db->where('users.id',$Speaker);
            $query = $this->db->get();
            return $query->result_array();              
        }
        function get_all_speaker()
        {
            $this->db->select();
            $this->db->from('users');
            $query = $this->db->get();
            return $query->result_array();
        }
		
		function show_paging($speaker_id, $num_per_page, $page_offset, $keyword) 
		{				
			$this->db->select("
			videos.vid_id,
			videos.title,
			videos.shash"); 
			$this->db->from('videos');
			if (($keyword)&&(strlen($keyword)>0)) {
				$this->db->like("videos.title", $keyword); 
			}
			$this->db->where('videos.mem_id',$speaker_id);
			$this->db->order_by("videos.title", "asc"); 
			$this->db->order_by("videos.vid_id", "asc"); 
			$this->db->limit($num_per_page, $page_offset);
			return $this->db->get();		
		}		
		
    }   
?>
