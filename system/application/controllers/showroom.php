<?php
    class Showroom extends Admin_controller{

        function Showroom(){
            parent::Admin_controller();
            $this->load->model('Mshowroom');
            $this->load->helper('url');
            $this->load->library('image_upload_lib'); 
			$this->image_upload_lib->ajax_link = site_url('showroom/do_upload_ajax');
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
		
        function add_new_images()
        {		
            $this->_data['path'][] = array(
            'name' => __("CF_add_showroom"),
            'link' => '#'
            );

			$this->image_upload_lib->init();
			
            //$this->form_validation->set_rules('txtLink',strtolower(__("CF_image_link")),'trim|required');
            $this->form_validation->set_rules('speaker_email',strtolower(__("CF_one_speaker")),'required');
            $this->form_validation->set_rules('vid_title',strtolower(__("CF_vid")),'required');

            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->input->post('btnsubmit'))
            {                                         
                //$txtLink=$this->input->post('txtLink');
                $this->_data['vid_id'] = $this->input->post('vid_id');
                $this->_data['vid_title'] = $this->input->post('vid_title');
                $this->_data['speaker'] = $this->input->post('speaker');
				$this->_data['uname'] = $this->input->post('uname');
                if($this->form_validation->run()==FALSE)
                {
                    $this->_load_view('admin/add_showroom_images');   
                }
                else
                {
                    if($this->Mshowroom->add_image($this->_data['vid_id'], $this->_data['uname'],0)==TRUE)
                    {                    
                        $this->_message('admin', __("CF_add_image_suc"), 'success',site_url("showroom/add_new_images"));
                    } 
                }
            }else
            {
                $this->_load_view('admin/add_showroom_images');
            }  		
        }

        function do_paging() {							
            if (! is_admin(FALSE)) 
            {
                $out['error'] = strtolower(__("CF_only_admin"));
                return $out;
            }	
            $num_per_page = $this->uri->segment(3);
            $page_offset = $this->uri->segment(4);
            $keyword = $this->input->post('keyword');
            $speaker_id = $this->input->post('speaker_id');

            if ($page_offset==FALSE) 
            {
                $page_offset = 0;
            }

            if ($num_per_page>0) 
            {
                $query = $this->Mshowroom->show_paging($speaker_id, $num_per_page, $page_offset, $keyword);
                if ($query->num_rows() > 0)
                {
                    $out['vids'] = json_encode($query->result_array());
                } 
                else 
                {
                    $out['error'] = strtolower(__("CF_reslult_search"));
                }
            } 
            else 
            {
                $out['error'] = strtolower(__("CF_row"));
            }

            $this->load->view('admin/get_video_json',$out);
        }

        function get_paging_html() {				
            if (! is_admin(FALSE))
            {
                return FALSE;
            }
            $num_per_page = $this->uri->segment(3);
            $page_offset = $this->uri->segment(4);
            $keyword = $this->input->post('keyword');
            $speaker_id = $this->input->post('speaker_id');

            $config['base_url'] = base_url()."index.php/showroom/do_paging/".$num_per_page;
            $config['per_page'] = $num_per_page;
            $config['uri_segment'] = 4;		

            $this->db->where("videos.mem_id", $speaker_id); 

            if (($keyword)&&(strlen($keyword)>0)) {
                $this->db->like("videos.title", $keyword);
                $this->db->from('videos');
                $config['total_rows'] =  $this->db->count_all_results();
            } else {
                $this->db->from('videos');
                $config['total_rows'] = $this->db->count_all_results();
            }
            $this->pagination->initialize($config);
            echo $this->pagination->create_links();	
        }	

        function list_images()
        {
            $this->_data['path'][] = array(
            'name' => __("CF_ad_menu_showroom"),
            'link' => '#'
            );
            $this->_data['query'] = $this->Mshowroom->get_all_show_room();
            $this->_load_view('admin/list_images_showroom');       	
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

        function delete_image($id)
        {
			if ($this->image_upload_lib->remove_image_from_db($id,'ID','SpeakerImages','tblshowroom')==FALSE) return;
			
            if($this->Mshowroom->del_image($id)==TRUE)
            {
                $this->_message('admin', __("CF_add_image_suc"), 'success',site_url("showroom/list_images")); 
            }else
            {

            }    
        }
        function edit_image($id)
        {			
            $this->_data['path'][] = array(
            'name' => __("CF_edit_image"),
            'link' => '#'
            );
			$this->image_upload_lib->init();
			
            $this->_data['query_image']= $this->Mshowroom->get_one_show_room($id);            
            //$this->form_validation->set_rules('txtLink',strtolower(__("CF_image_link")),'trim|required');
            $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
            if($this->input->post('btnsubmit'))
            {                                         
                $edit_image=$this->input->post('edit_image');
                $show=$this->input->post('show');
				$this->_data['uname'] = $this->input->post('uname');
				
				if (strlen($this->_data['uname'])>1)
				{										
					$this->image_upload_lib->remove_image_from_db($id,'ID','SpeakerImages','tblshowroom');
                    if($this->Mshowroom->edit_image($id,$this->_data['uname'],$show)==TRUE)
                    {                    
                        $this->_message('admin', __("CF_edit_image_suc"), 'success',site_url("showroom/list_images"));
                    } 					
				}
				else
				{					
                    if($this->Mshowroom->edit_image($id,$edit_image,$show)==TRUE)
                    {                    
                        $this->_message('admin', __("CF_edit_image_suc"), 'success',site_url("showroom/list_images"));
                    } 										
				}
					// $this->image_upload_lib->remove_image_from_db($id,'ID','SpeakerImages','tblshowroom');
                    // if($this->Mshowroom->edit_image($id,$this->_data['uname'],$show)==TRUE)
                    // {                    
                        // $this->_message('admin', __("CF_edit_image_suc"), 'success',site_url("showroom/add_new_images"));
                    // } 
					// $this->_load_view('admin/edit_showroom_images');  

            }        
			$this->_load_view('admin/edit_showroom_images');            
        }
    }   
?>