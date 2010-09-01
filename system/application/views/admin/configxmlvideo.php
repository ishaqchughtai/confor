<?php
    foreach($query as $row)
    {
        $id=$row['id'];
        $watermark_resource=$row['watermark_resource'];
        $watermark_align_top=$row['watermark_align_top'];
        $watermark_align_rl=$row['watermark_align_rl'];
        $controls_show=$row['controls_show'];
        $controls_hd=$row['controls_hd'];
        $fullscreen_resizable=$row['fullscreen_resizable'];
        $fullscreen_hideCursor=$row['fullscreen_hideCursor'];
        $style_global=$row['style_global'];
        $embed=$row['embed'];
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
    }
?>
<?php echo form_open('xmlvideo/update_setting/'.$id); ?>
<div class="x2 frame">       
    <h3><?php echo 'Player Video Setting'?></h3>        
    <div class="frame_content">                                                 
        <label>Control:</label>
        <select name="controls_show" class="medium">
            <option value="always" <?php if($controls_show=='always') echo 'selected="selected"';?>>Always</option>
            <option value="never" <?php if($controls_show=='never') echo 'selected="selected"';?>>Never</option>
            <option value="over" <?php if($controls_show=='over') echo 'selected="selected"';?>>Over</option>
        </select>
        <label>Control HD:</label>
        <select name="controls_hd" class="medium">
            <option value="true" <?php if($controls_hd=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($controls_hd=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
        <label>Fullscreen Resizable:</label>
        <select name="fullscreen_resizable" class="medium">
            <option value="true" <?php if($fullscreen_resizable=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($fullscreen_resizable=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
        <label>Hide Cursor:</label>
        <input name="fullscreen_hideCursor" type="text" align="left" value="<?php echo $fullscreen_hideCursor?>" class="medium">
        <?php echo form_error("fullscreen_hideCursor"); ?>
        <label>Style Global:</label>
        <select name="style_global" class="medium">
            <option value="light" <?php if($style_global=='light') echo 'selected="selected"';?>>Light</option>
            <option value="dark" <?php if($style_global=='dark') echo 'selected="selected"';?>>Dark</option>
        </select>
        <label>Embed Show:</label>
        <select name="embed" class="medium">
            <option value="true" <?php if($embed=='true') echo 'selected="selected"';?>><?php echo __("CF_yes")?></option>
            <option value="false" <?php if($embed=='false') echo 'selected="selected"';?>><?php echo __("CF_No")?></option>
        </select>
    </div>                    
</div>

<div class="x2 frame no_margin">    
    <h3><?php echo 'Player Video Setting'?></h3>
    <div class="frame_content">
        <label>Logo:</label>
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
    </div>
</div>
<p>&nbsp;</p>
<input type="submit" class="submit" name="update" value="<?php echo __("CF_update")?>">
<?php form_close();?>
<div class="divider"></div>
