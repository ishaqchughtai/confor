    <?php
        foreach($query as $row)
        {
            $id = $row->ID;
            $date =  $row->Date;
            $title = $row->Title;
            $content = $row->Content;
            $lg = $row->Lang;                        
        }
    ?>    
    <?php $this->load->view("admin/admin_menu_training");?> 
                <div class="content_item">
    <br>
                    <h3><?php echo __("CF_edit_ar")?></h3>
                    <?php
                        $data=array('name' => 'training-form','id' => 'training-form'); 
                        echo form_open('training/edit_article'.'/'.$id,$data);
                    ?>
                    <div class="input text">
                        <label><?php echo __("CF_dis_lang")?></label>        
                        <?php choose_your_language($lg);?>
                    </div>
                        
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
