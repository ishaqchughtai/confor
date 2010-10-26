<?php
    class Office_frontend extends Frontend_controller
    {
        var $office_per_page = 5;
        function Office_frontend()
        {
            parent::Frontend_controller();
            $this->load->helper('date');
            $this->load->library('email');
            $this->load->model('Mcoffice');
            $this->load->model('Mmetadata');
            $this->load->model('Mshowroom');
            $this->load->model('Mshopproduct','mshopproduct');
            $this->load->helper('url');
        }

        function _before_render() 
        {
            $side_bar['page'] = "home/sidebar_office";         
            $this->_data['side_bar'] = $side_bar;    
        }

        function office()
        {
            $lg = $this->_data['lang'];
            $this->_data['lg'] = $lg;
            //$per_page = $this->uri->segment(3);
            $offset = $this->uri->segment(4);

            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => "#"
            );
            $per_page = $this->_setting['num_per_page_conf'];      
            $config['uri_segment'] = 4;
            $config['base_url'] = base_url().'index.php/office_frontend/office/'.$per_page;
            $config['total_rows'] = $this->Mcoffice->count_office_by_lang($lg);
            //echo $config['total_rows'];
            //      return;
            $config['per_page']=$per_page;

            $config += config_pagination_style();

            $this->pagination->initialize($config);
            $this->_data['query'] = $this->Mcoffice->get_all_by_order($lg,$offset,$per_page);

            $this->_data['pagination'] = $this->pagination->create_links();


            $lg = $this->_data['lang'];
            $meta = $this->Mmetadata->out_static_meta('office_list',$lg);
            if ($meta!=FALSE) 
            {
                $title = $meta->title.' - confor.tv';
                $this->_data['meta'] = $meta;  
            }
            else
            {
                $title = __("CF_conference_office").' - confor.tv';
            }
            $this->_data['page_title'] = $title;
            $this->_load_view('home/office_view');
        }

        //Content's office of user
        function office_content($id='',$title='') 
        {

            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => site_url("office_frontend/office/".$this->office_per_page)
            );

            $this->_data['path'][] = array(
            'name' => $title,
            'link' => '#'
            ); 
            $id = (double)$id;
            if(is_nan($id)==FALSE && $id > 0)
            {
                $query =  $this->Mcoffice->get_office_by_id($id); 
                $this->_data['query'] = $this->Mcoffice->get_office_by_id($id);
                $meta = $this->Mmetadata->out_meta('office',$id);
                if ($meta!=FALSE)
                {
                    $title = $meta->title.' - confor.tv';
                    $this->_data['meta'] = $meta;
                }
                else
                {
                    foreach($query as $row)
                    {
                        $title = $row['title'].' - confor.tv';
                    }
                } 
                $this->_data['page_title'] = $title;
                $this->_load_view('home/office_entry_view');  
            }
            else
            {
                redirect(base_url());
            }
        }

        function search()
        {
            $lg = $this->_data['lang'];
            $this->_data['lg'] = $lg;

            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => site_url("office_frontend/office/".$this->office_per_page)
            );
            $this->_data['path'][] = array(
            'name' => __("CF_result_search_office"),
            'link' => '#'
            );

            $keywords = $this->uri->segment(3);
            $per_page = 5;
            $offset = $this->uri->segment(5);


            $config['uri_segment'] = 5;
            $config['base_url'] = base_url().'index.php/office_frontend/search/'.$keywords.'/'.$per_page;
            $config['total_rows'] = $this->Mcoffice->count_record($keywords,$lg);
            $config['per_page']=$per_page;

            $config += config_pagination_style();
            $this->_data['office'] = $this->Mcoffice->search_office_by_alphabet($keywords,$lg,$per_page,$offset); 
            $this->pagination->initialize($config);
            $this->_data['pagination'] = $this->pagination->create_links();
            $this->_data['keywords'] = $keywords;
            $this->_data['page_title']=__("CF_Search_results").'"'.$keywords.'"'.' - '.__("CF_conference_office").' - '.'Confor.tv';
            if($this->_data['office'])
            {
                $this->_data['office_search']  =TRUE;
            }else
            {
                $this->_data['office_search']  =FALSE;    
            } 
            $this->_load_view('home/search_office');
        }

        function search_office()
        {
            $lg = $this->_data['lang'];
            $this->_data['lg'] = $lg;

            $this->_data['path'][] = array(
            'name' => __("CF_conference_office"),
            'link' => site_url("office_frontend/office/".$this->office_per_page)
            );
            $this->_data['path'][] = array(
            'name' => __("CF_result_search_office"),
            'link' => '#'
            );

            $keywords = $this->uri->segment(3);
            $per_page = $this->uri->segment(4);
            $offset = $this->uri->segment(5);

            $config['uri_segment'] = 5;
            $config['base_url'] = base_url().'index.php/office_frontend/search_office/'.$keywords.'/'.$per_page;
            $config['total_rows'] = $this->Mcoffice->count_record_by_title($keywords,$lg);
            $config['per_page']=$per_page;

            $config += config_pagination_style();
            $this->_data['office'] = $this->Mcoffice->search_office($keywords,$lg,$per_page,$offset); 
            $this->pagination->initialize($config);
            $this->_data['pagination'] = $this->pagination->create_links();
            $this->_data['keywords'] = $keywords;
            $this->_data['page_title']=__("CF_Search_results").'"'.$keywords.'"'.' - '.__("CF_conference_office").' - '.'Confor.tv';
            if($keywords=='5')
            {
                $this->_data['page_title']=__("CF_mess_no_search").' - '.'Confor.tv';      
                $this->_data['office_search']  =FALSE;  
                $this->_load_view('home/search_office');
                return;
            }
            if($this->_data['office'])
            {
                $this->_data['office_search']  =TRUE;
            }else
            {
                $this->_data['office_search']  =FALSE;    
            }
            $this->_load_view('home/search_office');
        }
    }

?>
