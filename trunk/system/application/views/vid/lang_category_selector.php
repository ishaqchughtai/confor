<?php
	$selected_cate = isset($video_cate)?$video_cate:1; 
	
	$selected_cate_setting = array(
		'en'=>	array(
			'table_name' => 'tblcategory',
			'key_field' => 'ID',
			'value_field' => 'Name',
			'where' => array('lang'=>'en')
		),
		'fr'=>	array(
			'table_name' => 'tblcategory',
			'key_field' => 'ID',
			'value_field' => 'Name',
			'where' => array('lang'=>'fr')
		)		
	);
	
	$content_fr = str_replace(array("\r\n", "\r", "\n"), "",form_dropdown('video_cate', dropdown_data($selected_cate_setting['fr']),0, 'id="vid_cate" class="short"'));
	$content_en = str_replace(array("\r\n", "\r", "\n"), "",form_dropdown('video_cate', dropdown_data($selected_cate_setting['en']),0, 'id="vid_cate" class="short"'));
?>
<script>
	var content_fr = '<?php echo $content_fr;?>';
	var content_en = '<?php echo $content_en;?>';
	function reset_cate_by_lang(lg)
	{
		if (lg=='fr')
		{
			$("#cate_select").html(content_fr);			
		}
		else
		{
			$("#cate_select").html(content_en);
		}
	}

    $(function(){        
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();	
				reset_cate_by_lang(lg);
            });	
        });	
    });		

</script>

<div class="input text">
	<label><?php echo __("CF_dis_lang")?></label>
	<?php choose_your_language($lg);?>
</div>								

<p>
<label><?php echo __("CF_cate_vid")?></label>
	<div id="cate_select">
	<?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting[$lg]),$selected_cate, 'id="vid_cate" class="short"');?>
	</div>
</p>