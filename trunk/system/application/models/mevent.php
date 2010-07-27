<?php
  class MEvent extends Model
  {
    function MEvent()
    {
      parent::Model();
      $this->load->database();
    }
    function count_event_by_en($lg)
    {
      $this->db->from('tblevent');
      $this->db->where(array('lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }
    function get_all_event($lg,$offset,$num)
    {
      $this->db->select("
      tblevent.ID,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status,
      users.username
      ");
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.ID');
      $this->db->where(array('lang'=>$lg));
      $this->db->order_by("tblevent.ID", "desc");
      $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }

    function count_record_by_date($date,$lg)
    {
      $this->db->from('tblevent');
      $this->db->where(array('Date'=>$date,'Status'=>1,'lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }


    function get_event_by_date($lg,$date,$per_page,$offset)
    {
      $this->db->select('
      tblevent.ID,
      users.username,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.id');
      $this->db->where(array('Date'=>$date,'tblevent.Status'=>1,'lang'=>$lg));
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
      users.username,
      tblevent.Speaker,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.id');
      $this->db->where(array('tblevent.ID'=>$id));
      $query = $this->db->get();
      return $query->result_array();    
    }

    //Add new event
    function add_event($speaker,$date,$title,$subject,$keywords,$description,$status,$lg)
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
        'Status'=>$status,
        'lang'=>$lg
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
      users.name,
      users.email,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Speaker,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status,
      tblevent.lang
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.id');
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
    function edit_event($id,$speaker_id,$title,$subject,$keywords,$description,$status,$lg)
    {
      $data = array(
      'Speaker'=>$speaker_id,
      'Title'=>$title,                                          
      'Subject'=>$subject,
      'Keywords'=>$keywords,
      'Description'=>$description,
      'Status'=>$status,
      'lang'=>$lg
      );
      $this->db->update('tblevent',$data,array('ID'=>$id));
    }

    function delete($id)
    {
      $this->db->delete('tblevent',array('ID'=>$id));
    }

    //count record by title
    function count_record_by_title($keywords,$lg)
    {
      $this->db->from('tblevent');
      $this->db->like('Title', $keywords);
      $this->db->where(array('tblevent.Status'=>1,'lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }

    //count record by keyword
    function count_record_by_keywords($keywords,$lg)
    {
      $this->db->from('tblevent');
      $this->db->like('Keywords', $keywords);
      $this->db->where(array('lang'=>$lg));
      $this->db->where(array('tblevent.Status'=>1,'lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }

    //search event by title
    function search_event($keywords,$lg,$per_page,$offset)
    {
      $this->db->select('
      tblevent.ID,
      users.first_name,
      users.name,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status,
      users.username
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.ID');
      $this->db->like('title',$keywords,'both');
      $this->db->where(array('tblevent.Status'=>1,'lang'=>$lg));
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

    function search_event_by_keyword($keywords,$lg,$per_page,$offset)
    {
      $this->db->select('
      tblevent.ID,
      users.first_name,
      users.name,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status,
      users.username
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.ID');
      $this->db->like('Keywords',$keywords,'both') ;
      $this->db->where(array('tblevent.Status'=>1,'lang'=>$lg));
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

    function count_event_by_speaker($speaker,$lg)
    {
      $this->db->from('tblevent');
      $this->db->where(array('tblevent.Speaker'=>$speaker,'lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }
    function list_event_by_speaker($speaker,$lg,$per_page,$offset)
    {
      $this->db->select('
      tblevent.ID,
      users.username,
      tblevent.Speaker,
      tblevent.`Date`,
      tblevent.Title,
      tblevent.Subject,
      tblevent.Keywords,
      tblevent.Description,
      tblevent.Status
      ');
      $this->db->from('tblevent');
      $this->db->join('users','tblevent.Speaker = users.id');
      $this->db->where(array('tblevent.Speaker'=>$speaker,'lang'=>$lg));
      $this->db->order_by("tblevent.ID", "desc");
      $this->db->limit($per_page,$offset);
      $your_event = $this->db->get();
      return $your_event->result_array();
    }

    function count_event_by_week($week,$lg)
    {
      $this->db->from('tblevent');
      $this->db->where(array('WEEKOFYEAR(Date)'=>$week,'lang'=>$lg));
      $count_event_week = $this->db->count_all_results();
      return $count_event_week;
    }

    function get_event_by_week($lg,$week,$per_page,$offset)
    {
      $this->db->select("
      tblevent.ID,
      tblevent.Title,
      tblevent.Status,
      ");
      $this->db->from('tblevent');
      $this->db->where(array('WEEKOFYEAR(Date)'=>$week,'Status'=>1,'lang'=>$lg));
      $this->db->order_by('ID','desc');
      $this->db->limit($per_page,$offset);
      $query = $this->db->get();
      $week_events=FALSE;
      foreach ($query->result_array() as $row_event)
      {                    
        $week_events[] = $row_event;
      }
      $query->free_result();  
      return $week_events;
    }

    function count_event_by_month($month,$lg)
    {
      $this->db->from('tblevent');
      $this->db->where(array('MONTH(Date)'=>$month,'lang'=>$lg));
      $count_event_month = $this->db->count_all_results();
      return $count_event_month;
    }

    function get_event_by_month($lg,$month,$per_page,$offset)
    {
      $this->db->select("
      tblevent.ID,
      tblevent.Title,
      tblevent.Status,
      ");
      $this->db->from('tblevent');
      $this->db->where(array('MONTH(Date)'=>$month,'Status'=>1,'lang'=>$lg));
      $this->db->order_by('ID','desc');
      $this->db->limit($per_page,$offset);
      $query = $this->db->get();
      $month_events=FALSE;
      foreach ($query->result_array() as $row_event)
      {                    
        $month_events[] = $row_event;
      }
      $query->free_result();  
      return $month_events;
    }
  }
?>
