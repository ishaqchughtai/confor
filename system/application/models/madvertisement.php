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
      tbladvertisement.ImageLink
      ');
      $this->db->from('tbladvertisement');
      $this->db->order_by("ID", "desc");
      $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }
	
	function get_random_by_category($category, $limit) 
	{
		// bo sung category trong database
		$this->db->from('tbladvertisement');
		//$this->db->where('category', $category);
		$this->db->order_by("RAND()");
		$this->db->limit($limit);
		return $this->db->get();
	}

    function get_data_to_form($id)
    {
      $query = $this->db->get_where('tbladvertisement',array('ID'=>$id));
      return $query->result_array();
    }

    //add new advertisement
    function add_advertisement($dateBeginning,$dateExpiry,$advertiserName,$advertiserEmail,$url,$textTips,$imageLink)
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
        'ImageLink'=>$imageLink
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
    function count_record()
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
        $this->db->like('AdvertiserName',$this->input->post('search_field'),'both');
        $this->db->get();
        $query = $this->db->count_all_results();
        return $query;
    }
    // search advertisement
    function search_advertisement()
    {
      try
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
        $this->db->like('AdvertiserName',$this->input->post('search_field'),'both');
        $query = $this->db->get();
        if($query)
        {
          return $query;

        }
        return 0;    
      }
      catch(Exception $e)
      {
        return 0;
      }
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
  }
?>
