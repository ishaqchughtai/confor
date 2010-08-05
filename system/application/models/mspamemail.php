<?php
class Mspamemail extends Model{
    function Mspamemail()
    {
        parent::Model();
        $this->load->database();
    }
    function show_spam_email($offset,$num)
    {
        $this->db->select("
        tblspamemail.ID,
        tblspamemail.Email
        ");
        $this->db->from('tblspamemail');
        $this->db->limit($num,$offset);
        $query = $this->db->get();
        return $query->result_array();    
    }
    function add_spam_email($Email)
    {
        $data = array(
        'Email'=>$Email
        );       
        $this->db->insert('tblspamemail',$data);
        return TRUE;
    }
    function del_spam_email($id)
    {
        $this->db->delete('tblspamemail',array('ID'=>$id));
    }
    function count_record_email()
    {
        $this->db->from('tblspamemail');
        $query = $this->db->count_all_results();
        return $query;
    }
    function check_spamemail($email)
    {
        $query = $this->db->get_where('tblspamemail',array('Email'=>$email));
        return $query;
    }
    function update_check_spamemail_comment($email,$Spamemail)
    {
        $data = array( 
        'Spamemail'=>$Spamemail
        );
        $this->db->update('tblcomment',$data,array('Email'=>$email));
        return TRUE;
    }
    function check_spamemail_comment()
    {
        $this->db->select("
        tblspamemail.ID,
        tblspamemail.Email
        ");
        $this->db->from('tblspamemail');
        $query = $this->db->get();
        return $query->result_array(); 
    }
}

