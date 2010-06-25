<?php
    class Madmin extends Model
    {
        function Madmin(){
            parent::Model();
            $this->load->database();
        }
        /*Login Processing*/
        function process_login($admin_email)
        {
            try
            {
                $query = $this->db->get_where('tbladmin', array('Email' => $admin_email));
                if($query->num_rows()>0)
                {
                    return $query;
                }
                return null;
            }
            catch(Exception $e)
            {
                return null;
            }

        }  
        /*admin*/
        function add_new_admin($data)
        {
            $this->db->insert('tbladmin', $data);
        } 
        function get_all_admin($num,$offset)
        {
            $this->db->select();
            $this->db->from('tbladmin');
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }
        function count_admin()
        {
            $query=$this->db->get('tbladmin');
            return $this->db->count_all_results();
        }
        function get_admin_by_id($id)
        {
            $query = $this->db->get_where('tbladmin',array('ID'=>$id)); 
            return $query->result_array();
        }
        function update_admin($id,$data)
        {
            $this->db->update('tbladmin',$data,array('ID'=>$id)); 
        }
        function is_admin_exist($email,$paypal_email)
        {
            try
            {
                $query = $this->db->get_where('tbladmin', array('Email' => $email));
                $query1 = $this->db->get_where('tbladmin', array('PayPalAccount'=>$paypal_email));
                if($query->num_rows()>0|$query->num_rows()>0)
                {
                    return TRUE;
                }
                return FALSE;
            }
            catch(Exception $e)
            {
                return FALSE;
            }
        }
        /*Speaker*/
        function get_user()
        {
            $query=$this->db->get('tblspeaker');
            return $query->result_array();
        }
        function delete_user($id)
        {
            $this->db->where('ID', $id);
            $this->db->delete('tblspeaker'); 
        }
        function get_user_id($id)
        {
            $query = $this->db->get_where('tblspeaker',array('ID'=>$id)); 
            return $query->result_array();
        }
        function update_user($id,$data)
        {
            $this->db->update('tblspeaker',$data,array('ID'=>$id)); 
        }
        function get_all_speaker($num,$offset)
        {
            $this->db->select();
            $this->db->from('tblspeaker');
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }
        /*Video conference*/
        function get_all_video_conference(){
            $query=$this->db->get('tblvideoconference');
            return $query->result_array();
        }
        function get_video_conference_by_id($id)
        {
            $query = $this->db->get_where('tblvideoconference',array('ID'=>$id)); 
            return $query;
        }
    }
?>
