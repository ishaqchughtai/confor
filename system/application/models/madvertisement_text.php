<?php
    class MAdvertisement_text extends Model
    {
        function MAdvertisement_text()
        {
            parent::Model();
            $this->load->database();
        }

        //get all advertisement
        function get_advertisement($offset,$num)
        {
            $this->db->select('
            tbladvertisement_text.ID,
            tbladvertisement_text.DateBeginning,
            tbladvertisement_text.DateExpiry,
            tbladvertisement_text.Title,
            tbladvertisement_text.AdvertiserEmail,
            tbladvertisement_text.URL,
            tbladvertisement_text.Body,
            tbladvertisement_text.Viewed
            ');
            $this->db->from('tbladvertisement_text');
            $this->db->order_by("ID", "desc");
            $this->db->limit($offset,$num);
            $query = $this->db->get();
            return $query->result_array();
        }
        //get random advertisement
        function get_random_advertisement($dateNow)
        {            
            $query = $this->db->query('SELECT * FROM tbladvertisement_text where tbladvertisement_text.DateExpiry > Now() ORDER BY RAND() LIMIT 4 ');
            return $query->result_array();
        }

        function get_data_to_form($id)
        {
            $query = $this->db->get_where('tbladvertisement_text',array('ID'=>$id));
            return $query->result_array();
        }

        //add new advertisement
        function add_advertisement($dateBeginning,$dateExpiry,$title,$advertiserEmail,$url,$body,$viewed)
        {
            try
            {
                $data = array(
                'DateBeginning'=>$dateBeginning,
                'DateExpiry'=>$dateExpiry,
                'Title'=>$title,                                          
                'AdvertiserEmail'=>$advertiserEmail,
                'URL'=>$url,
                'Body'=>$body,
                'Viewed'=>$viewed                
                );    
                $this->db->insert('tbladvertisement_text',$data);
                return TRUE;
            }
            catch(Exception $ex)
            {
                return FALSE;    
            }
        }
        
        //edit advertisement
        function edit_advertisement($id,$dateExpiry,$title,$url,$body)
        {
            $data = array(
            'ID'=>$id,
            'DateExpiry'=>$dateExpiry,                                          
            'Title'=>$title,
            'URL'=>$url,
            'Body'=>$body
            );
            $this->db->update('tbladvertisement_text',$data,array('ID'=>$id));
        }


        //delete advertisement
        function delete_advertisement($id)
        {
            $this->db->delete('tbladvertisement_text',array('ID'=>$id));
        }


        //count record
        function count_record($keywords)
        {
            $this->db->from('tbladvertisement_text');
            $this->db->like('AdvertiserName',$keywords,'both');
            $query = $this->db->count_all_results();
            return $query;
        }
        // search advertisement
        function search($keywords,$per_page,$offset)
        {
            $this->db->select('
            tbladvertisement_text.ID,
            tbladvertisement_text.DateBeginning,
            tbladvertisement_text.DateExpiry,
            tbladvertisement_text.AdvertiserName,
            tbladvertisement_text.AdvertiserEmail,
            tbladvertisement_text.URL,
            tbladvertisement_text.TextTips,
            tbladvertisement_text.ImageLink
            ');
            $this->db->from('tbladvertisement_text');
            $this->db->like('AdvertiserName',$keywords,'both');
            $this->db->limit($per_page,$offset);
            $query = $this->db->get();
            $adv=FALSE; 
            foreach ($query->result_array() as $row_adv)
            {                    
                $adv[] = $row_adv;
            }
            $query->free_result();  
            return $adv;
        }

        // Check email
        function check_email_model($email)
        {
            $email = addslashes($email);
            $query = $this->db->query("select AdvertiserEmail from tbladvertisement_text where AdvertiserEmail='".$email."'");
            if($query->num_rows()>0)
            {
                return TRUE;
            }
            return FALSE;
        } 

        function get_advertisement_by_id($id)
        {
            $query=$this->db->query('Select URL,Viewed from tbladvertisement_text WHERE tbladvertisement_text.ID = '.$id);
            return $query;
        }
        function update_view_time($id,$viewed)
        {
            $data = array('Viewed'=>$viewed);
            $this->db->update('tbladvertisement_text',$data,array('ID'=>$id));
        }
    }
?>
