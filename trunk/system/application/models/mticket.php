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
        function show_open_tickets($offset,$num)
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
            $this->db->where("tblticket.Is_answered", "0");
            $this->db->order_by("tblticket.Status", "desc");
            $this->db->order_by("tblticket.Date", "desc");            
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }        
        function show_closed_tickets($offset,$num)
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
            $this->db->where("tblticket.Is_answered", "1");
            $this->db->order_by("tblticket.Status", "desc");            
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
            $this->db->join('tblspeaker','tblticket.Speaker=tblspeaker.ID');
            $query = $this->db->get();
            return $query->result_array();  
        }
        function show_feedback_by_id_ticket($id)
        {
            $this->db->select('
            tbladmin.Name,
            tbladmin.Email,
            tblfeedback.ID,
            tblfeedback.Date,
            tblfeedback.Title,
            tblfeedback.Message,
            tblfeedback.Ticket,
            tblfeedback.Admin'
            );
            $this->db->from('tblfeedback');
            $this->db->where('tblfeedback.Ticket',$id);
            $this->db->join('tbladmin','tblfeedback.Admin = tbladmin.ID');
            $query_feedback = $this->db->get();
            return $query_feedback->result_array();
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
        function count_record_open()
        {
            $this->db->select('
            COUNT(tblticket.ID) as count_open'
            );
            $this->db->from('tblticket');
            $this->db->where("tblticket.Is_answered", "0");
            $query_count_record_open = $this->db->count_all_results();
            return $query_count_record_open;
        }        
        function count_record_closed()
        {
            $this->db->select('
            COUNT(tblticket.ID) as count_closed'
            );
            $this->db->from('tblticket');
            $this->db->where("tblticket.Is_answered", "1");
            $query_count_record_closed = $this->db->count_all_results();
            return $query_count_record_closed;
        }
        function count_record_open_speaker($SpeakerID)
        {
            $this->db->select('
            COUNT(tblticket.ID) as count_open'
            );
            $this->db->from('tblticket');
            $this->db->where("tblticket.Is_answered", "0");
            $this->db->where("tblticket.Speaker", $SpeakerID); 
            $query_count_record_open_speaker = $this->db->count_all_results();
            return $query_count_record_open_speaker;
        }        
        function count_record_closed_speaker($SpeakerID)
        {
            $this->db->select('
            COUNT(tblticket.ID) as count_closed'
            );
            $this->db->from('tblticket');
            $this->db->where("tblticket.Is_answered", "1");
            $this->db->where("tblticket.Speaker", $SpeakerID);
            $query_count_record_closed_speaker = $this->db->count_all_results();
            return $query_count_record_closed_speaker;
        }        
        function show_open_tickets_speaker($offset,$num,$SpeakerID)
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
            $this->db->where("tblticket.Is_answered", "0");
            $this->db->where("tblticket.Speaker", $SpeakerID);            
            $this->db->order_by("tblticket.Status", "desc");
            $this->db->order_by("tblticket.Date", "desc");            
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }        
        function show_closed_tickets_speaker($offset,$num,$SpeakerID)
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
            $this->db->where("tblticket.Is_answered", "1");
            $this->db->where("tblticket.Speaker", $SpeakerID);
            $this->db->order_by("tblticket.Status", "desc");            
            $this->db->order_by("tblticket.Date", "desc");             
            $this->db->limit($num,$offset);
            $query = $this->db->get();
            return $query->result_array();
        }
    }  
?>
