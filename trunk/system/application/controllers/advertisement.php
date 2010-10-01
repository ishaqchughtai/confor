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

        $config += config_pagination_style();
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
                $viewed = 0; 
                $this->_data['uname'] = $this->input->post('uname');
                $target = $this->input->post('target');
                $idcombo = $this->input->post('position');
                if($this->MAdvertisement->add_advertisement($dateBeginning,$dateExpiry,$advertiserName,$advertiserEmail,$url,$textTips,$this->_data['uname'],$viewed,$target)==TRUE)
                {
                    $id = $this->db->insert_id();
                    if($idcombo != 0)
                    {
                        $this->MAdvertisement->update_position_adv($idcombo,$id);          
                    }
                    $this->_message('advertisement', __("CF_add_adv_suc"), 'success',site_url("advertisement/advertisement_list/"));
                }



                //update 'advposiit'.$idcombo.' value'

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
        $this->_data['get_adv_pos'] = $this->MAdvertisement->get_adv_position($id);
        $this->_load_view('admin/edit_advertisement');
    }
    function get_adv($id)
    {

        $this->_data['path'][] = array(
        'name' => __("CF_adv_list"),
        'link' => site_url('advertisement/advertisement_list')
        );

        $this->_data['path'][] = array(
        'name' => __("CF_avd_details"),
        'link' => '#'
        );
        is_admin();
        $this->image_upload_lib->init();
        $this->_data['query'] = $this->MAdvertisement->get_data_to_form($id);
        $this->_data['get_adv_pos'] = $this->MAdvertisement->get_adv_position($id);
        $this->_load_view('admin/view_advertisement');
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
                $this->_data['uname'] = $this->input->post('uname');
                $target = $this->input->post('target');
                $idcombo = $this->input->post('position');
                if (strlen($this->_data['uname'])>1)
                {
                    $this->image_upload_lib->remove_image_from_db($id,'ID','ImageLink','tbladvertisement'); 
                    $data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$this->_data['uname'],$target);
                    if($idcombo != 0)
                    {
                        $this->MAdvertisement->update_position_adv($idcombo,$id);          
                    }
                    $this->_message('advertisement', __("CF_adv_suc"), 'success', site_url("advertisement/advertisement_list/"));
                }
                else
                {
                    $data = $this->MAdvertisement->edit_advertisement($id,$dateExpiry,$advertiserEmail,$url,$textTips,$imageLink,$target);
                    if($idcombo != 0)
                    {
                        $this->MAdvertisement->update_position_adv($idcombo,$id);          
                    }
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
        $config += config_pagination_style();
        $this->_data['adv'] = $this->MAdvertisement->search($keywords,$per_page,$offset); 
        $this->pagination->initialize($config);
        $this->_data['pagination'] = $this->pagination->create_links();
        $this->_load_view('admin/search_advertisement');
    }

    function check_date_expiry($dateExpiry) 
    { 
        if($dateExpiry < date('Y/m/d'))
        {
            $this->form_validation->set_message('check_date_expiry', __("CF_check_date_expiry"));
            return FALSE;
        }
        else 
        {
            return TRUE;
        }
    }

    function go_to($id = '')
    {
        $query = $this->MAdvertisement->get_advertisement_by_id($id);   
        if($query->num_rows()>0)
        {
            $row=$query->row();
            $url = $row->URL;
            $last_viewed = $row->Viewed;
            $viewed=$last_viewed+1;
            $this->MAdvertisement->update_view_time($id,$viewed);
        }
        redirect($url);
    }
}


