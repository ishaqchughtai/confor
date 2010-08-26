<?php
  class Writexml extends Admin_controller
  {
    function Writexml()
    {
      parent::Admin_controller();
      $this->_container = 'container';    
      $this->load->helper('xemmex_helper');
      //$this->load->model('MWritexml');    
      $this->load->model('Mshopproduct','mshopproduct');
    }

    function get_video()  
    {
      $this->db->select("
      videos.vid_id,
      videos.title,
      videos.description
      ");
      $this->db->from('videos');
      $query = $this->db->get();
      //return $query->result_array();
      is_admin();
      $this->_data['query'] = $query->result_array();
      $this->_load_view('admin/write');
      $this->_message('writexml', __("CF_update_sitemap_suc"), 'success', site_url('writexml/save_as_html'),"download");
    }

    function save_as_html()
    {
      $this->db->select("
      videos.vid_id,
      videos.title,
      videos.description
      ");
      $this->db->from('videos');
      $query = $this->db->get();
      is_admin();
      // header("Content-Type: application/octet-stream;");
      // header("Content-Transfer-Encoding: binary");
      // header('Content-Disposition: filename="'.$code.'.html"');
      header('Content-Transfer-Encoding: binary');    
      header('Content-Type: text/xml');
      //header('Content-Length: '.filesize($file));
      header('Content-Disposition: attachment; filename="videositemap.xml"');
      $data['query'] = $query->result_array();
      $this->load->view('admin/writexml',$data);
    }
  }
?>
