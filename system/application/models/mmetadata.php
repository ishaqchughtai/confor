<?php
  class MMetadata extends Model
  {
    function MMetadata()
    {
      parent::Model();
      $this->load->database();
    }

	function out_meta($type_resource,$id_resource)
	{
		$this->db->from('tblmetadata');   
		$this->db->where('id_resource',$id_resource);
		$this->db->where('type_resource',$type_resource);
		$this->db->limit(1);
		$query = $this->db->get();
		if ($query->num_rows()<1) return FALSE;
		return $query->row();
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
        'id_resource'=>$id_resource,
        );    
        $this->db->insert('tblmetadata',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }
    
    
    
    
    function out_static_meta($type_resource,$lg)
  {
    $this->db->from('tblmetadata_static');   
    $this->db->where('lang',$lg);
    $this->db->where('type_resource',$type_resource);
    $this->db->limit(1);
    $query = $this->db->get();
    if ($query->num_rows()<1) return FALSE;
    return $query->row();
  }
  
    function get_static_to_form($type_resource,$lg)
    {
      $this->_data['path'][] = array(
      'name' => __("CF_edit_meta"),
      'link' => '#'
      );
      $this->db->select('
      tblmetadata_static.id,
      tblmetadata_static.description,
      tblmetadata_static.keywords,
      tblmetadata_static.title,
      tblmetadata_static.author,
      tblmetadata_static.type_resource,
      tblmetadata_static.lang,
      ');
      $this->db->from('tblmetadata_static');     
      $this->db->where(array('tblmetadata_static.lang'=>$lg,'tblmetadata_static.type_resource'=>$type_resource));
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
    function edit_static_meta($id,$title,$keywords,$description,$author)
    {
      $data = array(
      'title'=>$title,                                          
      'keywords'=>$keywords,
      'description'=>$description,
      'author'=>$author
      );
      $this->db->update('tblmetadata_static',$data,array('id'=>$id));
    }
    
    //add new metadata
    function add_static_meta($title,$keywords,$description,$author,$type_resource,$lg)
    {                    
      try
      {
        $data = array(
        'title'=>$title,                                          
        'keywords'=>$keywords,
        'description'=>$description,
        'author'=>$author,
        'type_resource'=>$type_resource,
        'lang'=>$lg,
        );    
        $this->db->insert('tblmetadata_static',$data);
        return TRUE;
      }
      catch(Exception $ex)
      {
        return FALSE;    
      }
    }
     
  }
?>
