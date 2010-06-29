<?php
    class Contact extends Frontend_controller{

        function Contact()
        {
            parent::Frontend_controller();
            $this->load->model('send_mail');
            $this->load->helper('xemmex');
            $this->load->library('form_validation');
        }

        function index()
        {
            $this->_data['page_title'] = __('CON_contact_title');//'Contact us';
            $this->_load_view('contact'); 		
        }
        function send_contact()//($mail_type='text', $from, $name_from, $to, $subject, $content)
        {
            $this->form_validation->set_rules('name',__("CON_your_name"),'required');//'Name'
            $this->form_validation->set_rules('email',__("CON_contact_email"),'required|valid_email');//'Email'
            $this->form_validation->set_rules('message',__("CON_your_meesage"),'required');//'Message'
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>'); 
            if($this->form_validation->run()!=FALSE)
            {
                $this->_load_view('contact');      
            }else
            {
                $from = $this->input->post('email');
                $name_from = $this->input->post('name');.'<'.$this->input->post('email').'>';
                $content = $this->input->post('message');
                $to = 'admin@conferences-formations.com';
                $subject=__('CON_your_contact_mail').$name_from;
                $content=$this->input->post('message');
                /*$from=$this->input->post('email');
                $content=$this->input->post('message');
                $to='admin@conferences-formations.com';
                $subject=__('CON_your_contact_mail').$name_from;

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
                */
                $this->send_mail->send('text',$from , $name_from, $to, $subject, $content);
                redirect(base_url().'home/contact');
            }
        }
    }
?>
