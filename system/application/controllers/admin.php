<?php
    require_once "phpuploader/include_phpuploader.php"; 
    /**
    * Speaker_lib Class
    *
    * @package		Confor
    * @subpackage	Controller
    * @category	Admin
    * @author		Dao Van Quyet - XEMMEX developer
    */
    class Admin extends Admin_controller
    {
        /*The constructor*/
        var $uploader = FALSE;
        var $vid_per_page = 10;

        function Admin(){
            parent::Admin_controller();
            $this->load->model('Madmin');
            $this->load->model('Muser');
            $this->load->model('Mvconference'); 
            $this->load->library('validation'); 
            $this->load->helper('date');
            $this->load->helper('text');
            $this->load->helper('string');
            $this->load->helper('xemmex');
            $this->load->model('send_mail');
            //$this->load->library('vid_lib');
            $this->load->model('MShop');
            $this->load->model('Maccessories');		
        }                       
        function index()
        {
            //$this->_data['status'] = $this->MShop->get_shop_status();
            if($this->session->userdata('admin')==TRUE)
            {
                $this->_data['path'][] = array(
                'name' => __("CF_control_panel"),
                'link' => site_url("admin")
                );								
                $this->_load_view('admin/index_admin'); 
            }
            else
            {
                // $this->_data['error']  =  ''; 				
                // $this->_load_view('admin/admin_login'); 
                redirect(site_url("admin/login"));
            } 
        }
        /*Login*/
        function login()
        {
            $this->_data['error']  =  '';
            if($this->session->userdata('admin')==TRUE)
            {
                redirect(site_url("admin"));                		
            }
            else
            {	
                $this->_data['path'][] = array(
                'name' => __("CF_admin_login"),
                'link' => site_url("admin/login")
                );			
                $rules['admin_email']='required|valid_email|xss_clean';
                $rules['admin_pass']='required';
                $this->validation->set_rules($rules);
                $admin_email_input=$this->input->post('admin_email');         
                $password_input=md5($this->input->post('admin_pass'));
                if($this->validation->run()==TRUE)
                {   
                    if($this->Madmin->process_login($admin_email_input)!=null)
                    {
                        $query=$this->Madmin->process_login($admin_email_input);
                        if ($query->num_rows() > 0)
                        {
                            $row = $query->row();
                            $id=$row->ID;
                            $admin_name=$row->Name;
                            $admin_first_name=$row->FirstName;
                            $admin_email=$row->Email;
                            $paypal_account=$row->PayPalAccount;
                            $admin_password=$row->Password;
                            $admin_right=$row->Right;
                        } 
                        if($admin_email_input==$admin_email){
                            if($password_input==$admin_password)
                            {
                                $this->session->set_userdata('admin_name',$admin_name);
                                $this->session->set_userdata('admin',$admin_email);
                                $this->session->set_userdata('right',$admin_right);
                                $this->session->set_userdata('admin_id',$id);                                 
                                redirect(site_url("admin"));
                            }
                            else
                            {
                                $this->_data['error']  =  __("CF_invalid_pass");  
                                $this->_load_view('admin/admin_login');
                            }
                        }
                    }
                    else
                    {
                        $this->_data['error']  =  __("CF_invalid_email");  
                        $this->_load_view('admin/admin_login');
                    }
                }
                else
                {
                    $this->_load_view('admin/admin_login');
                }
            }
        }
        /*Logout*/
        function logout()
        {
            $this->session->sess_destroy();            
            redirect('/');
            //$config['sess_expiration'] = -1;
        }
        /*For administrator*/
        function list_admin()
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_admin_list"),
                'link' => site_url("admin/list_admin")
                );
                $num_per_page = $this->uri->segment(3);
                if($num_per_page=='')
                {
                    $num_per_page=10;
                }
                $page_offset = $this->uri->segment(4);
                if($page_offset=='') 
                {
                    $page_offset=0;
                }

                $config['base_url'] = base_url().'index.php/admin/list_admin/'.$num_per_page.'/';
                $config['uri_segment'] = 4;
                $config['per_page']='10';
                $config += config_pagination_style();

                $config['total_rows'] = $this->db->count_all('tbladmin'); 
                $this->_data['query'] = $this->Madmin->get_all_admin($num_per_page,$page_offset);

                $this->pagination->initialize($config);  
                $this->_data['pagination'] = $this->pagination->create_links();
                $this->_load_view('admin/admin_list');				
                //$this->_data['query']=$this->Madmin->get_admins();
                //$this->_load_view('admin/admin_list');
            }
        }
        function add_new_admin()
        {
            if((int)$this->session->userdata('right')==0)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_add_admin"),
                'link' => site_url("admin/add_new_admin")
                );					
                $this->_data['error'] = ""; 
                $this->form_validation->set_rules('txtName',strtolower(__("CF_name")),'required');
                $this->form_validation->set_rules('txtFirstName',strtolower(__("CF_first_name")),'required');
                $this->form_validation->set_rules('txtEmail',strtolower(__("CF_email")),'required|valid_email|xss_clean');
                $this->form_validation->set_rules('txtpayPayAccount',strtolower(__("CF_paypal")),'required|valid_email|xss_clean');
                $this->form_validation->set_rules('txtPassword',strtolower(__("CF_pass")),'required');
                $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                if($this->input->post('submit'))
                {
                    if($this->form_validation->run()==FALSE)
                    {
                        $data['error'] = __("CF_insert_fail");
                        $this->_load_view('admin/new_admin');   
                    }
                    else
                    {
                        $data = array(
                        'Name'=>$this->input->post('txtName'),
                        'FirstName'=>$this->input->post('txtFirstName'),
                        'Email'=>$this->input->post('txtEmail'),
                        'PayPalAccount'=>$this->input->post('txtpayPayAccount'),
                        'Password'=>md5($this->input->post('txtPassword')),
                        );
                        if($this->Madmin->is_admin_exist($this->input->post('txtEmail'),$this->input->post('txtpayPayAccount'))!=TRUE)
                        {
                            $this->Madmin->add_new_admin($data);
                            redirect('admin/list_admin');
                        }
                        else
                        {
                            $this->_data['error']=__("CF_email_paypal_exist");
                            $this->_load_view('admin/new_admin');
                        }

                    }
                }
                else
                {
                    $this->_load_view('admin/new_admin');
                }
            }
        }
        function edit_admin($id){
            if((int)$id>0&&is_nan($id)==FALSE)
            {
                if((int)$this->session->userdata('right')==0)
                {
                    redirect(site_url("admin"));
                }
                else
                {   
                    $this->_data['path'][] = array(
                    'name' => __("CF_edit_ad"),
                    'link' => '#'
                    );                    
                    $data['error'] = ""; 
                    $this->form_validation->set_rules('txtName',strtolower(__("CF_name")),'required');
                    $this->form_validation->set_rules('txtFirstName',strtolower(__("CF_first_name")),'required');
                    $this->form_validation->set_rules('txtEmail',strtolower(__("CF_email")),'required|valid_email|xss_clean');
                    $this->form_validation->set_rules('txtpayPayAccount',strtolower(__("CF_paypal")),'required|valid_email|xss_clean');
                    $this->_data['query']=$this->Madmin->get_admin_by_id($id);
                    $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                    if($this->input->post('Submit'))
                    {
                        if($this->form_validation->run()==FALSE)
                        {
                            $this->_data['error'] = __("CF_cant_update");
                            $this->_load_view('admin/update_admin');
                        }
                        else
                        {
                            $data = array(
                            'Name'=>$this->input->post('txtName'),
                            'FirstName'=>$this->input->post('txtFirstName'),
                            'Email'=>$this->input->post('txtEmail'),
                            'PayPalAccount'=>$this->input->post('txtpayPayAccount'),
                            );
                            $this->Madmin->update_admin($id,$data);
                            redirect('admin/list_admin');  
                        }
                    }
                    else
                    {
                        $this->_load_view('admin/update_admin');
                    }
                }
            }
            else
            {
                redirect(site_url("admin"));
            }
        }
        function edit_profile($id)
        {
            $this->_data['path'][] = array(
            'name' => __("CF_edit_admin"),
            'link' => '#'
            );                    
            $data['error'] = ""; 
            $this->form_validation->set_rules('txtName',strtolower(__("CF_name")),'required');
            $this->form_validation->set_rules('txtFirstName',strtolower(__("CF_first_name")),'required');
            $this->form_validation->set_rules('txtEmail',strtolower(__("CF_email")),'required|valid_email|xss_clean');
            $this->form_validation->set_rules('txtpayPayAccount',strtolower(__("CF_paypal")),'required|valid_email|xss_clean');
            $this->_data['query']=$this->Madmin->get_admin_by_id($id);
            $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
            if($this->input->post('Submit'))
            {
                if($this->form_validation->run()==FALSE)
                {
                    $this->_data['error'] = __("CF_cant_update");
                    $this->_load_view('admin/update_admin');
                }
                else
                {
                    $data = array(
                    'Name'=>$this->input->post('txtName'),
                    'FirstName'=>$this->input->post('txtFirstName'),
                    'Email'=>$this->input->post('txtEmail'),
                    'PayPalAccount'=>$this->input->post('txtpayPayAccount'),
                    );
                    $this->Madmin->update_admin($id,$data);
                    redirect(site_url("admin"));  
                }
            }
            else
            {
                $this->_load_view('admin/update_admin');
            }
        }
        /*Speaker information managed by administrator*/
        function new_speaker()
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                $this->form_validation->set_rules('username', strtolower(__('CF_user')), $this->config->item('spk_user_rule').'|callback_is_username_exists');        
                $this->form_validation->set_rules('password', strtolower(__('CF_pass')), $this->config->item('spk_password_rule').'|matches[passconf]');
                $this->form_validation->set_rules('passconf', strtolower(__('CF_confirm')), $this->config->item('spk_password_rule'));                
                $this->form_validation->set_rules('name',strtolower(__('CF_name')),'required');
                $this->form_validation->set_rules('first_name',strtolower(__('CF_first_name')),'required');
                $this->form_validation->set_rules('email',strtolower(__('CF_email')),$this->config->item('spk_email_rule').'|callback_is_email_exists');
                if($this->input->post('submit'))
                {
                    if($this->form_validation->run()==FALSE)
                    {
                        $this->_data['country'] = $this->input->post('country');
                        $this->_data['company_name'] = $this->input->post('company_name');
                        $this->_data['description'] = $this->input->post('description');
                        $this->_load_view('admin/new_speaker');
                        return;   
                    }
                    else
                    {
                        $save_data['username'] = $this->input->post('username');
                        $save_data['email'] = $this->input->post('email');
                        $save_data['name'] = $this->input->post('name');                
                        $save_data['first_name'] = $this->input->post('first_name');
                        $save_data['company_name'] = $this->input->post('company_name');
                        $save_data['country'] = $this->input->post('country');                
                        $save_data['description'] = $this->input->post('description');                
                        $save_data['userlevel'] = 1;
                        $save_data['cookie_id'] = 0;
                        $save_data['token'] = 0;
                        $save_data['status'] = 1;
                        $save_data['notify'] = 1;
                        $save_data['membership_id'] = 1;
                        $save_data['register_date'] = 'NOW()';                
                        $save_data['last_ip'] = ''; 
						$save_data['language'] = $this->_data['lang'];
                        $save_data['password'] = $this->user_lib->_encode($this->input->post('password'));                                                                                
                        $this->MUser->add($save_data);

                        $this->session->set_flashdata('msg', 'Register succesfull');
                        $this->session->set_flashdata('class_msg', 'success');            
                        redirect('admin/list_user');
                    }
                }
                else
                {
                    $this->_load_view('admin/new_speaker');
                }
            }
        }
        function user_details($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_speaker_list"),
                'link' => site_url('admin/list_user')
                );

                $this->_data['path'][] = array(
                'name' => __("CF_view_details"),
                'link' => '#'
                );        
                $this->_data['query']=$this->Madmin->get_user_id($id);
                $this->_load_view('admin/user_details');
            }
        }
        function modify_user($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' => __("CF_speaker_list"),
                'link' => site_url('admin/list_user')
                );

                $this->_data['path'][] = array(
                'name' => __("CF_user_edit"),
                'link' => '#'
                );				
                $this->_data['error'] = ""; 
                $this->form_validation->set_rules('txtName',strtolower(__("CF_name")),'required');
                $this->form_validation->set_rules('txtFirstName',strtolower(__("CF_first_name")),'required');
                $this->form_validation->set_rules('txtCompanyName',strtolower(__("CF_Company_name")),'required');
                $this->form_validation->set_rules('txtEmail',strtolower(__("CF_email")),'required|valid_email');
                $this->form_validation->set_rules('txtDescription',strtolower(__("CF_des")),'trim|required');
                $this->_data['query']=$this->Madmin->get_user_id($id);
                //$this->_data['country']=$this->Madmin->get_all_country();
                $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                if($this->input->post('submit'))
                {    
                    if($this->form_validation->run()==FALSE)
                    {
                        $this->_load_view('admin/update_user');
                    }
                    else
                    {
//                        $suspension=0;
//                        if((int)$this->input->post('radiobutton')=='1')
//                        {
//                            $suspension=1;
//                        }
                        $data = array(
                        'name'=>$this->input->post('txtName'),
                        'first_name'=>$this->input->post('txtFirstName'),
                        'company_name'=>$this->input->post('txtCompanyName'),
                        'email' =>$this->input->post('txtEmail'),
                        'country' =>$this->input->post('country'),   
                        'description' =>$this->input->post('txtDescription'),
                        'status' =>$this->input->post('approved')
                        );
                        $query_user = $this->MUser->get_user($id);
                        foreach($query_user as $row)
                        {
                            if($row['status']==0)
                            {
                                $this->Madmin->update_user($id,$data);   
                            }elseif($this->input->post('approved')==0)
                            {
                                $username=$row['username'];
                                $email=$row['email'];
                                $name=$row['name'];
                                $first_name=$row['first_name'];
                                $from = $this->_setting['email'];   
                                $ar_key = array('[FIRST_NAME]', '[NAME]','[USER_NAME]','[SITE_URL]','[EMAIL_ADMIN]');
                                $ar_value = array($first_name,$name,$username,'HTTP://CONFOR.TV',$from);
                                $x = email_template_parse($row['language'],'AS',$ar_key,$ar_value);
                                $this->send_mail->send('text',$from , $name_from, $email, $x['subject'], $x['body']); 
                                $this->Madmin->update_user($id,$data);           
                            }else
                            {
                                $this->Madmin->update_user($id,$data);
                            }   
                        }


                        redirect('admin/list_user');  
                    }
                }
                else
                {
                    $this->_load_view('admin/update_user');
                }
            }   
        }
        function list_user()
        {
            is_admin();

            $this->_data['path'][] = array(
            'name' => __("CF_speaker_list"),
            'link' => '#'
            );
            $num_per_page = $this->uri->segment(3);
            if($num_per_page=='')
            {
                $num_per_page=10;
            }
            $page_offset = $this->uri->segment(4);
            if($page_offset=='') 
            {
                $page_offset=0;
            }			

            $config['base_url'] = base_url().'index.php/admin/list_user/'.$num_per_page.'/';
            $config['uri_segment'] = 4;
            $config['per_page']='10';
            $config += config_pagination_style();

            $config['total_rows'] = $this->db->count_all('users'); 
            $this->_data['query'] = $this->Madmin->get_all_speaker($num_per_page,$page_offset);

            $this->pagination->initialize($config);  
            $this->_data['pagination'] = $this->pagination->create_links();
            $this->_load_view('admin/user_list');

        }
        function delete_user($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $query=$this->Mvconference->get_conferenceid($id);
                $query_users=$this->MUser->get_user($id);
                foreach($query_users as $row)
                {
                    $username = $row['username'];
                    $first_name = $row['first_name'];
                    $name = $row['name'];
                    $from =$this->_setting['email'];
                    $to =$row['email'];
                    $name_from = '';
                    $link=base_url().'index.php/home/register';
                    $ar_key = array('[FIRST_NAME]', '[NAME]','[USER_NAME]','[SITE_URL]','[EMAIL_ADMIN]','[LINK_REG]');
                    $ar_value = array($first_name,$name,$username,'HTTP://CONFOR.TV',$from,$link);
                    $x = email_template_parse($row['language'],'DA',$ar_key,$ar_value);
                    $this->send_mail->send('text',$from , $name_from, $to, $x['subject'],$x['body']);  
                }
                foreach($query as $row)
                {
                    $this->Mvconference->delete_video($row['vid_id']);
                    $video_to_delete='./videos/'.$row['vhash'];
                    $image_to_delete='./thumbs/'.$row['shash'];
                    unlink($video_to_delete);
                    unlink($image_to_delete);
                }
                $this->Madmin->delete_user($id);
                redirect('admin/list_user');
            }    
        }
        function change_pass($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->form_validation->set_rules('txtOldPass', 'Old Password', 'trim|required');
                $this->form_validation->set_rules('txtNewPass', 'New Password', 'trim|required|matches[txtConfirmPass]');
                $this->form_validation->set_rules('txtConfirmPass', 'Password Confirmation', 'trim|required');
                $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                if($this->input->post('submit'))
                {
                    if($this->form_validation->run()==FALSE)
                    {
                        $this->_load_view('admin/change_password');
                    }
                    else
                    {
                        $query=$this->Madmin->get_admin_password($id);
                        $admin_pass=$query->Password;
                        $old_pass=md5($this->input->post('txtOldPass'));
                        //Password to change
                        $newpassword=md5($this->input->post('txtNewPass'));
                        if($old_pass==$admin_pass)
                        {
                            $this->Madmin->change_admin_password($id,$newpassword);
                            $this->_message('admin', 'Your password has been changed!', 'success',site_url("admin"));
                        }
                        else
                        {
                            $this->_data['error'] = "You did not enter correct old password!";
                            $this->_load_view('admin/change_password');
                        }
                    }
                }
                else
                {
                    $this->_load_view('admin/change_password');
                }
            }
        }

        //this is the Category!
        function category_managing()
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' =>__("CF_cate_man"),
                'link' => '#'
                );                
                $this->_load_view('admin/category_managing');
            }
        }
        function list_category()
        {
            is_admin();            
            $lg = $this->uri->segment(3);    
            if (! $lg) return;
            if (lang_name_by_short_key($lg,TRUE)==FALSE)
            {
                $this->_message('admin', 'Invaild language', 'error',site_url("admin/list_category").'/'.$this->_data['lang']);
            }
            $this->_data['path'][] = array(
            'name' =>__("CF_list_cate"),
            'link' => 'admin/list_category/'.$lg
            );
            $this->_data['lg'] = $lg;                
            $this->_data['query'] = $this->Madmin->get_all_category($lg);
            $this->_load_view('admin/category_list');   
        }
        function delete_category($catid)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                

                redirect(site_url("admin"));
            }
            else
            {
                $query=$this->Madmin->get_video_by_category($catid);
                foreach($query as $row)
                {
                    $this->Mvconference->delete_video($row['vid_id']);
                    $video_to_delete='./videos/'.$row['vhash'];
                    $image_to_delete='./thumbs/'.$row['shash'];
                    if(file_exists($video_to_delete))
                    {
                        unlink($video_to_delete);   
                    }
                    if(file_exists($video_to_delete))
                    {
                        unlink($image_to_delete);  
                    }

                }
                $this->Madmin->delete_category($catid);
                redirect('admin/list_category/'.$this->_data['lang']);
            }
        }
        function modify_category($cateid)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {
                $this->_data['path'][] = array(
                'name' =>__("CF_modify_cate"),
                'link' => '#'
                );                
                $this->_data['error'] = ""; 
                $this->form_validation->set_rules('txtCateName',strtolower(__("CF_cate_name")),'required');
                $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
                $this->_data['query']=$this->Madmin->get_category_by_id($cateid);
                if($this->input->post('submit'))
                {    
                    if($this->form_validation->run()==FALSE)
                    {
                        $this->_load_view('admin/category_update');

                    }
                    else
                    {
                        $data = array(
                        'Name'=>$this->input->post('txtCateName'),
                        );
                        $this->Madmin->modify_category($cateid,$data);
                        redirect('admin/list_category/'.$this->_data['lang']);  
                    }
                }
                else
                {
                    $this->_load_view('admin/category_update');
                }

            }
        }
        function add_new_category()
        {
            is_admin();    
            $lg = $this->input->post('lg');
            if (! $lg)
            {
                $lg = $this->_data['lang'];
            }
            $this->_data['lg'] = $lg;
            $this->_data['path'][] = array(
            'name' =>__("CF_add_cate"),
            'link' => site_url("admin/add_new_category")
            );                    
            $this->_data['error'] = ""; 
            $this->form_validation->set_rules('txtCateName',strtolower(__("CF_cate_name")),'required');
            $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
            if($this->input->post('submit'))
            {
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('admin/add_new_category');   
                }
                else
                {
                    $data = array(
                    'Name'=>$this->input->post('txtCateName'),
                    'lang'=>$lg
                    );
                    $this->Madmin->add_new_category($data);
                    redirect('admin/list_category/'.$this->_data['lang']);
                }
            }
            else
            {
                $this->_load_view('admin/add_new_category');
            }
        }

        //Accessories
        function get_element($Code='',$lg='')
        {
            is_admin();
            if(!$Code)
            {
                redirect('admin/index');
            }else
            {                
                $x=out_static_page_no_lg($Code,FALSE,$lg);
                $query_check = $this->Maccessories->get_element($x['name']); 
                if($query_check->num_rows()==1)
                {
                    $this->_data['path'][] = array(
                    'name' => __("CF_accessories"),
                    'link' => site_url('admin/get_element/About/'.$this->_data['lang'])
                    );
                    $this->_data['path'][] = array(
                    'name' => $x['name'],
                    'link' => '#'
                    );            
                    $query_all = $this->Maccessories->get_all_element();
                    $this->_data['query_all'] = $query_all->result_array();
                    $this->_data['page_title'] = $x['name'];
                    $this->_data['elementContent'] = $x['body'];
                    $this->_data['ID'] = $x['ID'];
                    $this->_data['Code'] = $x['code'];
                    $this->_data['Lang_temp'] = $x['Lang'];
                    $type_source = $this->uri->segment(3);
                    $this->_data['type_source'] = $type_source;
                    $this->_load_view('admin/add_new_page');
                }else
                {
                    redirect('admin/index');
                }
            }
        }    
        function update_element($Code='',$lg='')
        {
            is_admin();
            $x=out_static_page_no_lg($Code,FALSE,$lg);
            $this->form_validation->set_rules('ElementContent',__("CF_element_content"),'required');
            $this->form_validation->set_rules('Elementname',__("CF_element_name"),'required|trim');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');                                         
            $ElementContent=$this->input->post('ElementContent');
            $ElementName=$this->input->post('Elementname');
            $ID=$this->input->post('ID');
            $this->_data['page_title'] = $ElementName;
            if($this->form_validation->run()==FALSE)
            { 
                $this->get_element($Code,$lg);
            }
            else
            {
                if($this->Maccessories->update_element($ElementName,$ElementContent,$ID)==TRUE)
                {
                    $this->_message('admin', __("CF_update").' '.$ElementName.' '. __("CF_success"), 'success', site_url('admin/get_element/About/'.$this->_data['lang']));
                }
            }        
        }

        function keyword_check($Keywords)
        {
            $Key = explode(" ", $Keywords);					
            if(count($Key)>4)
            {
                $this->form_validation->set_message('keyword_check', __("CF_the").'%s'.__("CF_field_max")); 
                return FALSE ;           
            }
            else
            {
                return TRUE ;
            }
        }		
    }


?>
