<?php

class Advertisement_text extends Admin_controller {
    function Advertisement_text()
    {
        parent::Admin_controller();    
        $this->load->model('MAdvertisement_text');        
        $this->load->helper('date');        
        $this->load->model('Mshopproduct','mshopproduct'); 
    }         

    //list advertisement
    function advertisement_list()
    {
        $this->_data['path'][] = array(
        'name' => __("CF_adv_list"),
        'link' => '#'
        );
        is_admin();                      
        $config['base_url'] = base_url().'index.php/advertisement_text/advertisement_list/';
        $config['total_rows'] = $this->db->count_all('tbladvertisement_text');
        $config['per_page']='5';

        $config += config_pagination_style();
        $this->pagination->initialize($config);
        $this->_data['query'] = $this->MAdvertisement_text->get_advertisement($config['per_page'], $this->uri->segment(3));
        $this->_data['pagination'] = $this->pagination->create_links();
        $this->_load_view('admin/advertisement_text_view_admin');          
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
            $this->form_validation->set_rules('date_expiry',strtolower(__("CF_adv_date_ex")),'trim|required|callback_check_date_expiry');
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
            $this->form_validation->set_rules('advertiser_email',strtolower(__("CF_advertiser_email")),'required|valid_email|callback_check_email');
            $this->form_validation->set_rules('url',strtolower(__("CF_url")),'prep_url|required');
            $this->form_validation->set_rules('body',strtolower(__("CF_blog_body")),'trim|required|max_length[200]');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('admin/add_advertisement_text');
            }
            else
            {   
                $dateBeginning = date('Y-m-d');
                $dateExpiry = $this->input->post('date_expiry');                                          
                $title = $this->input->post('title');
                $advertiserEmail = $this->input->post('advertiser_email');
                $url = $this->input->post('url');
                $body = $this->input->post('body');
                $viewed = 0; 
                if($this->MAdvertisement_text->add_advertisement($dateBeginning,$dateExpiry,$title,$advertiserEmail,$url,$body,$viewed)==TRUE)
                {
                    $this->_message('advertisement_text', __("CF_add_adv_suc"), 'success',site_url("advertisement_text/advertisement_list/"));
                }
            }  
        } 
        else
        {
            $this->_load_view('admin/add_advertisement_text');
        }

    }

    function get_advertisement($id)
    {

        $this->_data['path'][] = array(
        'name' => __("CF_adv_list"),
        'link' => site_url('advertisement_text/advertisement_list')
        );

        $this->_data['path'][] = array(
        'name' => __("CF_edit_adv"),
        'link' => '#'
        );
        is_admin();
        $this->_data['query'] = $this->MAdvertisement_text->get_data_to_form($id);
        $this->_load_view('admin/edit_advertisement_text');
    }
    function get_adv($id)
    {

        $this->_data['path'][] = array(
        'name' => __("CF_adv_list"),
        'link' => site_url('advertisement_text/advertisement_list')
        );

        $this->_data['path'][] = array(
        'name' => __("CF_avd_details"),
        'link' => '#'
        );
        is_admin();       
        $this->_data['query'] = $this->MAdvertisement_text->get_data_to_form($id);
        $this->_load_view('admin/view_advertisement_text');
    }    

    function edit($id)
    {
        is_admin(); 
        if($this->input->post('btnedit'))
        {
            $this->form_validation->set_rules('date_expiry',strtolower(__("CF_adv_date_ex")),'trim|required|callback_check_date_expiry');
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
            $this->form_validation->set_rules('advertiser_email',strtolower(__("CF_advertiser_email")),'required|valid_email|callback_check_email');
            $this->form_validation->set_rules('url',strtolower(__("CF_url")),'prep_url|required');
            $this->form_validation->set_rules('body',strtolower(__("CF_blog_body")),'trim|required|max_length[50]');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->get_advertisement($id);
            }
            else
            {
                $dateExpiry = $this->input->post('date_expiry');                                          
                $title = $this->input->post('title');               
                $url = $this->input->post('url');
                $body = $this->input->post('body');               
                $data = $this->MAdvertisement_text->edit_advertisement($id,$dateExpiry,$title,$url,$body);
                $this->_message('advertisement_text', __("CF_adv_suc"), 'success', site_url("advertisement_text/advertisement_list/")); 
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
        $this->MAdvertisement_text->delete_advertisement($id);
        redirect('advertisement_text/advertisement_list');    

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
        $query = $this->MAdvertisement_text->get_advertisement_by_id($id);   
        if($query->num_rows()>0)
        {
            $row=$query->row();
            $url = $row->URL;
            $last_viewed = $row->Viewed;
            $viewed=$last_viewed+1;
            $this->MAdvertisement_text->update_view_time($id,$viewed);
        }
        redirect($url);
    }
}


