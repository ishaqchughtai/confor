    <?php
        foreach($query as $row)
        {
            $id = $row->ID;
            $date =  $row->Date;
            $title = $row->Title;
            $content = $row->Content;
            $lg = $row->Lang;  
            $images = $row->Image;                      
        }
    ?>    
    <?php $this->load->view("admin/admin_menu_training");?> 
    <ul class="link_conttrol">
                    <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/formation/'.$id)?>"><?php echo __("CF_edit_article_meta")?></a></li>
                    </ul>
                <div class="content_item">
    <br>
                    <h3><?php echo __("CF_edit_ar")?></h3>
                    <?php
                        $data=array('name' => 'training-form','id' => 'training-form'); 
                        echo form_open('training/edit_article'.'/'.$id,$data);
                    ?>
                    <input name="edit_image" id="edit_image" type="hidden" value="<?php echo $images;?>"/>
                            <p>
            <label><?php echo __("CF_blog_thum")?> :</label>
            <?php $this->load->view('image_upload',array('edit_image'=>$images));?>
        </p>    
                        <p>
                        
                            <label for="title"><?php echo __("CF_title")?>:</label>
                            <input name="title" class="short" id="title" value="<?php echo $title ?>" />
                            <?php echo form_error('title')?>
                        
                        </p>
                        
                        <p>
                        
                            <label for="content"><?php echo __("CF_content")?>:</label>
                            <p>
                            <?php 
                                    
                                    if ( ! isset($_POST['content']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['content'];
                                    }
                                    $data = array('name' => 'content',
                                    'id' => 'content',
                                    'width' => '600',
                                    'height' => '400',
                                    'value'=> $content);
                                    echo form_fckeditor($data);
                                    echo form_error('content');
                                    ?>
                                    </p>
                        </p>                        
                        <p>                        
                            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_submit")?>" />                        
                        </p>
                    <?php echo form_close();?>
                    
                </div>
                <div id="left">
              </div>            
