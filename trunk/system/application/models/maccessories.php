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
        function get_all_element()
        {
            $query = $this->db->get('tblaccessories');
            return $query;
        }        
        function update_element($ElementName,$ElementContent,$ID)
        {
            $data = array('ElementContent'=>$ElementContent,'ElementName'=>$ElementName);
            $this->db->update('tblaccessories',$data,array('ID'=>$ID));
            return TRUE; 
        }
    }
?>
