<?php
class Xmlvideo extends Admin_controller{
    function Xmlvideo()
    {
        parent::Admin_controller();
        $this->_container = 'container'; 
        $this->load->model('Mxmlvideo');
        $this->load->helper('url');
    }
    function index()
    {
        is_admin();
        $this->_data['path'][] = array(
        'name' => __("CF_player_vid_set"),
        'link' => '#'
        );
        $this->_data['query'] = $this->Mxmlvideo->get_xmlvid();
        $this->_load_view('admin/configxmlvideo');       
    }
    function update_setting($id='')
    {
        is_admin();
        $this->form_validation->set_rules('fullscreen_hideCursor',strtolower(__("CF_hide_cur")),'trim|required|callback_check_is_numeric');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
            $this->index();
        }else
        {
            $watermark_resource='watermark.png';
            $controls_show=$this->input->post('controls_show');
            $controls_hd=$this->input->post('controls_hd');
            $fullscreen_resizable=$this->input->post('fullscreen_resizable');
            $fullscreen_hideCursor=$this->input->post('fullscreen_hideCursor');
            $style_global=$this->input->post('style_global');
            $embed=$this->input->post('embed');  
            $data = array(
            'watermark_resource'=>$watermark_resource,
            'controls_show'=>$controls_show,
            'controls_hd'=>$controls_hd,
            'fullscreen_resizable'=>$fullscreen_resizable,
            'fullscreen_hideCursor'=>$fullscreen_hideCursor,
            'style_global'=>$style_global,
            'embed'=>$embed                   
            );
            $this->Mxmlvideo->update_xmlvid($id,$data);
            $this->_message('xmlvideo', __("CF_editxml_success"), 'success', site_url("xmlvideo/index"));
        }
    }
    function check_is_numeric($vt_temp)
    {
        if (!is_numeric($vt_temp)) {
            $this->form_validation->set_message(
            'check_is_numeric',
            __("CF_check_numbers")
            );
            return FALSE;
        }
        else
        {
            return TRUE;
        }
    }

}
