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
            tbloffice.lang,
            tbloffice.Image
            ");
            $this->db->from('tbloffice');
            $this->db->where(array('lang'=>$lg));

            //$this->db->order_by("tbloffice.ID", "desc");
            set_order_from_setting('tbloffice','order_conf_field','order_conf_sort','date');
            $this->db->limit($offset,$num);
            $query = $this->db->get();
            return $query->result_array();
        }

        function add_conference_office($date,$title,$content,$lg,$image,$no)
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
                'date'=>$date,
                'title'=>$title,                                          
                'content'=>$content,
                'lang'=>$lg,
                'Image'=>$image,
                $strNo=>$no
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
        function count_record_image($id)
        {
            $this->db->from('tbloffice');
            $this->db->where(array('ID'=>$id));
            $this->db->where(array('Image'=>'thumb_noimage.gif'));
            $query_search = $this->db->get();
            return $query_search;
        }
        function edit_office($id,$title,$content,$image)
        {
            $data = array(
            'title'=>$title,                                          
            'content'=>$content,
            'Image'=>$image
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
            tbloffice.lang,
            tbloffice.Image
            ');
            $this->db->from('tbloffice');
            $this->db->where(array('tbloffice.id'=>$id));
            $query = $this->db->get();
            return $query->result_array();    
        }

        //function list_all($lg, $offset, $num)
        //    {
        //      $this->db->from('tbloffice');
        //      $this->db->where(array('lang'=>$lg));      
        //	  $this->db->order_by("tbloffice.sort", "asc");
        //      set_order_from_setting('tbloffice','order_conf_field','order_conf_sort','date');
        //	  $this->db->limit($offset,$num);
        //      $query = $this->db->get();
        //      return $query->result_array();
        //    }

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
            $query = $this->db->get('tbloffice');
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
            $this->db->update('tbloffice',$data,array($strNo=>$no_one));
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
            $this->db->update('tbloffice',$data,array($strNo=>0));
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
            $this->db->update('tbloffice',$data,array($strNo=>$no_temp_1));
            return TRUE;
        }
        //get_all_by_order 
        function get_all_by_order($lg,$offset,$num)
        {
            $strNo='';
            if($lg == 'fr')
            {
                $strNo='tbloffice.No_temp';
            }else
            {
                $strNo='tbloffice.No';
            }
            $this->db->select("
            tbloffice.id,
            tbloffice.date,
            tbloffice.title,
            tbloffice.content,
            tbloffice.lang,
            tbloffice.Image,"
            .$strNo);
            $this->db->from('tbloffice');
            $this->db->order_by($strNo, "desc");
            $this->db->where('tbloffice.lang ', $lg); 
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }
        //Delete
        function del_article($id,$no,$lg)
        {
            if($lg == 'fr')
            {
                $sql = "CALL swap_tbloffice_fr(".$id.", ".$no.")";
                $this->db->query($sql);
            }else
            {
                $sql = "CALL swap_tbloffice_en(".$id.", ".$no.")";
                $this->db->query($sql);
            }  
            return TRUE; 
        }
    }
?>
