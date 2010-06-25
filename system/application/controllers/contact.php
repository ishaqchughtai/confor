<?php
    class Contact extends Controller{

        function Contact()
        {
            parent::Controller();
            $this->load->library('email');
        }

        function index()
        {
            $this->_load_view('contact'); 		
        }
        function send_contact($mail_type='text', $from, $name_from, $to, $subject, $content)
        {
            $this->form_validation->set_rules('name','Name','required');
            $this->form_validation->set_rules('email','Email','required|valid_email');
            $this->form_validation->set_rules('message','Message','required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>'); 
            if($this->form_validation->run()!=FALSE)
            {
                $this->load->view('contact');      
            }else
            {
                
                $name_from=$this->input->post('name');
                $from=$this->input->post('email');
                $content=$this->input->post('message');
                $to='mailbag@xemmex.com';
                $subject='Contact message from '.$name_from;

                $this->email->clear();
                $config['charset'] = $this->config->item('charset');
                $config['mailtype'] =$mail_type;
                $config['validate'] =TRUE;
                $this->email->initialize($config);

                $this->email->from($from, $name_from);
                $this->email->to($to);
                $this->email->subject($subject);
                $this->email->message($content);    
                $this->email->send();
            }
        }
    }
?>
