<?php
    $selected_cate = isset($video_cate)?$video_cate:0; 
    $selected_cate_setting = array
    (
		'table_name' => 'tblcategory',
		'key_field' => 'ID',
		'value_field' => 'Name',
		'init_data' => array('key'=>0,'name'=>'(all)'),
		'where' => array('lang' => $lg)
    );	
?>

<script type="text/javascript">
    $(function(){
        $('#vid_cate').change(function()
        {
            $('#vid_cate :selected').each(function(i, selected){ 		
				var lg = $('#lg option:selected').val();				
				var cate = $(selected).val();
                gogo = XEMMEX.baseUrl + "vspeaker/list_video_conference/" + lg +"/" + cate;	
                window.location = gogo;			
            });	
        });
        
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#vid_cate option:selected').val();				
                gogo = XEMMEX.baseUrl + "vspeaker/list_video_conference/" + lg + "/" + cate;
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>
<div class="">
    <h3><?php echo __("CF_vid_conf")?></h3>
    <?php $this->load->view("vspeaker/sub_menu");?>				
    <p>&nbsp;	</p>
    <h3><?php echo __("CF_admin_vid_list")?> (<?php echo lang_name_by_short_key($lg)?>)</h3>

	<div class="input text">
		<label><?php echo __("CF_dis_lang")?></label>		
		<?php choose_your_language($lg);?>
	</div>	
	
    <label><?php echo __("CF_cate_vid")?></label>
    <?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>	

    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="65"><?php echo __("CF_action")?></th>	        
            <th width="85"><?php echo __("CF_pre")?></th>	
            <th width="90"><?php echo __("CF_date")?></th>
			<th width="150"><?php echo __("CF_title")?></th>   
			<th><?php echo __("CF_des")?></th>  
			<th width="10"><?php echo __("CF_approved")?></th>  			
            <th width="30"><?php echo __("CF_viewed")?></th>
        </tr>
        <?php foreach ($videos as $row):?>
        <?php             
            $preview_img=base_url().thumbs.'/'.$row['shash'];
            $upload_date=mdate("%d-%m-%Y", $row['date']);
			$appr = ($row['approved']==1)?__("CF_yes"):__("CF_No");
        ?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('vspeaker/edit_video_conference/'.$row['vid_id'])?>"><?php echo __("CF_edit")?></a>&nbsp;|&nbsp;<a href="<?php echo site_url('vspeaker/delete_video_conference/'.$row['vid_id'])?>" onclick="javascript:return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo ucfirst(__("CF_del"))?></a>&nbsp;</td>
                <td><img src="<?php echo $preview_img?>" width="81" height="52" alt=""> </td>
                <td align="center"><?php echo $upload_date ?></td>                
				<td><?php echo $row['title']?></td>                	
				<td><?php echo word_limiter($row['description'],15)?></td>
				<td align="center"><?php echo $appr?></td> 
                <td align="center"><?php echo $row['viewed']?></td>
            </tr>

            <?php endforeach ?>
        <tr>
            <td colspan="8" height="50" valign="midle">				
                <ul id="pagination">
                    <?php echo $pagination?>
                </ul>
            </td>
        </tr>

    </table>
    <p/>


    


            </div>
       