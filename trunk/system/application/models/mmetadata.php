<?php
  class MMetadata extends Model
  {
    function MMetadata()
    {
      parent::Model();
      $this->load->database();
    }

    function get_to_form($type_resource,$id_resource)
    {
      $this->_data['path'][] = array(
      'name' => __("CF_edit_meta"),
      'link' => '#'
      );
      $this->db->select('
      tblmetadata.id,
      tblmetadata.description,
      tblmetadata.keywords,
      tblmetadata.title,
      tblmetadata.author,
      tblmetadata.type_resource,
      tblmetadata.id_resource,
      ');
      $this->db->from('tblmetadata');     
      $this->db->where(array('tblmetadata.id_resource'=>$id_resource,'tblmetadata.type_resource'=>$type_resource));
      $query = $this->db->get();
      $meta=FALSE;
      foreach ($query->result_array() as $row_event)
      {                    
        $meta[] = $row_event;
      }
      $query->free_result();  
      return $meta;
      //return $query->result();
    }
    
    //edit metadata
    function edit_meta($id,$title,$keywords,$description,$author)
    {
      $data = array(
      'title'=>$title,                                          
      'keywords'=>$keywords,
      'description'=>$description,
      'author'=>$author
      );
      $this->db->update('tblmetadata',$data,array('id'=>$id));
    }
    
    //add new metadata
    function add_meta($title,$keywords,$description,$author,$type_resource,$id_resource)
    {                    
      try
      {
        $data = array(
        'title'=>$title,                                          
        'keywords'=>$keywords,
        'description'=>$description,
        'author'=>$author,
        'type_resource'=>$type_resource,
        'id_resource'=>$id_resource
        );    
        $this->db->insert('tblmetadata',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }
     
  }
?>