<?php
    class Maccessories extends Model{
        function Maccessories()
        {
            parent::Model();
            $this->load->database();
        }
        function get_element($ElementName)
        {
            $query = $this->db->get_where('tblaccessories',array('ElementName'=>$ElementName));
            return $query;
        }        
        function update_element($ElementName,$ElementContent)
        {
            $data = array('ElementContent'=>$ElementContent);
            $this->db->update('tblaccessories',$data,array('ElementName'=>$ElementName));
            return TRUE; 
        }
    }
?>
