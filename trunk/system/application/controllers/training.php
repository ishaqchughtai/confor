<?php
class Training extends Admin_controller {
    function Training()
    {
        parent::Admin_controller();
        $this->_container = 'container';        
        $this->load->model('Mtraining');        
        $this->load->helper('date');
        $this->load->helper('string');        
    }

    function index()
    {
        $this->show();
    }

    function show()
    {
        is_admin();
        //$lg = $this->uri->segment(3);
        $lg=$this->_data['lang'];    
        if (! $lg) return;
        if (lang_name_by_short_key($lg,TRUE)==FALSE)
        {
            $this->_message('training', 'Invaild language', 'error',site_url("training/index").'/'.$this->_data['lang']);
        }   

        $this->_data['path'][] = array(
        'name' => __("CF_training"),
        'link' => '#'
        ); 

        $this->_data['lg'] = $lg;
        $config['base_url'] = base_url().'index.php/training/index/'.$lg;
        $config['total_rows'] = $this->Mtraining->count_record($lg);
        $config['per_page']=5;

        $config['full_tag_open'] = '<li>';    
        $config['full_tag_close'] = '</li>';
        $config['next_link'] = __("CF_next");
        $config['prev_link'] = __("CF_previous");
        $config['last_link'] = __("CF_last");
        $config['first_link'] = __("CF_first");
        $config['uri_segment'] = 4;

        $this->pagination->initialize($config);
        $this->_data['query'] = $this->Mtraining->get_all_training($lg,$this->uri->segment(4),$config['per_page']);
        $this->_data['pagination'] = $this->pagination->create_links();                               
        $this->_load_view('admin/training_admin');       
    }
    //Delete Training
    function delete_article($id)
    {
        if($this->session->userdata('admin')==FALSE)
        {
            redirect(site_url("admin"));
        }
        else
        {
            //$id = $this->uri->segment(3);
            if($this->Mtraining->del_article($id) == TRUE)
            {
                $this->_message('training', __("CF_delete_ar"), 'success', site_url("training/index/".$this->_data['lang']));
            }
        }
    }

    //Add Article
    function add_article()
    {
        is_admin();
        $lg = $this->_data['lang'];
        $this->_data['path'][] = array(
        'name' => __("CF_training"),
        'link' => site_url('training/index').'/'.$this->_data['lang']
        );
        $lg = $this->_data['lang'];
        $this->_data['path'][] = array(
        'name' => __("CF_add_new_article"),
        'link' => '#'
        );
        $this->_data['lg'] = $lg;
        if($this->input->post('btnsubmit'))
        {
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
            $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->_load_view('admin/add_training');
            }
            else
            {    
                $date = date('Y-m-d');
                $title = $this->input->post('title');
                $content = $this->input->post('content');
                $lg = $this->input->post('lg');
                if($this->Mtraining->add_training($date,$title,$content,$lg)==TRUE)
                {
                    $this->_message('training', __("CF_editarticle_success"), 'success', site_url("training/index").'/'.$lg);
                }
            }
        }else
        {
            $this->_load_view('admin/add_training');    
        }  
    }

    function edit_article($id='')
    {   
        is_admin();
            $this->form_validation->set_rules('title',strtolower(__("CF_title")),'trim|required|max_length[50]');
            $this->form_validation->set_rules('content',strtolower(__("CF_content")),'trim|required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->form_validation->run()==FALSE)
            {
                $this->get_training_admin($id);
            }
            else
            {
                $title = $this->input->post('title');
                $content = $this->input->post('content');
                $lg = $this->input->post('lg');
                $data = $this->Mtraining->edit_training($id,$title,$content,$lg);
                $this->_message('training', __("CF_editarticle_success"), 'success', site_url("training/index/".$this->_data['lang']));
            }   
    }
        //get training admin
    function get_training_admin($id='')
    { 
      is_admin();
      $query = $this->Mtraining->get_data_to_form($id);   
      foreach($query as $row)    
      {
        $lg = $row->Lang;
      }
      $this->_data['path'][] = array(
      'name' => __("CF_list_ar"),
      'link' => site_url('training/index').'/'.$this->_data['lang']
      ); 

      $this->_data['path'][] = array(
      'name' => __("CF_edit_ar"),
      'link' => '#'
      );      
      $this->_data['query'] = $this->Mtraining->get_data_to_form($id);
      $this->_load_view('admin/edit_training');    
    }
}

