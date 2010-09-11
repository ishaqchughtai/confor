<?php
    $this->load->view('admin/speaker_selector');

    if(isset($row)):
        $id=$row->vid_id;
        $title=$row->title;							
        $selected_cate = $row->category;
        $keywords=$row->tags;
        $description=$row->description;							
        $appr = $row->approved;	
        $speaker_id = $row->mem_id;
        $speaker_name = $row->username . '('.$row->name.')';
        $lg = $row->lang;
        $watermark_align_top=$row->watermark_align_top;
        $watermark_align_rl=$row->watermark_align_rl;
        $vt=0;    
        if($watermark_align_top=='top')
        {
            if($watermark_align_rl=='left')
            {
                $vt=11;    
            }elseif($watermark_align_rl=='right')
            {
                $vt=12;   
            }
        }elseif($watermark_align_top=='bottom')
        {
            if($watermark_align_rl=='left')
            {
                $vt=21;    
            }elseif($watermark_align_rl=='right')
            {
                $vt=22;   
            }    
        }		
    ?>   
    <div class="x2">
        <h3><?php echo __("CF_vid_conf")?></h3>
        <?php $this->load->view("vid/menu_video_admin",array("lg"=>$lg));?>
        <ul class="link_conttrol">
            <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/video/'.$id)?>"><?php echo __("CF_edit_video_meta")?></a></li>
        </ul>
        <br />
        <h3> <?php echo __("CF_vid_update")?> </h3>
        <?php echo form_open('vid/edit_video_conference/'.$id);?> 
        <?php $this->load->view('vid/lang_category_selector',array("video_cate"=>$selected_cate));?>

        <p>
            <input id="speaker_id" type="hidden" name="speaker" value="<?php echo $speaker_id?>"/>
            <label for="title"><?php echo __("CF_one_speaker")?>:</label>
            <input id="speaker_email" name="speaker_email" class="short" type="text" value="<?php echo $speaker_name?>"/>					
        </p>					

        <p>
            <label for="title"><?php echo __("CF_title")?>:</label>
            <input type="text" class="medium" name="title" id="title" value="<?php echo $title ?>" />
            <?php echo form_error('title')?>
        </p>          					       

        <p>
            <label for="keywords"><?php echo __("CF_key")?>:</label>
            <input type="text" class="medium" name="keywords" id="keywords" value="<?php echo $keywords ?>" />
            <?php echo form_error('keywords')?>
        </p>

        <p>
        <label for="description"><?php echo __("CF_des")?>:</label>
        <p>
            <?php                       
                $data = array('name' => 'description',
                'id' => 'description',
                'width' => '600',
                'height' => '400',
                'value'=> $description);

                echo form_fckeditor($data);
                echo form_error('description');
            ?>
        </p>
        </p>

        <p>
            <label for="approved"><?php echo __("CF_approved")?>:</label>
        </p>					
        <select name="approved" class="short">
            <option value="1" <?php if($appr==1) echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="0" <?php if($appr==0) echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>					
        <label><?php echo __("CF_logo")?>:</label>
        <table width="202" height="130" border="0" bgcolor="#0000FF">
            <tr>
                <td width="101" height="65"><input type="radio" name="radio" id="radio2" value="11" <?php if($vt==11)echo 'checked="checked"'?> style="background: white; border: hidden;"  /></td>
                <td width="101" height="65"><input type="radio" name="radio" id="radio" value="12" <?php if($vt==12)echo 'checked="checked"'?> style="background: white; border: hidden;"/></td> 
            </tr>
            <tr>
                <td width="101" height="65"><input type="radio" name="radio" id="radio3" value="21" <?php if($vt==21)echo 'checked="checked"'?> style="background: white; border: hidden;" /></td>
                <td width="101" height="65"><input type="radio" name="radio" id="radio" value="22" <?php if($vt==22)echo 'checked="checked"'?> style="background: white; border: hidden;" /></td>
            </tr>
        </table>
        <br />
        <p>
            <label for="name"></label><input type="submit" name="submit" class="submit" value="<?php echo __("CF_update")?>" />
        </p>

        <?php echo form_close();?>

    </div>
    <!-- /.x2 - represents a half windows size div -->
    <!-- /.x2 - represents a half windows size div -->
    <!--                  -->
    <!-- END OF .x2 CLASS -->
    <!--                  -->
    <div class="divider"></div>
    <!-- /.divider -->
    <!-- /.x4 - represents a fourth windows size div -->
    <?php endif;?>
           
           