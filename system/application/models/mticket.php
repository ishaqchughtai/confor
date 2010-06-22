<?php
    class Mticket extends Model{
        function Mticket()
        {
            parent::Model();
            $this->load->database();
        }
        function add_ticket_by_speaker($Date,$Status,$Title,$Message,$Is_answered,$SpeakerID)
        {        
            $data = array(
            'Date'=>$Date,                                          
            'Status'=>$Status,
            'Message'=>$Message,
            'Title'=>$Title,
            'Is_answered'=>$Is_answered,
            'Speaker'=>$SpeakerID);      
            $this->db->insert('tblticket',$data);
            return TRUE;            
        }        
        function add_ticket_by_admin($Date,$Title,$Message,$Ticket,$Admin)
        {        
            $data = array(
            'Date'=>$Date,                                          
            'Message'=>$Message,
            'Title'=>$Title,
            'Ticket'=>$Ticket,
            'Admin'=>$Admin);      
            $this->db->insert('tblfeedback',$data);
            return TRUE;            
        }
        function show_all_ticket($offset,$num)
        {
            $this->db->select('
            tblticket.ID,
            tblticket.Date,
            tblticket.Title,
            tblticket.`Status`,
            tblticket.Message,
            tblticket.Speaker,
            tblticket.Is_answered,
            tblspeaker.`Name`,
            tblspeaker.Email'
            );
            $this->db->from('tblticket');
            $this->db->join('tblspeaker','tblticket.Speaker = tblspeaker.ID');
            $this->db->order_by("tblticket.Is_answered", "asc");
			$this->db->order_by("tblticket.Date", "desc");
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }
        function show_ticket_by_id($id)
        {
            $this->db->select('
            tblticket.ID,
            tblticket.Date,
            tblticket.Title,
            tblticket.`Status`,
            tblticket.Message,
            tblticket.Speaker,
            tblticket.Is_answered,
            tblspeaker.`Name`,
            tblspeaker.Email'
            );
            $this->db->from('tblticket');
            $this->db->where('tblticket.ID',$id);
            $this->db->join('tblspeaker','tblticket.Speaker=tblspeaker.ID  ');
            $query = $this->db->get();
            return $query->result_array();
        }
        function update_ticket_by_admin($id,$Is_answered)
        {
            $data = array('Is_answered'=>$Is_answered);
            $this->db->update('tblticket',$data,array('ID'=>$id));
        }
        function delete_ticket($id)
        {
            //$this->db->delete('tblfeedback',array('ID'=>$idfeedback));
            $this->db->delete('tblticket',array('ID'=>$id));
            return TRUE;
        }
    }  
?>
