<?php
    class Ticket extends Speaker_controller {
        function Ticket()
        {
            parent::Speaker_controller();
            $this->_container = 'container';        
            $this->load->model('Mticket');        
            $this->load->helper('date');     					
            $this->load->model('send_mail');
            $this->load->model('Mshopproduct','mshopproduct');
        }
        function index()
        {
            $admin_data = is_admin(FALSE);
            if ($admin_data == FALSE) 
            {
                is_speaker();
                redirect(site_url("ticket/open_tickets_speaker")); 
            } 
            else 
            {
                redirect(site_url("ticket/open_tickets"));
            }			
        }
        function send_ticket_by_speaker()
        {
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets_speaker")
            ); 
            $this->_data['path'][] = array(
            'name' => __("CF_add_tic"),
            'link' => '#'
            );

            //$speaker_data = is_speaker();
			$speaker_data = check_membership();
			
            $this->form_validation->set_rules('title',__('CON_title'),'required');
            $this->form_validation->set_rules('message',__('CON_your_meesage'),'required');
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
                $SpeakerID= $speaker_data["speaker_id"];
                if($this->Mticket->add_ticket_by_speaker($Date,$Status,$Title,$Message,$Is_answered,$SpeakerID)==TRUE)
                {
                    $from = $speaker_data["speaker_email"];
                    //$name_from = $speaker_data["speaker_email"];
                    $name_from ='';
                    $content = sprintf(__('CON_ticket_content_email_to_admin'),$Title,$Message);
                    $to = 'admin@conferences-formations.com';
                    $subject=__('CON_ticket_title_email').$this->input->post('title');

                    $this->send_mail->send('text',$from , $name_from, $to, $subject, $content);
                    redirect(site_url("ticket/send_ticket_speaker_succ"));
                }   
            }            
        }        

        function send_ticket_speaker_succ()
        {
            $this->_data['error']= __('CON_ticket_send_success');
            $this->_load_view('home/ticket');
        }

        function send_ticket_by_admin($Ticket)
        {				            
            is_admin();

            $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
            $this->_data['header']['page'] = '/speaker/header_panel';
            $this->form_validation->set_rules('title',__('CON_title'),'required');
            $this->form_validation->set_rules('message',__('CON_your_meesage'),'required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->ticket_content_closed($Ticket);
            }else
            {
                $datestring = "%Y-%m-%d %h:%m:%s";
                $time = time();
                $Date=mdate($datestring,$time);
                $Title=$this->input->post('title');
                $Message=$this->input->post('message');
                $Admin =$this->session->userdata('admin_id');
                $Is_answered=1;
                if($this->Mticket->add_ticket_by_admin($Date,$Title,$Message,$Ticket,$Admin)==TRUE)
                {
                    $to = '';
                    $name_speaker = '';
                    $get_ticket = $this->Mticket->show_ticket_by_id($Ticket);

                    if (count($get_ticket) == 1) 
                    {
                        //$get_ticket = row();
                        //$query_speaker = $this->MUser->get_by_id($get_ticket['Speaker']);//
                        $get_ticket = $get_ticket[0];
                        $query_speaker = $this->MUser->get_by_id($get_ticket['Speaker']);//
                        if($query_speaker->num_rows() == 1)
                        {
                            $row = $query_speaker->row();
                            $to = $row->email;
                            $name_speaker = $row->name;
                        }
                    }

                    if($to!='')
                    {
                        $from = 'admin@conferences-formations.com';
                        //$name_from = 'admin@conferences-formations.com';
                        $name_from = '';
                        $content = sprintf(__('CON_ticket_content_email_to_speaker'),$name_speaker,$Title,$Message);

                        $subject=__('CON_ticket_title_email').$this->input->post('title');
                        //echo $from.'-'.$name_from.'-'.$to.'-'.$subject.'-'.$content;
                        $this->send_mail->send('text',$from , $name_from, $to, $subject, $content);    
                        //var_dump($this->send_mail->send('text',$from , $name_from, $to, $subject, $content));
                    }                    

                    $this->Mticket->update_ticket_by_admin($Ticket,$Is_answered);
                    redirect('ticket/ticket_content_closed/'.$Ticket);
                }   
            }                                    
        }

        function open_tickets()
        {
            is_admin();                        
            $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
            $this->_data['header']['page'] = '/speaker/header_panel';

            $this->_data['path'][0] = array(
            'name' => __("CF_admin"),
            'link' => site_url("admin")
            );            
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_open_list"),
            'link' => '#'
            );			

            $config['base_url'] = base_url().'index.php/ticket/open_tickets/';
            $config['total_rows'] = $this->Mticket->count_record_open();
            $config['per_page']='6';

            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = __("CF_next");
            $config['prev_link'] = __("CF_previous");
            $config['last_link'] = __("CF_last");
            $config['first_link'] = __("CF_first");

            $this->pagination->initialize($config);
            $this->_data['open_tickets'] = $this->Mticket->show_open_tickets($this->uri->segment(3),$config['per_page']);
            $this->_data['query_count_record_open'] = $this->Mticket->count_record_open();
            $this->_data['query_count_record_closed'] = $this->Mticket->count_record_closed();  
            $this->_data['pagination'] = $this->pagination->create_links();                
            $this->_load_view('admin/ticket_list'); 
        }        
        function closed_tickets()
        {
            is_admin();

            $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
            $this->_data['header']['page'] = '/speaker/header_panel';

            $this->_data['path'][0] = array(
            'name' => __("CF_admin"),
            'link' => site_url("admin")
            );            
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_closed_list"),
            'link' => '#'
            );		

            $config['base_url'] = base_url().'index.php/ticket/closed_tickets/';
            $config['total_rows'] = $this->Mticket->count_record_closed();
            $config['per_page']='6';

            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['prev_link'] = __("CF_previous");
            $config['last_link'] = __("CF_last");
            $config['first_link'] = __("CF_first");

            $this->pagination->initialize($config);
            $this->_data['closed_tickets'] = $this->Mticket->show_closed_tickets($this->uri->segment(3),$config['per_page']);
            $this->_data['query_count_record_open'] = $this->Mticket->count_record_open(); 
            $this->_data['query_count_record_closed'] = $this->Mticket->count_record_closed();
            $this->_data['pagination'] = $this->pagination->create_links();                
            $this->_load_view('admin/closed_tickets'); 
        }
        
        function open_tickets_speaker()
        {
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets_speaker")
            );
            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_open_list"),
            'link' => '#'
            );
            $speaker_data = is_speaker();
            $SpeakerID= $speaker_data["speaker_id"];                        
            $config['base_url'] = base_url().'index.php/ticket/open_tickets_speaker/';
            $config['total_rows'] = $this->Mticket->count_record_open_speaker($SpeakerID);
            $config['per_page']='6';

            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = __("CF_next");
            $config['prev_link'] = __("CF_previous");
            $config['last_link'] = __("CF_last");
            $config['first_link'] = __("CF_first");

            $this->pagination->initialize($config);
            $this->_data['open_tickets_speaker'] = $this->Mticket->show_open_tickets_speaker($this->uri->segment(3),$config['per_page'],$SpeakerID);
            $this->_data['query_count_record_open_speaker'] = $this->Mticket->count_record_open_speaker($SpeakerID);
            $this->_data['query_count_record_closed_speaker'] = $this->Mticket->count_record_closed_speaker($SpeakerID);  
            $this->_data['pagination'] = $this->pagination->create_links();                
            $this->_load_view('home/ticket_list_speaker'); 
        }        
        function closed_tickets_speaker()
        {
            $speaker_data = is_speaker();
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets_speaker")
            );
            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_closed_list"),
            'link' => '#'
            );  
            $SpeakerID= $speaker_data["speaker_id"];                      
            $config['base_url'] = base_url().'index.php/ticket/closed_tickets_speaker/';
            $config['total_rows'] = $this->Mticket->count_record_closed_speaker($SpeakerID);
            $config['per_page']='6';

            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = __("CF_next");
            $config['prev_link'] = __("CF_previous");
            $config['last_link'] = __("CF_last");
            $config['first_link'] = __("CF_first");

            $this->pagination->initialize($config);            
            $this->_data['closed_tickets_speaker'] = $this->Mticket->show_closed_tickets_speaker($this->uri->segment(3),$config['per_page'],$SpeakerID);
            $this->_data['query_count_record_open_speaker'] = $this->Mticket->count_record_open_speaker($SpeakerID);
            $this->_data['query_count_record_closed_speaker'] = $this->Mticket->count_record_closed_speaker($SpeakerID);
            $this->_data['pagination'] = $this->pagination->create_links();                
            $this->_load_view('home/closed_tickets_speaker'); 
        }
        
        function ticket_content($id)
        {
            is_admin();
            $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
            $this->_data['header']['page'] = '/speaker/header_panel';

            $this->_data['path'][0] = array(
            'name' => __("CF_admin"),
            'link' => site_url("admin")
            );            
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_open_list"),
            'link' => site_url("ticket/open_tickets")
            );
            
            $this->_data['query'] = $this->Mticket->show_ticket_by_id($id);               
            $this->_load_view('admin/ticket');       
        }        
        function ticket_content_closed($id)
        {
            is_admin();
            $this->_data['side_bar']['page'] = '/speaker/sidebar_empty';
            $this->_data['header']['page'] = '/speaker/header_panel';
            $this->_data['path'][0] = array(
            'name' => __("CF_admin"),
            'link' => site_url("admin")
            );            
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_closed_list"),
            'link' => site_url("ticket/closed_tickets")
            );
            $this->_data['query'] = $this->Mticket->show_ticket_by_id($id);
            $this->_data['query_feedback'] = $this->Mticket->show_feedback_by_id_ticket($id);      
            $this->_load_view('admin/ticket_content_closed');   
        } 
               
        function ticket_content_speaker($id)
        {
            is_speaker();
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets_speaker")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_closed_list"),
            'link' => site_url("ticket/open_tickets_speaker")
            );
            $this->_data['query'] = $this->Mticket->show_ticket_by_id($id);      
            $this->_load_view('home/ticket_content_open');   
        }       
        function ticket_content_closed_speaker($id)
        {
            is_speaker();
            $this->_data['path'][] = array(
            'name' => __("CF_list_tic"),
            'link' => site_url("ticket/open_tickets_speaker")
            );    

            $this->_data['path'][] = array(
            'name' => __("CF_admin_ticket_closed_list"),
            'link' =>   site_url("ticket/closed_tickets_speaker")
            );
            $this->_data['query'] = $this->Mticket->show_ticket_by_id($id); 
            $this->_data['query_feedback'] = $this->Mticket->show_feedback_by_id_ticket($id);      
            $this->_load_view('home/ticket_content_closed');   
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
