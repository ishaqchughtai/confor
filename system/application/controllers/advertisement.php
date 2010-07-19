<?php

class Advertisement extends Admin_controller {
  function Advertisement()
  {
    parent::Admin_controller();	
    $this->load->model('MAdvertisement');		
    $this->load->helper('date');		
    $this->load->model('Mshopproduct','mshopproduct');
    $this->load->library('image_upload_lib'); 
    $this->image_upload_lib->ajax_link = site_url('advertisement/do_upload_ajax');
    $this->image_upload_lib->is_resize = FALSE;	
  }	

  //function _before_render() 
  //  {
  //    $header['page'] = "admin/header";
  //    $this->_data['header'] = $header;
  //  }		


  function do_upload_ajax()
  {
    if (! is_admin(FALSE)) 
    {
      echo '0';
      return;
    }    
    $this->image_upload_lib->init();
    $this->image_upload_lib->do_upload_ajax();
  }

  //function do_upload()
  //        {
  //            if($this->session->userdata('admin')==FALSE)
  //            {
  //                redirect(site_url("admin"));
  //            }
  //            else
  //            {
  //                $config['upload_path'] = './assets/uploads/image/';
  //                $config['allowed_types'] = 'jpg';
  //                $config['max_size']    = '300';
  //                $config['max_width']  = '1024';
  //                $config['max_height']  = '768';
  //                $config['overwrite']  = 'TRUE';
  //                $this->load->library('upload', $config);

  //                if ( ! $this->upload->do_upload())
  //                {
  //                    $error = array('error' => $this->upload->display_errors());
  //                    $this->load->view('admin/upload_form_showroom', $error);
  //                }    
  //                else
  //                {
  //                    $data = array('upload_data' => $this->upload->data());
  //                    $data['Link_full'] = $this->upload->file_name;
  //                    $this->load->view('admin/upload_success_showroom', $data);
  //                }
  //            }  
  //        }


  //list advertisement
  function advertisement_list()
  {
    $this->_data['path'][] = array(
    'name' => __("CF_adv_list"),
    'link' => '#'
    );
    is_admin();      				
    $config['base_url'] = base_url().'index.php/advertisement/advertisement_list/';
    $config['total_rows'] = $this->db->count_all('tbladvertisement');
    $config['per_page']='5';

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = __("CF_next");
    $config['prev_link'] = __("CF_previous");
    $config['last_link'] = __("CF_last");
    $config['first_link'] = __("CF_first");
    $this->pagination->initialize($config);
    $this->_data['query'] = $this->MAdvertisement->get_advertisement($config['per_page'], $this->uri->segment(3));
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('admin/advertisement_view_admin');          
  }

  function add()
  {
    $this->_data['path'][] = array(
    'name' => __("CF_new_adv"),
    'link' => '#'
    );
    is_admin();
    $this->image_upload_lib->init();  
    if($this->input->post('btnsubmit'))
    {
      $this->form_validation->set_rules('date_expiry',strtolower(__("CF_adv_date_ex")),'trim|required|callback_check_date_expiry');
      $this->form_validation->set_rules('advertiser_name',strtolower(__("CF_advertiser_name")),'trim|required|max_length[50]');
      $this->form_validation->set_rules('advertiser_email',strtolower(__("CF_advertiser_email")),'required|valid_email|callback_check_email');
      $this->form_validation->set_rules('url',strtolower(__("CF_url")),'prep_url|required');
      $this->form_validation->set_rules('text_tips',strtolower(__("CF_text_tips")),'trim|required|max_length[50]');
      $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
      if($this->form_validation->run()==FALSE)
      {
        $this->_load_view('admin/add_advertisement');
      }
      else
      {   
        $dateBeginning = date('Y-m-d');
        $dateExpiry = $this->input->post('date_expiry');                                          
        $advertiserName = $this->input->post('advertiser_name');
        $advertiserEmail = $this->input->post('advertiser_email');
        $url = $this->input->post('url');
        $textTips = $this->input->post('text_tips'); 
        $this->_data['uname'] = $this->input->post('uname');
        if($this->MAdvertisement->add_advertisement($dateBeginning,$dateExpiry,$advertiserName,$advertiserEmail,$url,$textTips,$this->_data['uname'])==TRUE)
        {
          $this->_message('advertisement', __("CF_add_image_suc"), 'success',site_url("advertisement/add"));
        }
      }  
    } 
    else
    {
      $this->_load_view('admin/add_advertisement');
    }

  }

  function get_advertisement($id)
  {

    $this->_data['path'][] = array(
    'name' => __("CF_adv_list"),
    'link' => site_url('advertisement/advertisement_list')
    );

    $this->_data['path'][] = array(
    'name' => __("CF_edit_adv"),
    'link' => '#'
    );
    is_admin();
    $this->image_upload_lib->init();
    $this->_data['query'] = $this->MAdvertisement->get_data_to_form($id);
    $this->_load_view('admin/edit_advertisement');
  }	

  function edit($id)
  {
    is_admin();
    $this->image_upload_lib->init();   
    if($this->input->post('btnedit'))
    {
      $this->form_validation->set_rules('date_expiry',strtolower(__("CF_adv_date_ex")),'trim|required|callback_check_date_expiry');
      $this->form_validation->set_rules('advertiser_name',strtolower(__("CF_advertiser_name")),'trim|required|max_length[50]');
      $this->form_validation->set_rules('advertiser_email',strtolower(__("CF_advertiser_email")),'required|valid_email|callback_check_email');
      $this->form_validation->set_rules('url',strtolower(__("CF_url")),'prep_url|required');
      $this->form_validation->set_rules('text_tips',strtolower(__("CF_text_tips")),'trim|required|max_length[50]');
      $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
      if($this->form_validation->run()==FALSE)
      {
        $this->get_advertisement($id);
      }
      else
      {

        $dateExpiry = $this->input->post('date_expiry');
        $advertiserEmail = $this->input->post('advertiser_email');
        $url = $this->input->post('url');
        $textTips = $this->input->post('text_tips'); 
        $imageLink = $this->input->post('edit_image');
        //echo $imageLink;
//        return;
        $this->_data['uname'] = $this->input->post('uname');
        //$data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$this->_data['uname']);
//        redirect('advertisement/advertisement_list');

        if (strlen($this->_data['uname'])>1)
        {
          $this->image_upload_lib->remove_image_from_db($id,'ID','ImageLink','tbladvertisement'); 
          $data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$this->_data['uname']);
          $this->_message('advertisement', __("CF_adv_suc"), 'success', site_url("advertisement/advertisement_list/"));
        }
        else
        {
          $data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$imageLink);
          $this->_message('advertisement', __("CF_adv_suc"), 'success', site_url("advertisement/advertisement_list/"));
        }          
      }   
    }
    else
    {
      $this->get_advertisement($id);
    }
  }	

  //delete advertisement
  function delete($id)
  {
    is_admin();
    $this->MAdvertisement->delete_advertisement($id);
    redirect('advertisement/advertisement_list');    

  }	

  //Search advertisement
  function search_advertisement()
  {
    $this->_data['path'][] = array(
    'name' => __("CF_search_adv"),
    'link' => '#'
    );
    $keywords = $this->input->post('search_field');

    $keywords = $this->uri->segment(3);
    $per_page = $this->uri->segment(4);
    $offset = $this->uri->segment(5);

    $config['uri_segment'] = 5;
    $config['base_url'] = base_url().'index.php/advertisement/search_advertisement/'.$keywords.'/'.$per_page;

    $config['total_rows'] = $this->MAdvertisement->count_record($keywords);
    $config['per_page']=$per_page;
    $config['full_tag_open'] = "<li>";        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';
    $this->_data['adv'] = $this->MAdvertisement->search($keywords,$per_page,$offset); 
    $this->pagination->initialize($config);
    $this->_data['pagination'] = $this->pagination->create_links();
    $this->_load_view('admin/search_advertisement');
  }
  
  function check_date_expiry($dateExpiry) 
  {
    //echo date('Y-m-d'); 
     if($dateExpiry < date('Y/m/d'))
     {
         $this->form_validation->set_message('check_date_expiry', 'Expiration date must be greater than or equal to the current day');
         return FALSE;
     }
     else 
     {
         return TRUE;
     }
  }


}