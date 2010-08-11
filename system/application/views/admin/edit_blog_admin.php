<?php $this->load->view("admin/admin_menu_blog");?>
    
<div class="content_item">
    
    <?php
        foreach($query as $row){                               
            $id = $row->ID;
            $images = $row->Link;
            $title = $row->Title;
            $subject = $row->Subject;
            $keywords = $row->Keywords;
            $text = $row->Text;
            $CountView = $row->CountView;
            $about = $row->About;
            $lg = $row->Lang;
        }
    ?>
    <ul class="link_conttrol">
                    <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/blog/'.$id)?>"><?php echo __("CF_edit_blog_ar_meta")?></a></li>
                    </ul><br />

                    <h3><?php echo __("CF_edit_blog")?></h3>
    <form action="<?php echo site_url('blog/edit_blog_submit').'/'.$id?>" method="post" enctype="multipart/form-data" class="global" name="blog">
        <input name="edit_image" id="edit_image" type="hidden" value="<?php echo $images;?>"/>
        <p>
            <label for="name"><?php echo __("CF_your_name")?>: <?php echo $this->session->userdata('admin')?></label>
        </p>
        <?php 
            $datestring = "%d-%m-%Y";
            $time = time();?>
        <p>
            <label for="date"><?php echo __("CF_date")?>: <?php echo mdate($datestring,$time);?> </label>
        </p>
        <div class="input text">
            <label>Display language</label>        
            <?php choose_your_language($lg);?>
        </div>
        <p>
            <label><?php echo __("CF_blog_thum")?> :</label>
            <?php $this->load->view('image_upload',array('edit_image'=>$images));?>
        </p>
        <br />
        <br />
        <br />
        <p>
            <label for="title"><?php echo __("CF_title")?>:</label>
            <?php
                $data = array('name' => 'txtTitle',
                'id' => 'txtTitle',
                'class'=>'short',
                'value'=>$title);
                echo form_input($data);
                echo form_error('txtTitle');?>
        </p>
        <p>
            <label for="subject"><?php echo __("CF_subject")?>:</label>
            <?php
                $data = array('name' => 'txtSubject',
                'id' => 'txtSubject',
                'class'=>'short',
                'value'=>$subject);                                         
                echo form_input($data);
                echo form_error('txtSubject');?>
        </p>
        <p>
            <label for="keywords"><?php echo __("CF_key")?>:</label><br /><label>*<?php echo __("CF_blog_warning")?>. </label> 
            <?php
                $data = array('name' => 'txtKeywords',
                'id' => 'txtKeywords',
                'class'=>'short',
                'value'=>$keywords);                                         
                echo form_input($data);
                echo form_error('txtKeywords');?>

        </p>
        <p>
            <?php echo form_error('about');?>
            <label for=""><?php echo __("CF_about_au")?>:</label><br />
            <?php
                $data = array('name' => 'about',
                'id' => 'about',
                'width' => '600',
                'height' => '400',
                'value'=>$about,
                'class'=>"medium");
                echo form_textarea($data);
            ?>
        </p>
        <p>
            <label for="Body"><?php echo __("CF_blog_body")?><?php echo __("CF_blog_body")?>:</label>
            <br />
            <?php
                $data = array('name' => 'txtBody',
                'id' => 'txtBody',
                'width' => '600',
                'height' => '400',
                'value'=>$text);
                echo form_fckeditor($data);
                echo form_error('txtBody'); ?>
        </p>
        <br />
        <br />
        <br />
        <p>
            <input name="btnSave" type="submit" class="submit" value="<?php echo __("CF_save")?>" />
            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
        </p>
    </form>
      </div>   
