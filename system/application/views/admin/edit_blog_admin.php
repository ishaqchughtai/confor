      <div class="content_item">
        <h3>Edit Blog</h3>
        <?php
                                    foreach($query as $row){                               
                                        $id = $row->ID;
                                        $link = $row->Link;
                                        $title = $row->Title;
                                        $subject = $row->Subject;
                                        $keywords = $row->Keywords;
                                        $text = $row->Text;
                                        $CountView = $row->CountView;
                                        $about = $row->About;
                                    }
                                ?>
        <form action="<?php echo site_url('blog/edit_blog_submit').'/'.$id?>" method="post" enctype="multipart/form-data" class="global" name="blog">
          <p>
            <label for="name"><?php echo __("CF_your_name")?>: <?php echo $this->session->userdata('admin')?></label>
          </p>
          <?php 
                                    $datestring = "%F %j%S %Y";
                                    $time = time();?>
          <p>
            <label for="date"><?php echo __("CF_date")?>: <?php echo mdate($datestring,$time);?> </label>
          </p>
          <p>
            <label><?php echo __("CF_blog_thum")?> :</label>
            <?php
                                    $data = array('name' => 'txtLink',
                                    'id' => 'txtLink',
                                    'class'=>'short',
                                    'readonly'=>'true',
                                    'value'=>$link);                                         
                                    echo form_input($data);
                                    echo form_error('txtLink'); ?>
          <p>
            <input type="button" value="<?php echo __("CF_up")?>" class="submit" name="uploadvideo" onclick="window.open('<?php echo site_url('blog/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" />
          </p>
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
                                        'value'=>$about);
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
