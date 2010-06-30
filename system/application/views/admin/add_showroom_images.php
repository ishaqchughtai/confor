<script type="text/javascript">
    <!--
    function MM_jumpMenu(targ,selObj,restore){ //v3.0
        eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
        if (restore) selObj.selectedIndex=0;
    }
    //-->
</script>
<div class="content_item">
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>
    <h3><?php echo __("CF_add_showroom")?></h3>

    <form action="" method="post" enctype="multipart/form-data" name="showroom">
        <p>                
            <label for="title"><?php echo __("CF_one_speaker")?>:</label>
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
            <label for="title"><?php echo __("CF_vid")?>:</label>
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
            <label><?php echo __("CF_blog_thum")?> :</label>
        <input name="txtLink" type="text" id="txtLink" value="<?php if(isset($_POST['txtLink'])){ echo $_POST['txtLink'] ;}?>" class="short"  readonly="true"/>
        <p>
            <input type="submit" value="upload" class="submit" name="uploadvideo" onclick="window.open('<?php echo site_url('showroom/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" />
        </p>
        </p>
        <p>
            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_submit")?>" />
            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />

        </p>
    </form>

</div>
                <!-- /.content_item -->