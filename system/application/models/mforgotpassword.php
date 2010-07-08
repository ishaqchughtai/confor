<?php
    class Mforgotpassword extends Model{
        function Mforgotpassword()
        {
            parent::Model();
            $this->load->database();
        }
        function update_temp_pass($temppass,$email)
        {              
            $data = array('tempPassword'=>$temppass);
            $this->db->update('users',$data,array('email'=>$email));
            return TRUE;    
        }
        function update_pass($passconf,$username)
        {              
            $data = array('password'=>$passconf);
            $this->db->update('users',$data,array('username'=>$username));
            return TRUE;    
        }
        function is_data_exists($username,$email,$key_password)
        {        
            $this->db->select("users.username,
            users.email,
            users.`password`,
            users.tempPassword");
            $this->db->from('users');
            $this->db->where('username', $username);            
            $this->db->where('email', $email);            
            $this->db->where('tempPassword', $key_password);            
            $this->db->limit(1);    
            $query = $this->db->get();
            if ($query->num_rows()>0) 
            {
                return TRUE;
            }
            else 
            {
                return FALSE;
            }                                
        }
        function is_key_password_exists($key_password)
        {        
            $this->db->select("users.tempPassword");            
            $this->db->from('users');           
            $this->db->where('tempPassword', $key_password);            
            $this->db->limit(1);    
            $query = $this->db->get();
            if ($query->num_rows()>0) 
            {
                return TRUE;
            }
            else 
            {
                return FALSE;
            }                                
        }
    }
?>