<div class="">
    <h3><?php echo __("CF_showroom_menu")?></h3>
    <?php $this->load->view("admin/admin_menu_showroom");?>
    <p>&nbsp;    </p>
    <h4><?php echo __("CF_edit_showroom")?></h4>
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>
    <?php if($query_image->num_rows()>0){
            $row=$query_image->row();                               
            $id = $row->ID;
            $video = $row->Video;
            $images = $row->SpeakerImages;
            $vid_title=$row->title ;
            $speaker=$row->name ;
            $viewed=$row->viewed ;
            $show=$row->Show ;
    }?>
    <form action="" method="post" enctype="multipart/form-data" name="editshowroom">        
        <p>
            <label for="title"><?php echo __("CF_one_speaker")?>:</label>
            <input id="speaker_email" name="speaker_email" class="short" type="text" value="<?php echo $speaker;?>"readonly="true"/>
        </p>

        <p>
            <label for="title"><?php echo __("CF_vid_from_speaker")?>:</label>
            <input id="vid_title" name="vid_title" class="short" type="text" value="<?php if (isset($vid_title)) echo $vid_title?>"readonly="true"/>            
        </p>        

        <p>
            <label><?php echo __("CF_blog_thum")?>:</label>
            <input name="txtLink" type="text" id="txtLink" value="<?php if (isset($images)) echo $images?>" class="short"  readonly="true"/>            
        </p>
        <p><?php echo form_error('txtLink')?><input value="<?php echo __("CF_up")?>"  type="button" class="submit" name="upload" onclick="window.open('<?php echo site_url('showroom/do_upload')?>','_blank','height=150,width=300,top=350, left=400')" /></p>
        <br />
        <p>&nbsp;    </p>
        <p>
        <select name="show" class="short">
            <option value="1" <?php if($show==1) echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="0" <?php if($show==0) echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
        </p>
        <p>
            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_submit")?>" />
            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
        </p>
    </form>

</div>
<!-- /.content_item -->