<?php
  class MAdvertisement extends Model
  {
    function MAdvertisement()
    {
      parent::Model();
      $this->load->database();
    }

    //get all advertisement
    function get_advertisement($offset,$num)
    {
      $this->db->select('
      tbladvertisement.ID,
      tbladvertisement.DateBeginning,
      tbladvertisement.DateExpiry,
      tbladvertisement.AdvertiserName,
      tbladvertisement.AdvertiserEmail,
      tbladvertisement.URL,
      tbladvertisement.TextTips,
      tbladvertisement.ImageLink,
      tbladvertisement.Viewed
      ');
      $this->db->from('tbladvertisement');
      $this->db->order_by("ID", "desc");
      $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }

    function get_random_by_category($category, $limit) 
    {
      $query = $this->db->query("SELECT * FROM (`tbladvertisement`) WHERE `tbladvertisement`.`DateExpiry` >= CURDATE() ORDER BY RAND() LIMIT ".$limit);
      // bo sung category trong database
      //$this->db->from('tbladvertisements');
      //$this->db->where('category', $category);
//      $this->db->where('tbladvertisement.DateExpiry >= ',NOW());
//      $this->db->order_by("RAND()");
//      $this->db->limit($limit);
      //return $this->db->get();
      return $query;
    }

    function get_data_to_form($id)
    {
      $query = $this->db->get_where('tbladvertisement',array('ID'=>$id));
      return $query->result_array();
    }

    //add new advertisement
    function add_advertisement($dateBeginning,$dateExpiry,$advertiserName,$advertiserEmail,$url,$textTips,$imageLink,$viewed)
    {
      try
      {
        $data = array(
        'DateBeginning'=>$dateBeginning,
        'DateExpiry'=>$dateExpiry,
        'AdvertiserName'=>$advertiserName,                                          
        'AdvertiserEmail'=>$advertiserEmail,
        'URL'=>$url,
        'TextTips'=>$textTips,
        'ImageLink'=>$imageLink,
        'Viewed'=>$viewed,
        );    
        $this->db->insert('tbladvertisement',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }

    //edit advertisement
    function edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$imageLink)
    {
      $data = array(
      'ID'=>$id,
      'DateExpiry'=>$dateExpiry,                                          
      'AdvertiserEmail'=>$advertiserEmail,
      'URL'=>$url,
      'TextTips'=>$textTips,
      'ImageLink'=>$imageLink
      );
      $this->db->update('tbladvertisement',$data,array('ID'=>$id));
    }


    //delete advertisement
    function delete_advertisement($id)
    {
      $this->db->delete('tbladvertisement',array('ID'=>$id));
    }


    //count record
    function count_record($keywords)
    {
      $this->db->from('tbladvertisement');
      $this->db->like('AdvertiserName',$keywords,'both');
      $query = $this->db->count_all_results();
      return $query;
    }
    // search advertisement
    function search($keywords,$per_page,$offset)
    {
      $this->db->select('
      tbladvertisement.ID,
      tbladvertisement.DateBeginning,
      tbladvertisement.DateExpiry,
      tbladvertisement.AdvertiserName,
      tbladvertisement.AdvertiserEmail,
      tbladvertisement.URL,
      tbladvertisement.TextTips,
      tbladvertisement.ImageLink
      ');
      $this->db->from('tbladvertisement');
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
      $query = $this->db->query("select AdvertiserEmail from tbladvertisement where AdvertiserEmail='".$email."'");
      if($query->num_rows()>0)
      {
        return TRUE;
      }
      return FALSE;
    } 

    function get_advertisement_by_id($id)
    {
      $query=$this->db->query('Select URL,Viewed from tbladvertisement WHERE tbladvertisement.ID = '.$id);
      return $query;
    }
    function update_view_time($id,$viewed)
    {
      $data = array('Viewed'=>$viewed);
      $this->db->update('tbladvertisement',$data,array('ID'=>$id));
    }
  }
?>
