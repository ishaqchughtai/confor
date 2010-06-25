<?php
    class Forgot_password extends Frontend_controller{
        function Forgot_password(){
            parent::Frontend_controller();
            $this->load->model('MUser');   
            $this->load->model('Mforgotpassword');   
        }
        function index()
        {
            $this->recover_password();
        }
        function recover_password()
        {
            if($this->input->post('submit'))
            {
                $this->form_validation->set_rules('email','Email','trim|required|valid_email');
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
                        $temppass_sendmail = $temppass;
                        if($this->Mforgotpassword->update_temp_pass($temppass,$Email)==TRUE)
                        {
                            $this->_data['error'] = 'You need to check e-mail to retrieve your password';
                            $this->_load_view('speaker/form_forgot_password');    
                        }
                    }else
                    {
                        $this->_data['error'] = 'The Email is not exists';
                        $this->_load_view('speaker/form_forgot_password');                        
                    }
                }
            }else
            {
                $this->_load_view('speaker/form_forgot_password'); 
            }   
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
                    $this->form_validation->set_rules('username','User Name','trim|required');
                    $this->form_validation->set_rules('email','Email','trim|required');
                    $this->form_validation->set_rules('new_password','New Password','trim|required');
                    $this->form_validation->set_rules('passconf','Confirm Password','trim|required');
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
                                        $this->_data['error'] = 'Password change success';
                                        $this->_load_view('speaker/form_change_pw_forgot');      
                                    }    
                                }
                            }else
                            {
                                $this->_data['error'] = 'The data is not exists';
                                $this->_load_view('speaker/form_change_pw_forgot');                        
                            }       
                        }else
                        {
                            $this->_data['error'] = 'Confirm Password be the same as New Password' ;
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
