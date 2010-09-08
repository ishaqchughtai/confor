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

      $this->db->select('presshop_product.id_product,name,presshop_product_lang.description_short,presshop_product_lang.meta_keywords');
      $this->db->from('presshop_product');
      $this->db->join('presshop_product_lang','presshop_product.id_product = presshop_product_lang.id_product');
      
      $this->db->where(array('active'=>'1','quantity >'=>'0','id_lang'=>$lang));
      
      $this->db->group_by('presshop_product.id_product'); 
      
      $this->db->order_by('presshop_product.id_product','desc');      

      $product_list = $this->db->get();

      $arr_list = $product_list->result_array();//ps_product_lang 
      
      if($arr_list && count($arr_list)>0 && is_array($keyword))
      {
        $arr_key = array(); 
        $arr_has_product = array();
        if(isset($keyword['speaker_name']) && $keyword['speaker_name'] && !empty($keyword['speaker_name']))
        {
            $arr_keyword = preg_split("/[\s,]*[,\s]/",$keyword['speaker_name']); 
            foreach($arr_list as $row)
            {            
                $array_words = preg_split("/[\s,.]*[.,\s]*[,.\s]/",$row['meta_keywords']);
                foreach($arr_keyword as $kk=>$kw)
                {
                    if(!empty($kw) && $kw!=',')
                    {
                        if(in_array(trim($kw), $array_words))
                        {
                              $this->db->select('id_image');

                              $this->db->from('presshop_image');    

                              $this->db->where(array('id_product'=>$row['id_product'],'cover'=>'1'));

                              $this->db->order_by('id_product','desc');      

                              $img_list = $this->db->get();

                              $img_list = $img_list->result_array();

                              if($img_list && count($img_list)>0)
                              {
                                  $img_list = $img_list[0];

                                  $img_link = $path_img.$row['id_product'].'-'.$img_list['id_image'].'-home.jpg';
                                  $arr_key[] = array('id_product'=>$row['id_product'],'name'=>$row['name'],'description_short'=>$row['description_short'],'img'=>$img_link);                                  
                                  $arr_has_product[] = $row['id_product'];
                                  break;
                              }
                        }
                         if(count($arr_key)>=3) return $arr_key;
                    }
                }//End for arr_keyword
                if(count($arr_key)>=3) return $arr_key;
            }//End foreach arr_list
        } //End if speaker_name
           
        if(isset($keyword['video_blog_keyword']) && $keyword['video_blog_keyword'] && !empty($keyword['video_blog_keyword']))
        {
            $arr_keyword = preg_split("/[\s,]*[,\s]/",$keyword['video_blog_keyword']); 
            foreach($arr_list as $row)
            {            
                $array_words = preg_split("/[\s,.]*[.,\s]*[,.\s]/",$row['meta_keywords']);
                if(!in_array($row['id_product'],$arr_has_product))
                {
                  foreach($arr_keyword as $kw)
                  {
                  
                    if(!empty($kw) && $kw!=',')
                    {
                        if(in_array(trim($kw), $array_words))
                        {
                              $this->db->select('id_image');

                              $this->db->from('presshop_image');    

                              $this->db->where(array('id_product'=>$row['id_product'],'cover'=>'1'));

                              $this->db->order_by('id_product','desc');      

                              $img_list = $this->db->get();

                              $img_list = $img_list->result_array();

                              if($img_list && count($img_list)>0)
                              {
                                  $img_list = $img_list[0];

                                  $img_link = $path_img.$row['id_product'].'-'.$img_list['id_image'].'-home.jpg';
                                  $arr_key[] = array('id_product'=>$row['id_product'],'name'=>$row['name'],'description_short'=>$row['description_short'],'img'=>$img_link);
                                  break;
                              }
                        }
                         if(count($arr_key)>=3) return $arr_key;
                    }
                  } //End for arr_keyword    
                }//End if tracking product exists
                if(count($arr_key)>=3) return $arr_key;
            }//End foreach arr_list
        } //End if video_blog_key
           
      }  //End if have data
      if(count($arr_key)>0) return $arr_key;
      return false;

    }	

    

    function get_random_shop($lang,$path_img,$id_exists=0, $limit=0) //$id_exists = array('1,2,4');   
    { 
      
      $this->db->select('presshop_product.id_product,name,presshop_product_lang.description_short');
      $this->db->from('presshop_product');

      $this->db->join('presshop_product_lang','presshop_product.id_product = presshop_product_lang.id_product');

      $this->db->where(array('active'=>'1','quantity >'=>'0','id_lang'=>$lang));      

      if($id_exists && is_array($id_exists)) $this->db->where_not_in('presshop_product.id_product',$id_exists);
      
      $this->db->group_by('presshop_product.id_product');
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

            $this->db->select('id_image');

            $this->db->from('presshop_image');    
            $this->db->where(array('id_product'=>$row['id_product'],'cover'=>'1'));
            $this->db->order_by('id_product','desc');      
            $img_list = $this->db->get();
            $img_list = $img_list->result_array();

            if($img_list && count($img_list)>0)
            {

              $img_list = $img_list[0];

              $img_link = $path_img.$row['id_product'].'-'.$img_list['id_image'].'-home.jpg';

              $arr_key[] = array('id_product'=>$row['id_product'],'name'=>$row['name'],'description_short'=>$row['description_short'],'img'=>$img_link);

              $count_game++;
            }

            if($count_game>=3) break;
          }

          if(count($arr_key)>0) return $arr_key;

      }

      return false;

    }

    

    //Get All Categories of shop

    function getAllCategories($lang,$link)

    {

      $this->db->select("presshop_category.id_category,name");

      $this->db->from('presshop_category');      

      $this->db->join('presshop_category_lang','presshop_category.id_category = presshop_category_lang.id_category');

      $this->db->where(array('active'=>'1','id_lang'=>$lang,'level_depth >'=>'0'));

      $this->db->order_by('presshop_category.id_category','desc');      

      $product_list = $this->db->get();

      $arr_list = $product_list->result_array();

      

      if($arr_list && count($arr_list)>0)

      {

          $arr_rs = array();

          foreach($arr_list as $row)

          {

              //'name'=>$row['name'],'lin');

              $link_name = "<a alt=\"Confor.tv - {$row['name']}\" title=\"Confor.tv - {$row['name']}\" href=\"{$link}?id_category={$row['id_category']}&id_lang={$lang}\">{$row['name']}</a>";

              $arr_rs[] = $link_name;

          }

          if(count($arr_rs)>0) return $arr_rs;          

      }

      return false; 

      

    }

    

    

  } 

  

?>