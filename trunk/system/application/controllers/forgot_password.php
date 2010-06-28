<?php
    class Forgot_password extends Frontend_controller{
        function Forgot_password(){
            parent::Frontend_controller();
            $this->load->model('MUser');   
            $this->load->model('Mforgotpassword');   
            $this->load->helper('date');
            
             $this->load->model('send_mail');
            $this->load->helper('xemmex');
            $this->load->library('form_validation');
        }
        function index()
        {
            $this->recover_password();
        }
        function recover_password()
        {
            if($this->input->post('submit'))
            {
                $this->form_validation->set_rules('email',__('CON_forgot_pass_email_address'),'trim|required|valid_email');
                $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
                $Email=$this->input->post('email'); 
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('speaker/form_forgot_password'); 
                }
                else
                {
                    if ( $this->MUser->is_email_exists($Email))
                    {
                        $temppass = random_string('alnum', 20);
                        
                        $datestring = "%Y-%m-%d";
                        $time = time();
                        $Date=mdate($datestring,$time);
                        $Date = random_string('alnum', 30);
                        $temppass1 = $temppass.$Date;
                        $temppass1 = random_string('alnum', 50);
                        if($this->Mforgotpassword->update_temp_pass($temppass1,$Email)==TRUE)
                        {
                            $from = 'mailbag@xemmex.com';
                            $name_from = 'mailbag@xemmex.com';
                            $content = __('CON_forgot_email_content_retrieve_password').$temppass;
                            $to = $this->input->post('email');
                            $subject=__('CON_forgot_email_title_retrieve_password');
                            //$content=$this->input->post('message');
                            
                            $this->send_mail->send('text',$from , $name_from, $to, $subject, $content);
                            redirect(base_url().'/forgot_password/send_success');
                            
                        }
                    }else
                    {
                        $this->_data['error'] = __('CON_forgot_email_to_not_exist');
                        $this->_load_view('speaker/form_forgot_password');                        
                    }
                }
            }else
            {
                $this->_load_view('speaker/form_forgot_password'); 
            }   
        }
        
        function send_success()
        {
            $this->_data['error'] = __('CON_forgot_check_email_to_retrieve');
            $this->_load_view('speaker/form_forgot_password');    
        }
        
        function change_pass($key_password='')
        {
            if($key_password==FALSE) 
            {
                redirect('home/index'); 
            }
            else
            {
                if($this->input->post('submit'))
                {
                    $this->form_validation->set_rules('username',__('CON_user_name_label'),'trim|required');
                    $this->form_validation->set_rules('email',__('CON_user_email_label'),'trim|required');
                    $this->form_validation->set_rules('new_password',__('CON_new_password_label'),'trim|required');
                    $this->form_validation->set_rules('passconf',__('CON_retype_new_password_label'),'trim|required');
                    $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');

                    $username=$this->input->post('username'); 
                    $email=$this->input->post('email'); 
                    $new_password=$this->input->post('new_password'); 
                    $passconf=$this->input->post('passconf');                 
                    if($this->form_validation->run()==FALSE)
                    {
                        $this->_load_view('speaker/form_change_pw_forgot'); 
                    }
                    else
                    {
                        if($new_password == $passconf)
                        {
                            if ($this->Mforgotpassword->is_data_exists($username,$email,$key_password)==TRUE)
                            {
                                $passconf = md5($passconf);
                                $key_password_new = random_string('alnum', 20);
                                if($this->Mforgotpassword->update_temp_pass($key_password_new,$email))
                                {
                                    if($this->Mforgotpassword->update_pass($passconf,$username)==TRUE)
                                    {
                                        $this->_data['error'] = __('CON_change_password_success');
                                        $this->_load_view('speaker/form_change_pw_forgot');      
                                    }    
                                }
                            }else
                            {
                                $this->_data['error'] = 'CON_data_is_not_exists';
                                $this->_load_view('speaker/form_change_pw_forgot');                        
                            }       
                        }else
                        {
                            $this->_data['error'] = __('CON_confirm_password_same_new_pass') ;
                            $this->_load_view('speaker/form_change_pw_forgot');     
                        }

                    }
                }
                else
                {
                    $this->_load_view('speaker/form_change_pw_forgot'); 
                } 
            }


        }                 
    }
?>
