<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<h3><?php echo __("CF_accessories")?></h3>
            <form name="form" id="form" class="short">
              <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" >
                <option value=""><?php echo __('CF_select')?></option>
                <?php foreach($query_all as $row){
                    $ElementName_menu = $row['ElementName'];
                    $Code_menu = $row['Code'];    
                    $Lang_menu = $row['Lang'];    
                    ?>
                <option value="<?php echo site_url('admin/get_element/'.$Code_menu.'/'.$Lang_menu)?>"><?php echo $ElementName_menu?></option>
                <?php }?>
              </select>
            </form>
<ul class="link_conttrol">
         <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/'.$type_source.'/1')?>"><?php echo __("CF_edit_editable_meta")?></a></li>
    </ul>
<p>&nbsp;    </p>

<div class="content_item">                 
    <form id="contactform" action="<?php echo site_url("admin/update_element/".$Code.'/'.$Lang_temp)?>" method="post" enctype="multipart/form-data" class="global">                   
        <p>
            <?php echo form_error('Elementname');?>
            <label><?php echo __("CF_element_name")?></label> : <input type="text" class="medium" name="Elementname" id="Elementname" value="<?php echo $page_title ?>" /> <input type="hidden" class="medium" name="ID" id="ID" value="<?php echo $ID ?>" />
            <p></p>    
            <?php echo form_error('ElementContent');?>                    
            <label for="description"><?php echo __("CF_blog_body")?>:</label><br />
            <?php
                $data = array('name' => 'ElementContent',
                'id' => 'ElementContent',
                'width' => '600',
                'height' => '400',
                'value'=>$elementContent);
                echo form_fckeditor($data);
            ?>                   
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="<?php echo __("CF_submit")?>"onclick="return confirm('<?php echo __("CF_mess_update")?>')" />                       
        </p>

    </form>    
</div>
