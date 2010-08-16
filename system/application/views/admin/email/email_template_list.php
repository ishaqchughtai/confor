<script type="text/javascript">
    $(function(){        
        $('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){                           
                var lg = $(selected).val();                
                gogo = XEMMEX.baseUrl + "email/template_list/" + lg;
                window.location = gogo;            
            });    
        });    
    });    
    //-->
</script>

    <h3><?php echo __("CF_email_tem")?> (<?php echo lang_name_by_short_key($lg)?>)</h3>

    <div class="input text">
        <label><?php echo __("CF_dis_lang")?></label>        
        <?php choose_your_language($lg);?>
    </div>    
    
    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="40"><?php echo __("CF_action")?></th>            
            <th><?php echo __("CF_email_tem_name")?></th>    
        </tr>
        <?php foreach ($email_templates as $row):?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('email/template_edit/'.$row['id'])?>"><?php echo __("CF_edit")?></a></td>
                <td><?php echo $row['name']?></td>
            </tr>
        <?php endforeach ?>
    </table>    
    
<div class="divider"></div>    