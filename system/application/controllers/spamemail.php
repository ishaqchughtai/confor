<?php
class Spamemail extends Admin_controller {
    function Spamemail()
    {
        parent::Admin_controller();
        $this->_container = 'container';        
        $this->load->model('Mspamemail');        
        $this->load->helper('date');
        $this->load->helper('string');       
        $this->_data['path'][] = array(
        'name' => __("CF_spamemail"),
        'link' => site_url("/spamemail")
        );        
    }
    function index()
    {
        is_admin();
        $this->_data['path'][] = array(
        'name' => __("CF_spamemail_list"),
        'link' => '#'
        ); 

        $config['base_url'] = base_url().'index.php/spamemail/index/';
        $config['total_rows'] = $this->Mspamemail->count_record_email();
        $config['per_page']=1;

        $config += config_pagination_style();
        $config['uri_segment'] = 3;

        $this->pagination->initialize($config);
        $this->_data['query'] = $this->Mspamemail->show_spam_email($this->uri->segment(3),$config['per_page']);
        $this->_data['pagination'] = $this->pagination->create_links();                            
        $this->_load_view('spamemail/spam_email_view');     
    }
    function add_spam_email()
    {
        is_admin();
        $this->_data['path'][] = array(
        'name' => __("CF_spamemail_add"),
        'link' => '#'
        );
        if($this->input->post('btnsubmit'))
        { 

            $this->form_validation->set_rules('spampemail',__("CF_spamemail"),'trim|required|valid_email');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');

            $Email=$this->input->post('spampemail');
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('spamemail/add_spam_email');        
            }
            else
            {                              
                if($this->Mspamemail->add_spam_email($Email)==TRUE)
                { 
                    $this->_message('spamemail', __("CF_addspamemail_success"), 'success', site_url("spamemail/index"));
                }
            }
        }else
        {
            $this->_load_view('spamemail/add_spam_email');
        }
    }
    function delete_spam_email($id)
    {
        is_admin();
        $data = $this->Mspamemail->del_spam_email($id);
        redirect("spamemail/index");
    }
}

