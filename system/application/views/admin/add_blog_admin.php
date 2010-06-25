      <!-- /.content_item -->
      <div class="content_item">
        <h3>Add New Blog</h3>
        <form action="" method="post" enctype="multipart/form-data" class="global" name="blog">
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
            <label for="title">Title:</label>
            <?php echo form_error('txtTitle');?>
            <input name="txtTitle" type="text" id="txtTitle" value="<?php if(isset($_POST['txtTitle'])){ echo $_POST['txtTitle'] ;}?>" class="short"/>
          </p>
          <p>
            <label for="subject">Subject:</label>
            <?php
                                    echo form_error('txtSubject');?>
            <input name="txtSubject" type="text" id="txtSubject" value="<?php if(isset($_POST['txtSubject'])){ echo $_POST['txtSubject'] ;}?>" class="short"/>
          </p>
          <p>
            <label for="keywords">Keywords:</label>
            <?php
                                    echo form_error('txtKeywords');?>
            <input name="txtKeywords" type="text" class="short" id="txtKeywords" value="<?php if(isset($_POST['txtKeywords'])){ echo $_POST['txtKeywords'] ;}?>"/>
          </p>
                    <p>
            <label for="">About The Author:</label><br />
            <textarea rows="8" id="about" cols="" name="about" value="<?php if(isset($_POST['about'])){ echo $_POST['about'] ;}?>" ></textarea>
          </p>
          <p>
            <label for="description">Body:</label><br />
            <?php
									echo form_error('txtBody');
                                    if ( ! isset($_POST['something']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['something'];
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
            <input name="btnsubmit" type="submit" class="submit" value="Add new blog" />
            <input name="btnreset" type="reset" class="reset" value="Reset" />
          </p>
        </form>
      </div>   
   