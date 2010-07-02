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
      $this->_data['path'][] = array(
      'name' => __("CF_forgot_pass_title"),
      'link' => '#'
      );
      if($this->input->post('submit'))
      {
        $this->form_validation->set_rules('email',strtolower(__('CF_forgot_pass_email_address')),'trim|required|valid_email');
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
            $temppass = random_string('alnum', 200);
            $temppass = base_url().'forgot_password/change_pass/'.$temppass ;
            $temppass_encode = md5($temppass);
            if($this->Mforgotpassword->update_temp_pass($temppass_encode ,$Email)==TRUE)
            {
              $from = 'admin@conferences-formations.com';
              $name_from = 'admin@conferences-formations.com';
              $content = __('CF_forgot_email_content_retrieve_password').$temppass;
              $to = $this->input->post('email');
              $subject=__('CF_forgot_email_title_retrieve_password');
              //$content=$this->input->post('message');

              $this->send_mail->send('text',$from , $name_from, $to, $subject, $content);
              redirect(site_url("forgot_password/send_success"));

            }
          }else
          {
            $this->_data['error'] = __('CF_forgot_email_to_not_exist');
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
      $this->_data['error'] = __('CF_forgot_check_email_to_retrieve');
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
        $key_password = base_url().'forgot_password/change_pass/'.$key_password ;
        $key_password = md5($key_password);
        if($this->Mforgotpassword->is_key_password_exists($key_password)==TRUE)
        {
          if($this->input->post('submit'))
          {
            $this->form_validation->set_rules('username',strtolower(__("CF_user_name")),'trim|required');
            $this->form_validation->set_rules('email',strtolower(__("CF_admin_email")),'trim|required');
            $this->form_validation->set_rules('new_password',strtolower(__("CF_new_pass")),'trim|required');
            $this->form_validation->set_rules('passconf',strtolower(__("CF_confirm_pass")),'trim|required');
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
                  $key_password_new = random_string('alnum', 200);
                  $key_password_new = base_url().'forgot_password/change_pass/'.$key_password_new ;
                  $key_password_new = md5($key_password_new);
                  if($this->Mforgotpassword->update_temp_pass($key_password_new,$email))
                  {
                    if($this->Mforgotpassword->update_pass($passconf,$username)==TRUE)
                    {
                      $this->_data['error'] = __('CF_change_password_success');
                      $this->_load_view('speaker/form_change_pw_forgot');      
                    }    
                  }
                }else
                {
                  $this->_data['error'] = 'CF_data_is_not_exists';
                  $this->_load_view('speaker/form_change_pw_forgot');                        
                }  
              }else
              {
                $this->_data['error'] = __('CF_confirm_password_same_new_pass') ;
                $this->_load_view('speaker/form_change_pw_forgot');     
              }                          
            }
          }
          else
          {
            $this->_load_view('speaker/form_change_pw_forgot'); 
          }                        
        }else
        {
          redirect('home/index');     
        } 
      }
    }                   
  }
?>