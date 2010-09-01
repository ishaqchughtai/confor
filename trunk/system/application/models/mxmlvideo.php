<?php
class Mxmlvideo extends Model{
    function Mxmlvideo()
    {
        parent::Model();
        $this->load->database();
    }
    function get_xmlvid()
    {
        $query = $this->db->get('tblxmlvid');
        return $query->result_array();
    }
    function update_xmlvid($id,$data)
    {
        $this->db->update('tblxmlvid',$data,array('id'=>$id));
    }
}
/* End of file mxmlvideo.php */
/* Location: ./system/application/models/mxmlvideo.php */