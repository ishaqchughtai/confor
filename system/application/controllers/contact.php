<?php
    class Contact extends Frontend_controller{

        function Contact()
        {
            parent::Frontend_controller();
            $this->load->helper('date');
            $this->load->model('send_mail');
            $this->load->helper('xemmex');
            $this->load->library('form_validation');
            $this->_data['path'][] = array(
            'name' => __("CON_contact"),
            'link' => site_url("contact")
        );
        }

        function index()
        {
            $this->_data['page_title'] = __('CON_contact_title');//'Contact us';
            $this->_load_view('home/contact'); 		
        }
        function send_contact()//($mail_type='text', $from, $name_from, $to, $subject, $content)
        {
            $this->form_validation->set_rules('name',__("CON_your_name"),'required');//'Name'
            $this->form_validation->set_rules('email',__("CON_contact_email"),'required|valid_email');//'Email'
            $this->form_validation->set_rules('message',__("CON_your_meesage"),'required');//'Message'
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>'); 
            if($this->form_validation->run()===FALSE)
            {
                $this->_load_view('home/contact');
            }else
            {
                $from = $this->input->post('email');
                $name_from = $this->input->post('name');
                $content = $this->input->post('message');
                $to = 'admin@conferences-formations.com';
                $subject=__('CON_your_contact_mail').$name_from;
                $content=$this->input->post('message');

                if($this->send_mail->send('text',$from , $name_from, $to, $subject, $content)==TRUE)
                {
                	redirect(site_url("contact/contacts"));
                }else
                {
                	$this->_data['error']=__("CON_contact_error");
                    $this->_load_view('home/contact');
                }
                
            }
        }
        
        function contacts()
        {
            $this->_data['error']=__("CON_contact_successfully");
            $this->_load_view('home/contact');
        }
    }
?>