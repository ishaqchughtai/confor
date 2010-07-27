<?php
class Mtraining extends Model{
    function Mtraining()
    {
        parent::Model();
        $this->load->database();
    }

    //Select No
    //function strNo($lg)
    //    {
    //        $strNo='';
    //        if($lg == 'fr')
    //        {
    //            $strNo='No_temp';
    //        }else
    //        {
    //            $strNo='No';
    //        }
    //        return $strNo;    
    //    }

    function get_all_training($lg,$offset,$num)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='tbltraining.No_temp';
        }else
        {
            $strNo='tbltraining.No';
        }
        $this->db->select("
        tbltraining.ID,
        tbltraining.Date,
        tbltraining.Title,
        tbltraining.Content,
        tbltraining.Lang,
        tbltraining.Image,"
        .$strNo);
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
    function del_article($id,$no,$lg)
    {
        if($lg == 'fr')
        {
            $sql = "CALL swap_training_fr(".$id.", ".$no.")";
            $this->db->query($sql);
        }else
        {
            $sql = "CALL swap_training_en(".$id.", ".$no.")";
            $this->db->query($sql);
        }  
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
    function add_training($date,$title,$content,$lg,$image,$no)
    {                    
        try
        {
            $strNo='';
            if($lg == 'fr')
            {
                $strNo='No_temp';
            }else
            {
                $strNo='No';
            }
            $data = array(
            'Date'=>$date,
            'Title'=>$title,                                          
            'Content'=>$content,
            'Lang'=>$lg,
            'Image'=>$image,
            $strNo=>$no
            );    
            $this->db->insert('tbltraining',$data);
            return TRUE;
        }
        catch(Exception $ex)
        {
            return FALSE;    
        }
    }
    function edit_training($id,$title,$content,$image)
    {
        $data = array(
        'Title'=>$title,                                          
        'Content'=>$content,
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
    //get Max No
    function get_no($lg)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='No_temp';
        }else
        {
            $strNo='No';
        }
        $this->db->select_max($strNo,'max_no');
        $query = $this->db->get('tbltraining');
        return $query->result();
    }

    //update one
    function update_one($no_one,$lg)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='No_temp';
        }else
        {
            $strNo='No';
        }
        $data=array(
        $strNo=>0
        );
        $this->db->update('tbltraining',$data,array($strNo=>$no_one));
        return TRUE;
    }    

    //update two
    function update_two($no_tow,$lg)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='No_temp';
        }else
        {
            $strNo='No';
        }
        $data=array(
        $strNo=>$no_tow
        );
        $this->db->update('tbltraining',$data,array($strNo=>0));
        return TRUE;
    }
    //update temp
    function update_temp($no_temp_1,$no_temp_2,$lg)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='No_temp';
        }else
        {
            $strNo='No';
        }
        $data=array(
        $strNo=>$no_temp_2
        );
        $this->db->update('tbltraining',$data,array($strNo=>$no_temp_1));
        return TRUE;
    }
    //get_all_by_order
    function get_all_by_order($lg,$offset,$num)
    {
        $strNo='';
        if($lg == 'fr')
        {
            $strNo='tbltraining.No_temp';
        }else
        {
            $strNo='tbltraining.No';
        }
        $this->db->select("
        tbltraining.ID,
        tbltraining.Date,
        tbltraining.Title,
        tbltraining.Content,
        tbltraining.Lang,
        tbltraining.Image,"
        .$strNo);
        $this->db->from('tbltraining');
        $this->db->order_by($strNo, "desc");
        $this->db->where('tbltraining.Lang ', $lg); 
        $this->db->limit($num,$offset);
        $query = $this->db->get();
        return $query->result_array();
    }
}
