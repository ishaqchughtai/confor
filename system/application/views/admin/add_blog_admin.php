<!-- /.content_item -->
<div class="content_item">
    <h3><?php echo __("CF_add_new_blog")?></h3>
    <form action="" method="post" enctype="multipart/form-data" class="global" name="blog">
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
        <?php echo form_error('txtLink'); ?>
        <input name="txtLink" type="text" id="txtLink" value="<?php if(isset($_POST['txtLink'])){ echo $_POST['txtLink'] ;}?>" class="short"  readonly="true"/>
        <p>
            <input type="submit" value="upload" class="submit" name="uploadvideo" onclick="window.open('<?php echo site_url('blog/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" />
        </p>
        </p>
        <br />
        <br />
        <br />
        <p>
            <label for="title"><?php echo __("CF_title")?>:</label>
            <?php echo form_error('txtTitle');?>
            <input name="txtTitle" type="text" id="txtTitle" value="<?php if(isset($_POST['txtTitle'])){ echo $_POST['txtTitle'] ;}?>" class="short"/>
        </p>
        <p>
            <label for="subject"><?php echo __("CF_subject")?>:</label>
            <?php
                echo form_error('txtSubject');?>
            <input name="txtSubject" type="text" id="txtSubject" value="<?php if(isset($_POST['txtSubject'])){ echo $_POST['txtSubject'] ;}?>" class="short"/>
        </p>
        <p>
            <label for="keywords"><?php echo __("CF_key")?>:</label>
            <br /><label>*Keywords Max 4 words and are separated by spaces. </label>
            <?php
                echo form_error('txtKeywords');?>
            <input name="txtKeywords" type="text" class="short" id="txtKeywords" value="<?php if(isset($_POST['txtKeywords'])){ echo $_POST['txtKeywords'] ;}?>"/>

        </p>              
        <p>
            <label for=""><?php echo __("CF_about_au")?>:</label><br />
            <?php
                if ( ! isset($_POST['about']))
                {
                    $something = FALSE;
                }
                else
                {
                    $something = $_POST['about'];
                }
                $data = array('name' => 'about',
                'id' => 'about',
                'width' => '600',
                'height' => '400',
                'value'=>$something);
                echo form_textarea($data);
            ?>
        </p>
        <p>
            <label for="description"><?php echo __("CF_blog_body")?>:</label><br />
            <?php
                echo form_error('txtBody');
                if ( ! isset($_POST['txtBody']))
                {
                    $something = FALSE;
                }
                else
                {
                    $something = $_POST['txtBody'];
                }
                $data = array('name' => 'txtBody',
                'id' => 'txtBody',
                'width' => '600',
                'height' => '400',
                'value'=> $something);
                echo form_fckeditor($data);
            ?>
        </p>
        <br />
        <br />
        <br />
        <p>
            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_add_new_blog")?>" />
            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
        </p>
    </form>
      </div>   
   