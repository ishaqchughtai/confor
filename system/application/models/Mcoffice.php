<?php
  class Mcoffice extends Model{
    function Mcoffice(){
      parent::Model();
      $this->load->database();
    }

    function count_office_by_lang($lg)
    {
      $this->db->from('tbloffice');
      $this->db->where(array('lang'=>$lg));
      $query = $this->db->count_all_results();
      return $query;
    }
    function get_all_office($lg,$offset,$num)
    {
      $this->db->select("
      tbloffice.id,
      tbloffice.title,
      tbloffice.content,
      tbloffice.date,
      tbloffice.lang
      ");
      $this->db->from('tbloffice');
      $this->db->where(array('lang'=>$lg));
      
	  //$this->db->order_by("tbloffice.ID", "desc");
      set_order_from_setting('tbloffice','order_conf_field','order_conf_sort','date');
	  $this->db->limit($offset,$num);
      $query = $this->db->get();
      return $query->result_array();
    }

    function add_conference_office($date,$title,$content,$lg)
    {                    
      try
      {
        $data = array(
        'date'=>$date,
        'title'=>$title,                                          
        'content'=>$content,
        'lang'=>$lg
        );    
        $this->db->insert('tbloffice',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }
    
    //get_data_to_form
    function get_data_to_form($id)
    {
      $query = $this->db->get_where('tbloffice',array('id'=>$id));
      return $query->result();
    }
    
    function edit_office($id,$title,$content,$lg)
    {
      $data = array(
      'title'=>$title,                                          
      'content'=>$content,
      'lang'=>$lg
      );
      $this->db->update('tbloffice',$data,array('id'=>$id));
    }
    
    function delete($id)
    {
      $this->db->delete('tbloffice',array('id'=>$id));
    }
    
    function get_office_by_id($id)
    {
      $this->db->select('
      tbloffice.id,
      tbloffice.title,
      tbloffice.content,
      tbloffice.date,
      tbloffice.lang
      ');
      $this->db->from('tbloffice');
      $this->db->where(array('tbloffice.id'=>$id));
      $query = $this->db->get();
      return $query->result_array();    
    }
  }
?>
