<?php
  class MEvent extends Model
  {
    function MEvent()
    {
      parent::Model();
      $this->load->database();
    }

    function get_all_event($offset,$num)
    {
      $this->db->select("
      tblevent.ID,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblspeaker.Name");
      $this->db->from('tblevent');
      $this->db->join('tblspeaker','tblevent.Speaker = tblspeaker.ID');
      $this->db->order_by("Date", "desc");
      $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }

    function count_record_by_date($date)
    {
      $this->db->from('tblevent');
      $this->db->where(array('Date'=>$date));
      $query = $this->db->count_all_results();
      return $query;
    }


    function get_event_by_date($date,$per_page,$offset)
    {
      $this->db->select('
      tblevent.ID,
      tblspeaker.Name,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('tblspeaker','tblevent.Speaker = tblspeaker.ID');
      $this->db->where(array('Date'=>$date));
      $this->db->limit($per_page,$offset);
      $query = $this->db->get();
      $events=FALSE;
      foreach ($query->result_array() as $row_event)
      {                    
        $events[] = $row_event;
      }
      $query->free_result();  
      return $events;
    }


    function get_event_by_id($id)
    {
      $this->db->select('
      tblevent.ID,
      tblspeaker.Name,
      tblevent.Speaker,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('tblspeaker','tblevent.Speaker = tblspeaker.ID');
      $this->db->where(array('tblevent.ID'=>$id));
      $query = $this->db->get();
      return $query->result_array();    
    }

    //Add new event
    function add_event($speaker,$date,$title,$subject,$keywords,$description,$status)
    {                    
      try
      {
        $data = array(
        'Speaker'=>$speaker,
        'Date'=>$date,
        'Title'=>$title,                                          
        'Subject'=>$subject,
        'Keywords'=>$keywords,
        'Description'=>$description,
        'Status'=>$status
        );    
        $this->db->insert('tblevent',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }    

    //get_data_to_form_speaker
    function get_data_to_form($id)
    {
      $query = $this->db->get_where('tblevent',array('ID'=>$id));
      return $query->result();
    }


    //get_data_to_form_admin
    function get_data_to_form_admin($id)
    {
      $this->db->select('
      tblevent.ID,
      tblspeaker.Name,
      tblspeaker.Email,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('tblspeaker','tblevent.Speaker = tblspeaker.ID');
      $this->db->where(array('tblevent.ID'=>$id));
      $query = $this->db->get();
      return $query->result();
    }

    //Edit event of speaker
    function edit($id,$title,$subject,$keywords,$description)
    {
      $data = array(
      'Title'=>$title,                                          
      'Subject'=>$subject,
      'Keywords'=>$keywords,
      'Description'=>$description
      );
      $this->db->update('tblevent',$data,array('ID'=>$id));
    }

    //Edit event of admin    
    function edit_event($id,$speaker_id,$title,$subject,$keywords,$description,$status)
    {
      $data = array(
      'Speaker'=>$speaker_id,
      'Title'=>$title,                                          
      'Subject'=>$subject,
      'Keywords'=>$keywords,
      'Description'=>$description,
      'Status'=>$status
      );
      $this->db->update('tblevent',$data,array('ID'=>$id));
    }

    function delete($id)
    {
      $this->db->delete('tblevent',array('ID'=>$id));
    }

    function count_record_by_keywords($keywords)
    {
      $this->db->from('tblevent');
      $this->db->like('Keywords', $keywords);
      $query = $this->db->count_all_results();
      return $query;
    }


    function search_event($keywords,$per_page,$offset)
    {
      //try
      //      {
      $this->db->select('
      tblevent.ID,
      tblspeaker.Name,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description
      ');
      $this->db->from('tblevent');
      $this->db->join('tblspeaker','tblevent.Speaker = tblspeaker.ID');
      $this->db->like('title',$keywords,'both') ;
      $this->db->limit($per_page,$offset);

      $query = $this->db->get();
      $events=FALSE; 
      foreach ($query->result_array() as $row_event)
      {                    
        $events[] = $row_event;
      }
      $query->free_result();  
      return $events;
    }
  }
?>