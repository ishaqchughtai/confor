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
        'name' => 'Player Video Setting',
        'link' => '#'
        );
        $this->_data['query'] = $this->Mxmlvideo->get_xmlvid();
        $this->_load_view('admin/configxmlvideo');       
    }
    function update_setting($id='')
    {
        is_admin();
        $this->_data['path'][] = array(
        'name' => 'Player Video Setting',
        'link' => '#'
        );
        $this->form_validation->set_rules('fullscreen_hideCursor',strtolower('Hide Cursor'),'trim|required|max_length[50]');
        $this->form_validation->set_error_delimiters('<p class="not_error medium"><span class="img"></span>','<span class="close"></span></p>');
        if($this->form_validation->run()==FALSE)
        {
            $this->index();
        }else
        {
            $watermark_resource='watermark.png';
            $vt_temp=$this->input->post('radio');
            $controls_show=$this->input->post('controls_show');
            $controls_hd=$this->input->post('controls_hd');
            $fullscreen_resizable=$this->input->post('fullscreen_resizable');
            $fullscreen_hideCursor=$this->input->post('fullscreen_hideCursor');
            $style_global=$this->input->post('style_global');
            $embed=$this->input->post('embed');
            if($vt_temp==11)
            {
                $watermark_align_top='top';
                $watermark_align_rl='left';    
            }elseif($vt_temp==12)
            {
                $watermark_align_top='top';
                $watermark_align_rl='right';   
            }elseif($vt_temp==21)
            {
                $watermark_align_top='bottom';
                $watermark_align_rl='left';    
            }elseif($vt_temp==22)
            {
                $watermark_align_top='bottom';
                $watermark_align_rl='right';   
            }    
            $data = array(
            'watermark_resource'=>$watermark_resource,
            'watermark_align_top'=>$watermark_align_top,
            'watermark_align_rl'=>$watermark_align_rl,
            'controls_show'=>$controls_show,
            'controls_hd'=>$controls_hd,
            'fullscreen_resizable'=>$fullscreen_resizable,
            'fullscreen_hideCursor'=>$fullscreen_hideCursor,
            'style_global'=>$style_global,
            'embed'=>$embed       
            );
            $this->Mxmlvideo->update_xmlvid($id,$data);
            $this->_message('xmlvideo', __("CF_editblog_success"), 'success', site_url("xmlvideo/index"));
        }
    }
}
