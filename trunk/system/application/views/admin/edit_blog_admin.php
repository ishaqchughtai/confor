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
                                        $CountView = $row->CountView;}
                                ?>
        <form action="<?php echo site_url('blog/edit_blog_submit').'/'.$id?>" method="post" enctype="multipart/form-data" class="global" name="blog">
          <p>
            <label for="name">Your Name: <?php echo $this->session->userdata('admin')?></label>
          </p>
          <?php 
                                    $datestring = "%F %j%S %Y";
                                    $time = time();?>
          <p>
            <label for="date">Date: <?php echo mdate($datestring,$time);?> </label>
          </p>
          <p>
            <label>Image thumbnail :</label>
            <?php
                                    $data = array('name' => 'txtLink',
                                    'id' => 'txtLink',
                                    'class'=>'short',
                                    'readonly'=>'true',
                                    'value'=>$link);                                         
                                    echo form_input($data);
                                    echo form_error('txtLink'); ?>
          <p>
            <input type="button" value="upload" class="submit" name="uploadvideo" onclick="window.open('<?php echo site_url('blog/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" />
          </p>
          </p>
          <br />
          <br />
          <br />
          <p>
            <label for="title">Title:</label>
            <?php
                                        $data = array('name' => 'txtTitle',
                                        'id' => 'txtTitle',
                                        'class'=>'short',
                                        'value'=>$title);
                                        echo form_input($data);
                                        echo form_error('txtTitle');?>
          </p>
          <p>
            <label for="subject">Subject:</label>
            <?php
                                        $data = array('name' => 'txtSubject',
                                        'id' => 'txtSubject',
                                        'class'=>'short',
                                        'value'=>$subject);                                         
                                        echo form_input($data);
                                        echo form_error('txtSubject');?>
          </p>
          <p>
            <label for="keywords">Keywords:</label>
            <?php
                                        $data = array('name' => 'txtKeywords',
                                        'id' => 'txtKeywords',
                                        'class'=>'short',
                                        'value'=>$keywords);                                         
                                        echo form_input($data);
                                        echo form_error('txtKeywords');?>
          </p>
          <p>
            <label for="Body">Body:</label>
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
            <input name="btnSave" type="submit" class="submit" value="Save" />
            <input name="btnreset" type="reset" class="reset" value="Reset" />
          </p>
        </form>
      </div>   