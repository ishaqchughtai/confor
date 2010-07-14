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
        function get_admin_password($id)
        {
            $this->db->select("Password");
            $this->db->from('tbladmin');
            $this->db->where('id',$id);
            $query = $this->db->get();
            if ($query->num_rows()>0)
            {
                return $query->row();
            }
            else
            {
                return FALSE;
            } 
        }
        function change_admin_password($id,$password)
        {
            $data = array(
            'Password' => $password
            );
            $this->db->where('id', $id);
            $this->db->update('tbladmin', $data);
        }
        /*Speaker*/
        //function get_user()
        // {
        //            $query=$this->db->get('tblspeaker');
        //            return $query->result_array();
        //        }
        function delete_user($id)
        {
            $this->db->where('ID', $id);
            $this->db->delete('users'); 
        }
        function get_user_id($id)
        {
            $this->db->select("
            users.id,
            users.membership_id,
            users.username,
            users.email,
            users.name AS name,
            users.first_name,
            users.company_name,
            users.description,
            users.country,
            users.status
            ");
            $this->db->from('users');
            $this->db->where('id',$id);
            //$this->db->limit(1);
            $query = $this->db->get();
            if ($query->num_rows()>0)
            {
                return $query->row();
            }
            else
            {
                return FALSE;
            }            
        }
        function update_user($id,$data)
        {
            $this->db->update('users',$data,array('ID'=>$id)); 
        }
        function get_all_speaker($num,$offset)
        {
            $this->db->select();
            $this->db->from('users');
			$this->db->where("users.userlevel <>", "9"); 
            $this->db->join('geo_countries','users.country = geo_countries.con_id');
            $this->db->limit($num,$offset);
            $this->db->order_by('users.username','ASC');
            $query = $this->db->get();
            return $query->result_array();
        }
        function get_all_country(){
            $country=$this->db->get('geo_countries');
            return $country->result_array();
        }
        //Category
         function get_all_category($lg)
        {
            $this->db->select();
            $this->db->from('tblcategory');
            $this->db->where('lang',$lg);
            $query = $this->db->get();
            return $query->result_array();
        }
        function delete_category($cateid)
        {
            $this->db->where('ID', $cateid);
            $this->db->delete('tblcategory');
        }
        function modify_category($cateid,$data)
        {
            $this->db->update('tblcategory',$data,array('ID'=>$cateid));
        }
        function get_category_by_id($id)
        {
            $query = $this->db->get_where('tblcategory',array('ID'=>$id)); 
            return $query->result_array();
        }
        function add_new_category($data)
        {
            $this->db->insert('tblcategory', $data);
        }
        function get_video_by_category($cateID)
        {
            $query = $this->db->get_where('videos',array('category'=>$cateID)); 
            return $query->result_array();
        }
    }
?>
