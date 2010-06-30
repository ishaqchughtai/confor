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
	
	function Admin(){
		parent::Admin_controller();
		$this->load->model('Madmin');
		$this->load->model('Mvconference'); 
		$this->load->library('validation'); 
		$this->load->helper('date');
		$this->load->library('vid_lib');
		$this->load->model('MShop');		
	}                       
	function index()
	{
		$this->_data['status'] = $this->MShop->get_shop_status();
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
			'name' => __("CON_admin_login"),
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
							$this->_data['error']  =  ' You have entered invalid password';  
							$this->_load_view('admin/admin_login');
						}
					}
				}
				else
				{
					$this->_data['error']  =  ' You have entered invalid email address ssssss';  
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
			'name' => __("CON_admin_list_all"),
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
			'name' => __("CON_admin_add"),
			'link' => site_url("admin/add_new_admin")
			);					
			$this->_data['error'] = ""; 
			$this->form_validation->set_rules('txtName','Name','required');
			$this->form_validation->set_rules('txtFirstName','First Name','required');
			$this->form_validation->set_rules('txtEmail','Email','required|valid_email|xss_clean');
			$this->form_validation->set_rules('txtpayPayAccount','Paypal Account','required|valid_email|xss_clean');
			$this->form_validation->set_rules('txtPassword','Password','required');
			$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
			if($this->input->post('submit'))
			{
				if($this->form_validation->run()==FALSE)
				{
					$data['error'] = "Insert new admin failed !";
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
						$this->_data['error']='Email or paypal account already exist! ';
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
				'name' => __("CON_admin_edit"),
				'link' => '#'
				);                    
				$data['error'] = ""; 
				$this->form_validation->set_rules('txtName','Name','required');
				$this->form_validation->set_rules('txtFirstName','First Name','required');
				$this->form_validation->set_rules('txtEmail','Email','required|valid_email|xss_clean');
				$this->form_validation->set_rules('txtpayPayAccount','Paypal Account','required|valid_email|xss_clean');
				$this->_data['query']=$this->Madmin->get_admin_by_id($id);
				$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
				if($this->input->post('Submit'))
				{
					if($this->form_validation->run()==FALSE)
					{
						$this->_data['error'] = "Can not update !";
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
		'name' => __("CON_admin_edit"),
		'link' => '#'
		);                    
		$data['error'] = ""; 
		$this->form_validation->set_rules('txtName','Name','required');
		$this->form_validation->set_rules('txtFirstName','First Name','required');
		$this->form_validation->set_rules('txtEmail','Email','required|valid_email|xss_clean');
		$this->form_validation->set_rules('txtpayPayAccount','Paypal Account','required|valid_email|xss_clean');
		$this->_data['query']=$this->Madmin->get_admin_by_id($id);
        $this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		if($this->input->post('Submit'))
		{
			if($this->form_validation->run()==FALSE)
			{
				$this->_data['error'] = "Can not update !";
				$this->_load_view('admin/update_admin');
			}
			else
			{
				$data = array(
				'Name'=>$this->input->post('txtName'),
				'FirstName'=>$this->input->post('txtFirstName'),
				'Email'=>$this->input->post('txtEmail'),
                'country'=>$this->input->post('txtCountry'),
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
	function modify_user($id)
	{
		if($this->session->userdata('admin')==FALSE)
		{                                                
			redirect(site_url("admin"));
		}
		else
		{		
			$this->_data['path'][] = array(
			'name' => __("CON_user_edit"),
			'link' => '#'
			);				
			$this->_data['error'] = ""; 
			$this->form_validation->set_rules('txtName','Name','required');
			$this->form_validation->set_rules('txtCompanyName','Company Name','required');
			$this->form_validation->set_rules('txtEmail','Email','required|valid_email');
			$this->form_validation->set_rules('txtDescription','Description','trim|required');
			$this->_data['query']=$this->Madmin->get_user_id($id);
            $this->_data['country']=$this->Madmin->get_all_country();
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
					'country' =>$this->input->post('txtCountry'),   
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
                //unlink();
            }
			$this->Madmin->delete_user($id);
			redirect('admin/list_user');
		}    
	}
	/*Video Conference*/
	function list_video_conference()
	{
		is_admin();            
		$this->_data['path'][] = array(
		'name' => __("CON_video_list"),
		'link' => site_url("admin/list_video_conference")
		);   

		$category = $this->uri->segment(3);
		$num_per_page = $this->uri->segment(4);
		$page_offset = $this->uri->segment(5);           

		$config['base_url'] = base_url().'index.php/admin/list_video_conference/'.$category.'/'.$num_per_page.'/';
		$config['full_tag_open'] = '<li>';        
		$config['full_tag_close'] = '</li>'; 
		$config['next_link'] = 'Next >';
		$config['prev_link'] = '< Previous';
		$config['last_link'] = 'Last >>';
		$config['first_link'] = '<< First';	
		$config['uri_segment'] = 5;
		$config['per_page']='3';
		// $config['cur_tag_open'] = '<li class="selected">';
		// $config['cur_tag_close'] = '</li>'; 

		if($category == 0)
		{
			$config['total_rows'] = $this->db->count_all('videos'); 
			$this->_data['query'] = $this->Mvconference->get_all_video_conference($num_per_page,$page_offset);                  
		}
		else
		{
			$config['total_rows'] = $this->Mvconference->count_video_Category($category);
			$this->_data['query'] = $this->Mvconference->get_video_conference_by_category($category,$num_per_page,$page_offset);
		}   
		$this->pagination->initialize($config);  
		$this->_data['video_categories'] = $this->Mvconference->get_category();
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
		is_admin();
		$this->vid_lib->init_uploader();
		
		$this->form_validation->set_rules('speaker_email','Speaker','required');
		$this->form_validation->set_rules('title','Title','required');
		$this->form_validation->set_rules('description','Description','required'); 
		$this->form_validation->set_rules('video_cate','Category','required');
		$this->form_validation->set_rules('keywords','Keywords','required');
		$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
		$this->_data['query']=$this->Mvconference->get_category();
		
		if($this->input->post('submit'))
		{				
			$this->_data['vname'] = $this->input->post('vname');
			$this->_data['video_cate'] = $this->input->post('video_cate');
			$this->_data['speaker_id'] = $this->input->post('speaker');
						
			if($this->form_validation->run()==FALSE)
			{
				$this->_data['error'] = "Can not update !";							
				$this->_load_view('admin/new_video_conference'); 			
			}
			else
			{
				$vname = $this->input->post('vname');		
				if (strlen($vname) <= 1)
				{
					$this->_data['error'] = "You must upload your clip !";
					$this->_load_view('admin/new_video_conference'); 			
					return;
				}				
				$dateupload= NOW();
				$data = array(
					'mem_id'=>$this->input->post('speaker'),
					'title'=>$this->input->post('title'),
					'description'=>$this->input->post('description'),
					'category'=>$this->input->post('video_catte'),
					'tags'=>$this->input->post('keywords'),
					'Date'=>$dateupload,
					'vhash'=>$vname.'.flv',
					'shash'=>$vname.'.jpg',
					'approved'=>1,
					'viewed'=>0
				);
				$this->Mvconference->add_new_video($data);
				$this->list_video_conference();			
			}
		}
		else
		{	
			$this->_load_view('admin/new_video_conference');
		}						           
	}

	
	function edit_video_conference($id)
	{
		if($this->session->userdata('admin')==FALSE)
		{                                                
			redirect(site_url("admin"));
		}
		else
		{
			if(is_nan((float)$id)) redirect(site_url("admin"));
			$this->form_validation->set_rules('title','Title','required');
			$this->form_validation->set_rules('keywords','Keywords','required');
			$this->form_validation->set_rules('description','Description','required'); 
			$this->form_validation->set_error_delimiters('<p class="not_error"><span class="img"></span>','<span class="close"></span></p>');
			$this->_data['query']=$this->Mvconference->get_video_conference_by_id($id);
			$this->_data['category']=$this->Mvconference->get_category();
			$this->_data['error'] ="";
			if($this->input->post('submit')){
				if($this->form_validation->run()==FALSE)
				{
					//echo 'form failed';
					$this->_load_view('admin/edit_video_conference');
				}
				else
				{
					$config['upload_path'] = './videos/';
					$config['allowed_types'] = 'flv|gif|jpg|png';
					$config['max_size']    = '20480';
					$this->load->library('upload', $config);

					if ( ! $this->upload->do_upload())
					{
						$this->_data['error'] = $this->upload->display_errors();
						$this->_load_view('admin/edit_video_conference');
					}    
					else
					{
						$data_upload = $this->upload->data();
						$data = array(
						'title'=>$this->input->post('title'),
						'description'=>$this->input->post('description'),
						'category'=>$this->input->post('category'),
						'tags'=>$this->input->post('keywords'),
						'vhash'=>$data_upload['file_name'],
						'approved'=>$this->input->post('approved'),
						);
						if(!$data_upload)
						{
							return;
						}
						else
						{
							$this->Mvconference->update_conference($data,$id);
							redirect('admin/list_video_conference');
						}
					}
				}
			}
			else
			{
				$this->_load_view('admin/edit_video_conference');
			}
		}    
	}
    function delete_video_conference($id){
        if($this->session->userdata('admin')==FALSE)
        {                                                
            redirect(site_url("admin"));
        }
        else
        {
            $this->Mvconference->delete_video($id);
            redirect('admin/list_video_conference');
        }
    }
}
?>
