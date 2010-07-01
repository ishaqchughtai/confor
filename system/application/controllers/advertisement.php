<?php

class Advertisement extends Admin_controller {
  //var $blog_sidebar = 'most_post';
  function Advertisement()
  {
    parent::Admin_controller();
    //$this->_container = 'container';		
    $this->load->model('MAdvertisement');		
    $this->load->helper('date');		
    $this->load->model('MSpeaker');
    $this->load->model('Remember_me');		
  }	

  function _before_render() 
  {
    $header['page'] = "admin/header";
    $side_bar['page'] = "adv/sidebar";
    $this->_data['header'] = $header;
    $this->_data['side_bar'] = $side_bar;		
  }		

  //list advertisement
  function advertisement_list()
  {
    $this->_data['path'][] = array(
      'name' => __("CF_adv_list"),
      'link' => '#'
      );
    is_admin();      
    $this->_data['path'][] = array(
    'name' => __("CON_adv_list"),
    'link' => site_url("advertisement/advertisement_list")
    );				
    $config['base_url'] = base_url().'index.php/advertisement/advertisement_list/';
    $config['total_rows'] = $this->db->count_all('tbladvertisement');
    $config['per_page']='5';

    $config['full_tag_open'] = '<li>';        
    $config['full_tag_close'] = '</li>'; 
    $config['next_link'] = 'Next >';
    $config['prev_link'] = '< Previous';
    $config['last_link'] = 'Last >>';
    $config['first_link'] = '<< First';

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
    if($this->input->post('btnsubmit'))
    {
      $this->form_validation->set_rules('advertiser_name','Advertiser Name','trim|required|max_length[50]');
      $this->form_validation->set_rules('advertiser_email','Advertiser Email','valid_email|callback_check_email');
      $this->form_validation->set_rules('url','URL','prep_url|required');
      $this->form_validation->set_rules('text_tips','Text Tips','trim|required|max_length[50]');
      $this->form_validation->set_rules('image_link','Image Link','trim|required');
      $this->form_validation->set_error_delimiters('<p class="not_error long"><span class="img"></span>','<span class="close"></span></p>');
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
        $imageLink = $this->input->post('image_link'); 
        if($this->MAdvertisement->add_advertisement($dateBeginning,$dateExpiry,$advertiserName,$advertiserEmail,$url,$textTips,$imageLink)==TRUE)
        {
          redirect('advertisement/advertisement_list');
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
      'name' => __("CF_edit_adv"),
      'link' => '#'
      );
    is_admin();
    $this->_data['query'] = $this->MAdvertisement->get_data_to_form($id);
    $this->_load_view('admin/edit_advertisement');
  }	

  function edit($id)
  {   
    if($this->input->post('btnedit'))
    {
      $this->form_validation->set_rules('advertiser_name','Advertiser Name','trim|required|max_length[50]');
      $this->form_validation->set_rules('advertiser_email','Advertiser Email','valid_email');
      $this->form_validation->set_rules('url','URL','valid_url');
      $this->form_validation->set_rules('text_tips','Text Tips','trim|required|max_length[50]');
      $this->form_validation->set_rules('image_link','Image Link','trim|required');
      $this->form_validation->set_error_delimiters('<p class="not_error long"><span class="img"></span>','<span class="close"></span></p>');
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
        $imageLink = $this->input->post('image_link');
        $data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$imageLink);
        redirect('advertisement/advertisement_list');          
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
    if($this->input->post('btndelete'))
    {
      $this->MAdvertisement->delete_advertisement($id);
      redirect('advertisement/advertisement_list');    
    }
  }	

  //upload image
  function do_upload()
  {
    is_admin();      
    $config['upload_path'] = './assets/uploads/adv/';
    $config['allowed_types'] = 'jpg';
    $config['max_size']    = '100';
    $config['max_width']  = '1024';
    $config['max_height']  = '768';
    $config['overwrite']  = 'TRUE';
    $this->load->library('upload', $config);

    if ( ! $this->upload->do_upload())
    {
      $error = array('error' => $this->upload->display_errors());
      $this->load->view('admin/upload_form_advertisement', $error);
    }    
    else
    {
      $data = array('upload_data' => $this->upload->data());
      $data['Link_full'] = $this->upload->file_name;
      $this->load->view('admin/upload_advertisement', $data);
    }
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




}