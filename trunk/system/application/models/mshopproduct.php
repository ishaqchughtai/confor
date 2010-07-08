<?php
  
  class Mshopproduct extends Model 
  {
    function Mshopproduct()
    {
      parent::Model();
      $this->load->database();
    }
    
    function get_relate_shop($keyword,$lang,$path_img)
    {
      $this->db->select("
      presshop_product.id_product,
      name,
      presshop_product_lang.description_short
      ");
      $this->db->from('presshop_product');      
      $this->db->join('presshop_product_lang','presshop_product.id_product = presshop_product_lang.id_product');
      $this->db->where(array('active'=>'1','quantity >'=>'0','id_lang'=>$lang));
      $this->db->order_by('presshop_product.id_product','desc');      
      $product_list = $this->db->get();
      $arr_list = $product_list->result_array();//ps_product_lang
      
      if($arr_list && count($arr_list)>0)
      {
          $arr_key = array();
          $pattern = '/'.$keyword.'/i'; //Search for string; search for word is $pattern = '/\b'.$keyword.'\b/i'; 
          $count_game = 0;
          foreach($arr_list as $row)
          {
              if(preg_match($pattern,$row['name']) || preg_match($pattern,strip_tags($row['description_short'])))
              {
                  $this->db->select("
                  id_image
                  ");
                  $this->db->from('presshop_image');    
                  $this->db->where(array('id_product'=>$row['id_product'],'cover'=>'1'));
                  $this->db->order_by('id_product','desc');      
                  $img_list = $this->db->get();
                  $img_list = $img_list->result_array();
                  if($img_list && count($img_list)>0)
                  {
                      $img_list = $img_list[0];
                      $img_link = $path_img.$row['id_product'].'-'.$img_list['id_image'].'-home.jpg';
                      //if(file_exists($img_link))
                      //{
                          $arr_key[] = array('id_product'=>$row['id_product'],'name'=>$row['name'],'description_short'=>$row['description_short'],'img'=>$img_link);
                          $count_game++;
                      //}
                      
                  }
                  if($count_game>=3) break;
              }
          }
          
          if(count($arr_key)>0) return $arr_key;
      }
      return false;
    }
    
    function get_random_shop($lang,$path_img,$id_exists=0, $limit=0) //$id_exists = array('1,2,4');
    {
      $this->db->select("
      presshop_product.id_product,
      name,
      presshop_product_lang.description_short
      ");
      $this->db->from('presshop_product');      
      $this->db->join('presshop_product_lang','presshop_product.id_product = presshop_product_lang.id_product');
      $this->db->where(array('active'=>'1','quantity >'=>'0','id_lang'=>$lang));
      
      if($id_exists && is_array($id_exists)) $this->db->where_not_in('presshop_product.id_product',$id_exists);
      
      $this->db->order_by('presshop_product.id_product','random');
      if($limit==0) $this->db->limit(3);
      else $this->db->limit($limit);
      $product_list = $this->db->get();
      $arr_list = $product_list->result_array();//ps_product_lang
      $arr_key = array();
      $count_game = 0;
      if($arr_list && count($arr_list)>0)
      {
      foreach($arr_list as $row)
      {
        $this->db->select("
                  id_image
                  ");
                  $this->db->from('presshop_image');    
                  $this->db->where(array('id_product'=>$row['id_product'],'cover'=>'1'));
                  $this->db->order_by('id_product','desc');      
                  $img_list = $this->db->get();
                  $img_list = $img_list->result_array();
        if($img_list && count($img_list)>0)
        {
          $img_list = $img_list[0];
          $img_link = $path_img.$row['id_product'].'-'.$img_list['id_image'].'-home.jpg';
          //if(file_exists($img_link))
          //{
            $arr_key[] = array('id_product'=>$row['id_product'],'name'=>$row['name'],'description_short'=>$row['description_short'],'img'=>$img_link);
            $count_game++;
          //}
                      
       }
        if($count_game>=3) break;
        
      }
      if(count($arr_key)>0) return $arr_key;
      }
      return false;
    }
    
  } 
  
?>