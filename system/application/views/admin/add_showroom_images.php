<script type="text/javascript">
    <!--
    function MM_jumpMenu(targ,selObj,restore){ //v3.0
        eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
        if (restore) selObj.selectedIndex=0;
    }
    //-->
</script>
<div class="content_item">

    <h3>Add New Showroom Image</h3>

    <form action="" method="post" enctype="multipart/form-data" name="showroom">
        <p>                
            <label for="title">Speaker:</label>
            <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="short">
                <?php foreach($query_speaker as $row){
                        $id = $row['id'];
                        $name = $row['name'];  
                    ?>             
                    <option value="<?php echo site_url('showroom/add_new_images_for_speaker/'.$id);?>"><?php echo $name;?></option>
                    <?php }?> 
            </select>                        
        </p>

        <p>
            <label for="title">Video:</label>
            <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" class="short">  
                <?php foreach($query_video as $row){
                        $id_video = $row['vid_id'];
                        $title = $row['title'];  
                    ?>
                    <option value="<?php echo site_url('showroom/submit_add_new_images/'.$id_video);?>" ><?php echo $title?></option>
                    <?php }?>
            </select>
        </p>                        
        <p>
            <label>Image thumbnail :</label>
            <?php echo form_error('txtLink'); ?>
            <input type="file" name="txtLink" size="20" />
        </p>
        <p>                       
            <input name="btnsubmit" type="submit" class="submit" value="Submit" />
            <input name="btnreset" type="reset" class="reset" value="Reset" />

        </p>
    </form>

</div>
                <!-- /.content_item -->