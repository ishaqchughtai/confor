<?php
    $selected_cate = isset($video_cate)?$video_cate:0; // united kingdom
    $selected_cate_setting = array
    (
    'table_name' => 'tblcategory',
    'key_field' => 'ID',
    'value_field' => 'Name',
    'init_data' => array('key'=>0,'name'=>'(all)')
    );	
?>

<script type="text/javascript">
    $(function(){
        $('#vid_cate').change(function()
        {
            $('#vid_cate :selected').each(function(i, selected){ 		  
                gogo = XEMMEX.baseUrl + "admin/list_video_conference/" + $(selected).val() +"/3";			
                window.location = gogo;			
            });	
        });
    });	
    //-->
</script>
<div class="">
    <h3><?php echo __("CON_video_list")?></h3>
    <?php $this->load->view("admin/admin_menu_video");?>				
    <p>&nbsp;	</p>
    <h3><?php echo __("CON_list_view")?></h3>

    <label><?php echo __("CF_cate_vid")?></label>
    <?php echo  form_dropdown('video_cate', dropdown_data($selected_cate_setting),$selected_cate, 'id="vid_cate" class="short"');?>	

    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="65"><?php echo __("CF_action")?></th>	        
            <th width="85"><?php echo __("CF_pre")?></th>	
            <th width="157"><?php echo __("CF_date")?></th>
            <th><?php echo __("CF_title")?></th>
            <th width="157"><?php echo __("CF_user_name")?></th>
            <th width="40"><?php echo __("CF_viewed")?></th>	
        </tr>
        <?php foreach ($query as $row):?>
        <?php 
            $user_name=$row['Name'].' '.$row['first_name'];
            $preview_img=base_url().thumbs.'/'.$row['shash'];
            $upload_date=mdate("%Y-%m-%d", $row['date']);
        ?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('admin/edit_video_conference/'.$row['vid_id'])?>"><?php echo __("CF_edit")?></a>&nbsp;|&nbsp;<a href="<?php echo site_url('admin/delete_video_conference/'.$row['vid_id'])?>" onclick="javascript:return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo ucfirst(__("CF_del"))?></a>&nbsp;</td>
                <td><img src="<?php echo $preview_img?>" width="81" height="52" alt=""> </td>
                <td><?php echo $upload_date ?></td>
                <td><?php echo $row['title']?></td>
                <td><?php echo $user_name?></td>	
                <td><?php echo $row['viewed']?></td>
            </tr>

            <?php endforeach ?>
        <tr>
            <td colspan="6" height="50" valign="midle">				
                <ul id="pagination">
                    <?php echo $pagination?>
                </ul>
            </td>
        </tr>

    </table>
    <p/>


    <div class="divider"></div>


            </div>
       