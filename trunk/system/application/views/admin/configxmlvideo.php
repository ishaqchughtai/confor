<?php
    foreach($query as $row)
    {
        $id=$row['id'];
        $watermark_resource=$row['watermark_resource'];
        $controls_show=$row['controls_show'];
        $controls_hd=$row['controls_hd'];
        $fullscreen_resizable=$row['fullscreen_resizable'];
        $fullscreen_hideCursor=$row['fullscreen_hideCursor'];
        $style_global=$row['style_global'];
        $embed=$row['embed'];
    }
?>
<?php echo form_open('xmlvideo/update_setting/'.$id); ?>
<div class="x2 frame">       
    <h3><?php echo __("CF_player_vid_set")?></h3>        
    <div class="frame_content">                                                 
        <label><?php echo __("CF_show_control")?>:</label>
        <select name="controls_show" class="medium">
            <option value="always" <?php if($controls_show=='always') echo 'selected="selected"';?>><?php echo __("CF_always")?></option>
            <option value="never" <?php if($controls_show=='never') echo 'selected="selected"';?>><?php echo __("CF_never")?></option>
            <option value="over" <?php if($controls_show=='over') echo 'selected="selected"';?>><?php echo __("CF_over")?></option>
        </select>
        <label><?php echo __("CF_show_control_hd")?>:</label>
        <select name="controls_hd" class="medium">
            <option value="true" <?php if($controls_hd=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($controls_hd=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
        <label><?php echo __("CF_full_res")?>:</label>
        <select name="fullscreen_resizable" class="medium">
            <option value="true" <?php if($fullscreen_resizable=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($fullscreen_resizable=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
    </div>                    
</div>

<div class="x2 frame no_margin">    
    <h3><?php echo __("CF_player_vid_set")?></h3>
    <div class="frame_content">
        <label><?php echo __("CF_hide_cur")?>:(<?php echo __("CF_seconds")?>)</label>
        <input name="fullscreen_hideCursor" type="text" align="left" value="<?php echo $fullscreen_hideCursor?>" class="medium">
        <?php echo form_error("fullscreen_hideCursor"); ?>
        <label><?php echo __("CF_sty_glo")?>:</label>
        <select name="style_global" class="medium">
            <option value="light" <?php if($style_global=='light') echo 'selected="selected"';?>><?php echo __("CF_light")?></option>
            <option value="dark" <?php if($style_global=='dark') echo 'selected="selected"';?>><?php echo __("CF_dark")?></option>
        </select>
        <label><?php echo __("CF_embed_show")?>:</label>
        <select name="embed" class="medium">
            <option value="true" <?php if($embed=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($embed=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>        
    </div>
</div>
<p>&nbsp;</p>
<input type="submit" class="submit" name="update" value="<?php echo __("CF_update")?>">
<?php form_close();?>
<div class="divider"></div>
