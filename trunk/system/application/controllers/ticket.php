<?php
    class Ticket extends Frontend_controller {
        function Ticket()
        {
            parent::Frontend_controller();
            $this->_container = 'container';        
            $this->load->model('Mticket');        
            $this->load->helper('date');     
			$this->load->model('MSpeaker');
			$this->load->model('Remember_me');					
        }
        function index()
        {
			$admin_data = is_admin(FALSE);
			if ($admin_data == FALSE) 
			{
				is_speaker();
				$this->_load_view('home/ticket'); 
			} 
			else 
			{
				redirect(site_url("ticket/all_ticket"));
			}			
        }
        function send_ticket_by_speaker()
        {
			$speaker_data = is_speaker();
            $this->form_validation->set_rules('title','Title','required');
            $this->form_validation->set_rules('message','Message','required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('home/ticket');
            }else
            {
                $datestring = "%Y-%m-%d %h:%m:%s";
                $time = time();
                $Date=mdate($datestring,$time);
                $Title=$this->input->post('title');
                $Status=$this->input->post('status');
                $Message=$this->input->post('message'); 
                $Is_answered=0;
                $SpeakerID= $speaker_data["speaker_id"];   //check thang speaker da dang nhap chua de lay id insert vao database
                if($this->Mticket->add_ticket_by_speaker($Date,$Status,$Title,$Message,$Is_answered,$SpeakerID)==TRUE)
                {
                    $this->_load_view('home/ticket');
                }   
            }            
        }        
        function send_ticket_by_admin($Ticket)
        {
				            
                $admin_data = is_admin();
				$this->form_validation->set_rules('title','Title','required');
				$this->form_validation->set_rules('message','Message','required');
				$this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
				if($this->form_validation->run()==FALSE)
				{
					$this->ticket_content($Ticket);
				}else
				{
					$datestring = "%Y-%m-%d %h:%m:%s";
					$time = time();
					$Date=mdate($datestring,$time);
					$Title=$this->input->post('title');
					$Message=$this->input->post('message');
					$Admin =$admin_data['id'];
					$Is_answered=1;
					if($this->Mticket->add_ticket_by_admin($Date,$Title,$Message,$Ticket,$Admin)==TRUE)
					{
						$this->Mticket->update_ticket_by_admin($Ticket,$Is_answered);
						redirect('ticket/ticket_content/'.$Ticket);
					}   
				}                                    
        }
        function all_ticket()
        {
			is_admin();                        
			$config['base_url'] = base_url().'index.php/ticket/all_ticket/';
			$config['total_rows'] = $this->db->count_all('tblticket');
			$config['per_page']='6';

			$config['full_tag_open'] = '<li>';        
			$config['full_tag_close'] = '</li>'; 
			$config['next_link'] = 'Next >';
			$config['prev_link'] = '< Previous';
			$config['last_link'] = 'Last >>';
			$config['first_link'] = '<< First';

			$this->pagination->initialize($config);
			$this->_data['tickets'] = $this->Mticket->show_all_ticket($this->uri->segment(3),$config['per_page']);
			$this->_data['pagination'] = $this->pagination->create_links();                
			$this->_load_view('admin/ticket_list'); 
        }
        function ticket_content($id)
        {
			is_admin();
            $this->_data['query'] = $this->Mticket->show_ticket_by_id($id);      
            $this->_load_view('admin/ticket');   
        }
        function delete_ticket($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $this->Mticket->delete_ticket($id);
                $this->index();
            }
        }
    }
?>
