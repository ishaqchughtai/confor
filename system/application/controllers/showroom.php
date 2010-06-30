<?php
    class Showroom extends Admin_controller{
        function Showroom(){
            parent::Admin_controller();
            $this->load->model('Mshowroom');
            $this->load->helper('url');
            $this->load->library('session'); 
        }
        function add_new_images()
        {
            $this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
            $this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker=1);         
            $this->_load_view('admin/add_showroom_images');   
        }
        function add_new_images_for_speaker($Speaker='')
        {
            $this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
            $this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker);            
            $this->_load_view('admin/add_showroom_images');   
        }
        function submit_add_new_images($video_name='')
        {
            is_admin(); 
            $this->form_validation->set_rules('txtLink','Images','trim|required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->input->post('btnsubmit'))
            {                                         
                $txtLink=$this->input->post('txtLink');
                if($this->form_validation->run()==FALSE)
                {
                    $this->add_new_images();                             
                }else
                {
                    if($this->Mshowroom->add_image($video_name,$txtLink)==TRUE)
                    {                    
                        $this->_data['query_speaker'] = $this->Mshowroom->get_all_speaker();
            		$this->_data['query_video'] = $this->Mshowroom->select_speaker_video($Speaker=1);
            		$this->_data['error'] = 'New image successfully added';         
            		$this->_load_view('admin/add_showroom_images'); 
                    } 
                }
            }else
            {
                $this->add_new_images();
            }  
        }
        function show_all_images()
        {
            
        }
        // Do upload
        function do_upload()
        {
            if($this->session->userdata('admin')==FALSE)
            {
                redirect(site_url("admin"));
            }
            else
            {
                $config['upload_path'] = './assets/uploads/image/';
                $config['allowed_types'] = 'jpg';
                $config['max_size']    = '300';
                $config['max_width']  = '1024';
                $config['max_height']  = '768';
                $config['overwrite']  = 'TRUE';
                $this->load->library('upload', $config);

                if ( ! $this->upload->do_upload())
                {
                    $error = array('error' => $this->upload->display_errors());
                    $this->load->view('admin/upload_form_showroom', $error);
                }    
                else
                {
                    $data = array('upload_data' => $this->upload->data());
                    $data['Link_full'] = $this->upload->file_name;
                    $this->load->view('admin/upload_success_showroom', $data);
                }
            }  
        }
    }   
?>