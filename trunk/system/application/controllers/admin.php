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
            $this->load->library('vid_lib');
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
                $config['full_tag_open'] = '<li >';        
                $config['full_tag_close'] = '</li>'; 
                $config['next_link'] = 'Next >';
                $config['prev_link'] = '< Previous';
                $config['last_link'] = 'Last >>';
                $config['first_link'] = '<< First';

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
        function modify_user($id)
        {
            if($this->session->userdata('admin')==FALSE)
            {                                                
                redirect(site_url("admin"));
            }
            else
            {		
                $this->_data['path'][] = array(
                'name' => __("CF_user_edit"),
                'link' => '#'
                );				
                $this->_data['error'] = ""; 
                $this->form_validation->set_rules('txtName',strtolower(__("CF_name")),'required');
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
                        $suspension=0;
                        if((int)$this->input->post('radiobutton')=='1')
                        {
                            $suspension=1;
                        }
                        $data = array(
                        'name'=>$this->input->post('txtName'),
                        'company_name'=>$this->input->post('txtCompanyName'),
                        'email' =>$this->input->post('txtEmail'),
                        'country' =>$this->input->post('country'),   
                        'description' =>$this->input->post('txtDescription'),
                        'status' =>$suspension
                        );
                        $this->Madmin->update_user($id,$data);
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
            $config['full_tag_open'] = '<li >';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = 'Next >';
            $config['prev_link'] = '< Previous';
            $config['last_link'] = 'Last >>';
            $config['first_link'] = '<< First';

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

        /*Video Conference*/
        function list_video_conference()
        {
            is_admin();            
            $this->_data['path'][] = array(
            'name' => __("CF_list_vid"),
            'link' => site_url("admin/list_video_conference")
            );   

            $category = $this->uri->segment(3);
            //$num_per_page = $this->uri->segment(4);
            $page_offset = $this->uri->segment(4);           

            if (!$category)
            {
                $category = 0;				
            }

            $config['base_url'] = base_url().'index.php/admin/list_video_conference/'.$category.'/';
            $config['full_tag_open'] = '<li>';        
            $config['full_tag_close'] = '</li>'; 
            $config['next_link'] = 'Next >';
            $config['prev_link'] = '< Previous';
            $config['last_link'] = 'Last >>';
            $config['first_link'] = '<< First';	
            $config['uri_segment'] = 4;
            $config['per_page']=$this->vid_per_page;
            // $config['cur_tag_open'] = '<li class="selected">';
            // $config['cur_tag_close'] = '</li>'; 

            if($category == 0)
            {
                $config['total_rows'] = $this->db->count_all('videos'); 
                $this->_data['query'] = $this->Mvconference->get_all_video_conference($this->vid_per_page,$page_offset,0);                  
            }
            else
            {
                $config['total_rows'] = $this->Mvconference->count_video_Category($category);
                $this->_data['query'] = $this->Mvconference->get_video_conference_by_category($category,$this->vid_per_page,$page_offset,0);
            } 
            $this->pagination->initialize($config);
            //$this->_data['video_categories'] = $this->Mvconference->get_category();
            $this->_data['pagination'] = $this->pagination->create_links();
            $this->_data['video_cate'] = $category;
            $this->_load_view('admin/video_conference_list'); 

        }

        function do_upload_ajax()
        {
            $this->vid_lib->init_uploader();
            $this->vid_lib->do_upload_ajax_admin();	
        }

        function new_video_conference()
        {
            $this->_data['path'][] = array(
            'name' => __("CF_admin_new_vid"),
            'link' => '#'
            );
            is_admin();
            $this->vid_lib->init_uploader();

            $this->form_validation->set_rules('speaker_email',strtolower(__("CF_one_speaker")),'required');
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
            $this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 
            $this->form_validation->set_rules('video_cate',strtolower(__("CF_cate_vid")),'required');
            $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
            $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
            $this->_data['query']=$this->Mvconference->get_category();

            if($this->input->post('submit'))
            {				
                $this->_data['vname'] = $this->input->post('vname');
                $this->_data['video_cate'] = $this->input->post('video_cate');
                $this->_data['speaker_id'] = $this->input->post('speaker');

                if($this->form_validation->run()==FALSE)
                {
                    $this->_data['error'] = __("CF_cant_update");							
                    $this->_load_view('admin/new_video_conference'); 			
                }
                else
                {
                    $vname = $this->input->post('vname');		
                    if (strlen($vname) <= 1)
                    {
                        $this->_data['error'] = __("CF_havent_upload");
                        $this->_load_view('admin/new_video_conference'); 			
                        return;
                    }				
                    $dateupload= NOW();
                    $data = array(
                    'mem_id'=>$this->input->post('speaker'),
                    'title'=>$this->input->post('title'),
                    'description'=>$this->input->post('description'),
                    'category'=>$this->input->post('video_cate'),
                    'tags'=>$this->input->post('keywords'),
                    'Date'=>$dateupload,
                    'vhash'=>$vname.'.flv',
                    'shash'=>$vname.'.jpg',
                    'approved'=>'1',
                    'viewed'=>0
                    );
                    $this->Mvconference->add_new_video($data);
                    //$this->list_video_conference();	
                    $this->_message('admin', __("CF_upload_success"), 'success',site_url("admin/list_video_conference"));
                }
            }
            else
            {	
                $this->_load_view('admin/new_video_conference');
            }						           
        }


        function edit_video_conference($id)
        {
            $this->_data['path'][] = array(
            'name' => __("CF_edit_video_admin"),
            'link' => '#'
            );
            is_admin();
            if(is_nan((float)$id)) redirect(site_url("admin"));
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'required');
            $this->form_validation->set_rules('keywords',strtolower(__("CF_key")),'trim|required|callback_keyword_check');
            $this->form_validation->set_rules('description',strtolower(__("CF_des")),'required'); 
            $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
			$this->_data['query']=$this->Mvconference->get_video_info_by_id($id);
            //$this->_data['category']=$this->Mvconference->get_category();
            $this->_data['error'] ="";

            if($this->input->post('submit')){
                //$this->_data['video_cate'] = $this->input->post('video_cate');

                if($this->form_validation->run()==FALSE)
                {				
                    $this->_load_view('admin/edit_video_conference');
                }
                else
                {												
                    $data = array(
                    'title'=>$this->input->post('title'),
					'mem_id'=>$this->input->post('speaker'),
                    'description'=>$this->input->post('description'),
                    'category'=>$this->input->post('video_cate'),
                    'tags'=>$this->input->post('keywords'),					
                    'approved'=>$this->input->post('approved')
                    );
                    $this->Mvconference->update_conference($data,$id);									
                    $this->_message('admin', __("CF_save_info"), 'success',site_url("admin/list_video_conference"));
                }
            }
            else
            {
                $this->_load_view('admin/edit_video_conference');
            }		 
        }
        function delete_video_conference($id){
            is_admin();		
            $delete_data = $this->Mvconference->delete_video($id);
            if ($delete_data)
            {
                $this->vid_lib->delete_old_data($delete_data['vhash'],$delete_data['shash']);			
                $this->_message('admin', __("CF_delete_vid"), 'success',site_url("admin/list_video_conference"));			
            }
            else
            {
                $this->_message('admin', __("CF_error_occurred"), 'error', site_url("admin/list_video_conference"));			
            }
            //redirect('admin/list_video_conference');
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
                redirect('admin/list_category');
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
                        redirect('admin/list_category');  
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
                    redirect('admin/list_category');
                }
            }
            else
            {
                $this->_load_view('admin/add_new_category');
            }
        }

        //Accessories

        function show_element($ElementName)
        {   
            $admin_data = is_admin(FALSE);
            $query = $this->Maccessories->get_element($ElementName); 
            if($query->num_rows()==1)
            {
                if ($admin_data == FALSE) 
                {
                    $this->login();              
                }else
                {
                    $this->_data['page_title'] = $this->convert_element_name($ElementName);
                    $this->_data['query'] = $query->result_array();
                    $this->_load_view('admin/page_admin');    
                }
            }else
            {
                redirect('admin/index');
            }      
        }
        function get_element($ElementName)
        {
            is_admin();
            $StrElementName = $this->convert_element_name($ElementName);
            $this->_data['path'][] = array(
            'name' => __("CF_accessories"),
            'link' => site_url('admin/show_element/about')
            );                                
            $query = $this->Maccessories->get_element($ElementName);
            $this->_data['query'] = $query->result_array();
            $this->_data['page_title'] = $this->convert_element_name($ElementName);
            $this->_load_view('admin/add_new_page');
        }    
        function update_element($ElementName)
        {
            is_admin();
            $StrElementName = $this->convert_element_name($ElementName);
            $this->_data['path'][] = array(
            'name' => __("CF_accessories"),
            'link' => site_url('admin/show_element/about')
            );
            $this->form_validation->set_rules('ElementContent',__("CF_element_content"),'required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            $query = $this->Maccessories->get_element($ElementName);
            $this->_data['query'] = $query->result_array();                                          
            $ElementContent=$this->input->post('ElementContent');
            $this->_data['page_title'] = $this->convert_element_name($ElementName);
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('admin/add_new_page'); 
            }
            else
            {
                if($this->Maccessories->update_element($ElementName,$ElementContent)==TRUE)
                {
                    redirect(site_url('admin/show_element/'.$ElementName));  
                }
            }        
        }
    function convert_element_name($ElementName)
    {
      if($ElementName == 'about')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_about_us"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'About us';
      }elseif($ElementName == 'how')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_how"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'How it works';    
      }elseif($ElementName == 'rules')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_rules"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'The rules';
      }elseif($ElementName == 'how_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_about_us"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'About us';
      }elseif($ElementName == 'how_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_how"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'How it works';    
      }elseif($ElementName == 'rules_fr')
      {
        $this->_data['path'][] = array(
        'name' => __("CF_rules"),
        'link' => site_url("accessories/show_element/".$ElementName)
        );
        $StrElementName = 'The rules';       
      }else
      {
        $StrElementName = '';
      }
      return $StrElementName;    
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
