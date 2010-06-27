<!-- /.content_item -->
<?php require_once "phpuploader/include_phpuploader.php" ?>
<script type="text/javascript">
    function doStart()
    {
        var uploadobj = document.getElementById('myuploader');
        if (uploadobj.getqueuecount() > 0)
            {
            uploadobj.startupload();
        }
        else
            {
            alert("Please browse files for upload");
        }
    }
</script>
<div class="content_item">
    <h3>Add New Blog</h3>
    <form method="post" id="blog_upload">
            <?php echo form_error('txtLink'); ?>
        <?php                
        $FileNameImage = '';
            $uploader=new PhpUploader();
            $uploader->MaxSizeKB=10240;
            $uploader->Name="myuploader";
            $uploader->InsertText="Select multiple files (Max 10M)";
            $uploader->AllowedFileExtensions="*.jpg,*.png,*.gif,*.txt,*.zip,*.rar,*.avi";  
            $uploader->SaveDirectory="upload";   
            //$uploader->MultipleFilesUpload=true;
            //$uploader->ManualStartUpload=true;
            $uploader->Render();
        ?>
<?php

$files=array();

$processedlist=@$_POST["processedlist"];
if($processedlist)
{
    $guidlist=explode("/",$processedlist);
    foreach($guidlist as $fileguid)
    {
        $mvcfile=$uploader->GetUploadedFile($fileguid);
        if($mvcfile)
        {
            array_push($files,$mvcfile);
        }
    }
} 
$fileguidlist=@$_POST["myuploader"];
if($fileguidlist)
{
    $guidlist=explode("/",$fileguidlist);
    foreach($guidlist as $fileguid)
    {
        $mvcfile=$uploader->GetUploadedFile($fileguid);
        if($mvcfile)
        {
            //Process the file here..
            //rename(..)
            
            if($processedlist)
                $processedlist= $processedlist . "/" . $fileguid;
            else
                $processedlist= $fileguid;
        
            array_push($files,$mvcfile);
        }
    }
}

if(count($files)>0)
{
   //$FileNameImage ='';
//    echo("<table style='border-collapse: collapse' class='Grid' border='0' cellspacing='0' cellpadding='2'>");
    foreach($files as $mvcfile)
    {
        $FileNameImage = $mvcfile->FileName;
//        echo("<tr>");
//        echo("<td>");echo("<img src='phpuploader/resources/circle.png' border='0' />");echo("</td>");
//        echo("<td>");echo($mvcfile->FileName);echo("</td>");
//        echo("<td>");echo($mvcfile->FileSize);echo("</td>");
//        echo("</tr>");       
        //Moves the uploaded file to a new location.
        //$mvcfile->MoveTo("/uploads");
        //Copys the uploaded file to a new location.
        //$mvcfile->CopyTo("/uploads");
        //Deletes this instance.
        //$mvcfile->Delete();
    }
//    echo("</table>");
}
         
?>  
    </form> <input type="text" name="link" id="link" value="<?php echo $FileNameImage?>"> 
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
         
 
        <input name="txtLink" type="text" id="txtLink" value="<?php if(isset($_POST[$FileNameImage])){ echo $_POST[$FileNameImage] ;}?>" class="short"  readonly="true"/>
        <p>


            <br /><br /><br />
               
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
            <br /><label>*Keywords Max 4 words and are separated by spaces. </label>
            <?php
                echo form_error('txtKeywords');?>
            <input name="txtKeywords" type="text" class="short" id="txtKeywords" value="<?php if(isset($_POST['txtKeywords'])){ echo $_POST['txtKeywords'] ;}?>"/>

        </p>              
        <p>
            <label for="">About The Author:</label><br />
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
            <label for="description">Body:</label><br />
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
            <input name="btnsubmit" type="submit" class="submit" value="Add new blog" />
            <input name="btnreset" type="reset" class="reset" value="Reset" />
        </p>
    </form>
      </div>   
   