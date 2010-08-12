<?php
class Training extends Admin_controller {

  function Training()
  {
    parent::Admin_controller();
    $this->_container = 'container';        
    $this->load->model('Mtraining');        
    $this->load->helper('date');
    $this->load->helper('string');
    $this->load->library('image_upload_lib');
    $this->image_upload_lib->thumb_w =130; 
    $this->image_upload_lib->thumb_h =130;
    $this->image_upload_lib->ajax_link = site_url('training/do_upload_ajax');        
  }
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
  function index()
  {
    $this->show_order($lg);
  }

  function show()
  {
    is_admin();
    $lg = $this->uri->segment(3);
    //$lg=$this->_data['lang'];    
    if (! $lg) $lg=$this->_data['lang'];    
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
    $config['per_page']=3;

    $config += config_pagination_style();
    $config['uri_segment'] = 4;

    $this->pagination->initialize($config);     
    $this->_data['articles'] = $this->Mtraining->get_all_training($lg,$this->uri->segment(4),$config['per_page']);
    $this->_data['pagination'] = $this->pagination->create_links(); 
    $is_first_page = FALSE;
    $is_last_page = FALSE;                        
    if ($page_offset==0) $is_first_page = TRUE;
    if (($config['total_rows']-$page_offset)<=$this->office_per_page) $is_last_page = TRUE;

    $this->_data['is_first_page'] = $is_first_page;
    $this->_data['is_last_page'] = $is_last_page;                              
    $this->_load_view('admin/training_admin');       
  }
  //Delete Training
  function delete_article($id,$no,$lg)
  {
    if($this->session->userdata('admin')==FALSE)
    {
      redirect(site_url("admin"));
    }
    else
    {
      if($this->Mtraining->del_article($id,$no,$lg) == TRUE)
      {
          remove_meta($id,'formation');
          redirect('training/index/'.$lg.'/');
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
    $this->image_upload_lib->init();
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
        $this->_data['uname'] = $this->input->post('uname');
        $query_count_no = $this->Mtraining->count_no($lg);
        if($query_count_no->num_rows()>0)                   
        {
          $query = $this->Mtraining->get_no($lg);
          foreach($query as $row)
          {
            $no = $row->max_no;
          }
          $no_temp=$no+1;    
        }else
        {
          $no_temp=1;        
        }

        if(!$this->_data['uname']) 
          $this->_data['uname']='noimage.gif';
        if($this->Mtraining->add_training($date,$title,$content,$lg,$this->_data['uname'],$no_temp)==TRUE)
        {
          $this->_message('training', __("CF_addarticle_success"), 'success', site_url("training/index").'/'.$lg);
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
      //$lg = $this->input->post('lg');
      $edit_image=$this->input->post('edit_image'); 
      $this->_data['uname'] = $this->input->post('uname');
      if (strlen($this->_data['uname'])>1)
      {
        $query_search= $this->Mtraining->count_record_image($id);
        if($query_search->num_rows()>0)
        {
          $data = $this->Mtraining->edit_training($id,$title,$content,$this->_data['uname']);
          $this->_message('training', __("CF_editarticle_success"), 'success', site_url("training/index/".$this->_data['lang']));
        }else
        {
          $this->image_upload_lib->remove_image_from_db($id,'ID','Image','tbltraining');
          $data = $this->Mtraining->edit_training($id,$title,$content,$this->_data['uname']);
          $this->_message('training', __("CF_editarticle_success"), 'success', site_url("training/index/".$this->_data['lang']));    
        }

      }else
      {
        $data = $this->Mtraining->edit_training($id,$title,$content,$lg,$edit_image);
        $this->_message('training', __("CF_editarticle_success"), 'success', site_url("training/index/".$this->_data['lang']));

      }

    }   
  }
  //get training admin
  function get_training_admin($id='')
  { 
    is_admin();
    $query = $this->Mtraining->get_data_to_form($id); 
    $this->image_upload_lib->init();  
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

  //order
  function order_by_no($no_temp_1='',$no_temp_2='',$lg)
  {
    // $lg = $this->uri->segment(3);
    if($this->Mtraining->update_one($no_temp_2,$lg)==TRUE)
    {
      if($this->Mtraining->update_temp($no_temp_1,$no_temp_2,$lg)==TRUE)
      {
        if($this->Mtraining->update_two($no_temp_1,$lg)==TRUE)
        {
          redirect(site_url('training/index'.'/'.$lg));    
        }   
      }    
    }
  }    

  function swap_by_no($no_temp_1,$no_temp_2,$lg)
  {
    is_admin();
    if($no_temp_2<=0 || !is_numeric($no_temp_2))
    {
      $this->_message('training', __("CF_Invaild_format"), 'error',site_url("training/index").'/'.$lg);   
    }else
    {
      $query = $this->Mtraining->get_no($lg);
      foreach($query as $row)
      {
        $max_no = $row->max_no;
      }
      if($no_temp_2>$max_no)
      {
        $this->_message('training', __("CF_Invaild_format"), 'error',site_url("training/index").'/'.$lg);
      }else
      {
        $no_temp_2=$max_no-($no_temp_2-1);
        if($this->Mtraining->update_one($no_temp_2,$lg)==TRUE)
        {
          if($this->Mtraining->update_temp($no_temp_1,$no_temp_2,$lg)==TRUE)
          {
            if($this->Mtraining->update_two($no_temp_1,$lg)==TRUE)
            {
              redirect(site_url('training/index'.'/'.$lg));    
            }   
          }    
        }   
      }   
    }
  }
  //Show all by order    
  function show_order()
  {
    is_admin();
    $lg = $this->uri->segment(3);
    //$this->_data['Lang_temp']=$lg;
    //$lg=$this->_data['lang'];    
    if (! $lg) $lg=$this->_data['lang'];    
    if (lang_name_by_short_key($lg,TRUE)==FALSE)
    {
      $this->_message('training', 'Invaild language', 'error',site_url("training/index").'/'.$this->_data['lang']);
    }   

    $this->_data['path'][] = array(
    'name' => __("CF_training"),
    'link' => '#'
    ); 
    $page_offset=$this->uri->segment(4);
    $this->_data['lg'] = $lg;
    $config['base_url'] = base_url().'index.php/training/index/'.$lg;
    $config['total_rows'] = $this->Mtraining->count_record($lg);
    $config['per_page']=5;

    $config += config_pagination_style();
    $config['uri_segment'] = 4;
    $query = $this->Mtraining->get_no($lg);
    foreach($query as $row)
    {
      $no = $row->max_no;
    }
    $this->_data['max_no']=$no;   
    $this->pagination->initialize($config);
    $this->_data['articles'] = $this->Mtraining->get_all_by_order($lg,$page_offset,$config['per_page']);
    $this->_data['pagination'] = $this->pagination->create_links(); 
    $is_first_page = FALSE;
    $is_last_page = FALSE;                        
    if ($page_offset==0) $is_first_page = TRUE;
    if (($config['total_rows']-$page_offset)<=$config['per_page']) $is_last_page = TRUE;
    $this->_data['is_first_page'] = $is_first_page;
    $this->_data['is_last_page'] = $is_last_page;                              
    $this->_load_view('admin/training_admin');       
  }

}

