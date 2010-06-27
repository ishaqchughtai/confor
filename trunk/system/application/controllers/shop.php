<?php
  class Shop extends Frontend_controller
  {
    function Shop()  
    {
      parent::Frontend_controller();
      $this->load->helper('url');
      $this->load->model('MShop');
    }

    function index()
    {
      redirect(base_url().'shop');
    }

    function active()
    {
      is_admin();
      $this->MShop->active_shop();
       redirect(site_url('admin'));
    }

    function deactive()
    {
      is_admin();
      $this->MShop->deactive_shop();
      redirect(site_url('admin'));
    }
    
  }
?>
