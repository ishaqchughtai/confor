<?php
class Mtraining extends Model{
    function Mtraining()
    {
        parent::Model();
        $this->load->database();
    }

    function get_all_training($lg,$offset,$num)
    {
        $this->db->select("
        tbltraining.ID,
        tbltraining.Date,
        tbltraining.Title,
        tbltraining.Content,
        tbltraining.Lang,
        tbltraining.Image");
        $this->db->from('tbltraining');
        $this->db->order_by("tbltraining.Date", "desc");
        $this->db->where('tbltraining.Lang ', $lg); 
        $this->db->limit($num,$offset);
        $query = $this->db->get();
        return $query->result_array();
    }

    function count_record($lg)
    {
        $this->db->from('tbltraining');
        $this->db->where(array('Lang'=>$lg));
        $query = $this->db->count_all_results();
        return $query;
    }
    
    function count_record_image($id)
    {
        $this->db->from('tbltraining');
        $this->db->where(array('ID'=>$id));
        $this->db->where(array('Image'=>'thumb_noimage.gif'));
        $query_search = $this->db->get();
        return $query_search;
    }
    function del_article($id)
    {
        $this->db->delete('tbltraining',array('ID'=>$id));
        return TRUE; 
    }

    function get_training_by_title($title)
    {
        $this->db->select("
        tbltraining.ID,
        tbltraining.Date,
        tbltraining.Title,
        tbltraining.Content,
        tbltraining.Lang,
        tbltraining.Image");
        $this->db->from('tbltraining');
        $this->db->where('tbltraining.Title',$title);
        $query = $this->db->get();
        return $query->result_array(); 
    }
    function add_training($date,$title,$content,$lg,$image)
    {                    
        try
        {
            $data = array(
            'Date'=>$date,
            'Title'=>$title,                                          
            'Content'=>$content,
            'Lang'=>$lg,
            'Image'=>$image
            );    
            $this->db->insert('tbltraining',$data);
            return TRUE;
        }
        catch(Exception $ex)
        {
            return FALSE;    
        }
    }
    function edit_training($id,$title,$content,$lg,$image)
    {
        $data = array(
        'Title'=>$title,                                          
        'Content'=>$content,
        'Lang'=>$lg,
        'Image'=>$image
        );
        $this->db->update('tbltraining',$data,array('ID'=>$id));
    }
    //get_data_to_form
    function get_data_to_form($id)
    {
        $query = $this->db->get_where('tbltraining',array('ID'=>$id));
        return $query->result();
    }
}
