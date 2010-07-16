<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
            <form name="form" id="form" class="short">
              <select name="jumpMenu" id="jumpMenu" onchange="MM_jumpMenu('parent',this,0)" >
                <option value=""><?php echo __('CF_select')?></option>
                <option value="<?php echo site_url('admin/get_element/About')?>"><?php echo __("CF_about_us")?> (English)</option>
                <option value="<?php echo site_url('admin/get_element/About_fr')?>"><?php echo __("CF_about_us")?> (French)</option>
                <option value="<?php echo site_url('admin/get_element/How')?>"><?php echo __("CF_how")?> (English)</option>
                <option value="<?php echo site_url('admin/get_element/How_fr')?>"><?php echo __("CF_how")?> (French)</option>
                <option value="<?php echo site_url('admin/get_element/Rules')?>"><?php echo __("CF_rules")?> (English)</option>
                <option value="<?php echo site_url('admin/get_element/Rules_fr')?>"><?php echo __("CF_rules")?> (French)</option>
              </select>
            </form>           

