<?php
  class Shop extends Frontend_controller
  {
    function Shop()  
    {
      parent::Frontend_controller();
      $this->load->helper('url');
      $this->load->model('Mshopproduct','mshopproduct');
      $this->load->model('MShop');
    }

    function index()
    {
       redirect(base_url().'prestashop');

    }    
  }
?>