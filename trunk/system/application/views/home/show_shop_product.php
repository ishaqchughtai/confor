<?php
  
  
//  $this->load->library('uri');
  $CI =& get_instance();
  //$lang_shop_shop = xemmex_language();
  $lang_shop_shop = $CI->_data['lang'];
  $lang_shop_shop = $lang_shop_shop=='fr'?2:1;
  $title_video_shop = '';
  $arr_shop_info = array();
  if($this->uri->segment(3) && $this->uri->segment(3)!='' && is_numeric($this->uri->segment(3)))
  {
      if(!isset($this->Mhome))
      {
          $this->load->model('Mhome');          
      }
      
      $get_one_video = $this->Mhome->get_video_by_id($this->uri->segment(3));
      if ($get_one_video->num_rows() > 0)
      {
          $get_one_video = $get_one_video->row(); 
          $title_video_shop = $get_one_video->title;
      }
  }
  elseif(!$this->uri->segment(3))
  {
      $get_one_video = $this->Mhome->get_top_viewed_video($CI->_data['lang']);
      if ($get_one_video)
      {
          $get_one_video = $get_one_video->row(); 
          $title_video_shop = $get_one_video->title;
      }
  }
  
  if($title_video_shop=='')
  {
      $arr_shop_info = $this->mshopproduct->get_random_shop($lang_shop_shop,base_url().'/prestashop/img/p/');
  }
  else
  {
      
      $arr_shop_info = $this->mshopproduct->get_relate_shop($title_video_shop,$lang_shop_shop,base_url().'/prestashop/img/p/');
      if($arr_shop_info && count($arr_shop_info)<=3) 
      {
          $arr_id = array();
          foreach($arr_shop_info as $row)
          {
              $arr_id[] = $row['id_product'];
          }
          $arr_shop_info1 = $this->mshopproduct->get_random_shop($lang_shop_shop,base_url().'/prestashop/img/p/',$arr_id,3-count($arr_shop_info));
          $arr_shop_info = array_merge($arr_shop_info,$arr_shop_info1);
      }
      else
      {
      	$arr_shop_info = $this->mshopproduct->get_random_shop($lang_shop_shop,base_url().'/prestashop/img/p/');
      }
  }
  
  if($arr_shop_info && count($arr_shop_info)>0)
  {
      $url_product_lang = '';
      if($lang_shop_shop==2) $url_product_lang .= '&lang='.$lang_shop_shop;
?>
        <div class="content">            
            <?php for($i=0; $i<count($arr_shop_info); $i++):?>                            
                <div class="top_box_block<?php if(($i+1)%3==0) echo ' no_margin_r';?>">                
                    <h4 ><?php echo $arr_shop_info[$i]['name']?></h4>
                    <p><?php echo word_limiter($arr_shop_info[$i]['description_short'],15);?></p>
                    <a href="<?php echo base_url().'prestashop/product.php?id_product='.$arr_shop_info[$i]['id_product'].$url_product_lang;?>" class="show_shop_product"><img src="<?php echo $arr_shop_info[$i]['img']?>" class="icon"></a> 
                </div>
                <!-- /.content .top_box_block -->
            <?php endfor;?>
        </div>
        <!-- /#top_box -->
<?php              
  }
  else
  {
      $advs = get_random_top_adv($category);
      //$advs = get_random_top_adv($category);
    //print_r($ar);
    $attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
?>
        <div class="content">            
            <?php for($i=0; $i<count($advs); $i++):?>                            
                <div class="top_box_block<?php if(($i+1)%3==0) echo ' no_margin_r';?>">                
                    <h4><?php echo $advs[$i]['AdvertiserName']?></h4>
                    <p><?php echo word_limiter($advs[$i]['TextTips'],15);?></p>
                    <a href="<?php echo $advs[$i]['URL']?>" class="show_shop_product"><img src="<?php echo base_url().'assets/uploads/adv/'.$advs[$i]['ImageLink']?>" class="icon"></a> 
                </div>
                <!-- /.content .top_box_block -->
            <?php endfor;?>
        </div>
        <!-- /#top_box -->
<?php        
  }
?>