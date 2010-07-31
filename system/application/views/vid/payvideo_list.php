<div class="">    
    <?php $this->load->view("vid/payvideo_menu");?>
    <h3><?php echo __("CF_pay_vid_list")?></h3>
    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="65"><?php echo __("CF_action")?></th>	        
            <th width="85"><?php echo __("CF_pre")?></th>	
            <th width="90"><?php echo __("CF_date")?></th>            
			<th width="150"><?php echo __("CF_title")?></th>   
			<th><?php echo __("CF_des")?></th>  
			<th width="60">Html</th> 
			<th width="10"><?php echo __("CF_approved")?></th>  			            
        </tr>
        <?php foreach ($videos as $row):?>
        <?php 
            $user_name=$row['first_name'].' '.$row['name'];
            $preview_img=base_url().thumbs.'/'.$row['shash'];
            $upload_date=mdate("%d-%m-%Y", $row['date']);
			$appr = ($row['approved']==1)?__("CF_yes"):__("CF_No");
        ?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('payvid/edit_payvideo/'.$row['vid_id'])?>"><?php echo __("CF_edit")?></a>&nbsp;|&nbsp;<a href="<?php echo site_url('payvid/delete_payvideo/'.$row['vid_id'])?>" onclick="javascript:return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo ucfirst(__("CF_del"))?></a>&nbsp;</td>
                <td><img src="<?php echo $preview_img?>" width="81" height="52" alt=""> </td>
                <td align="center"><?php echo $upload_date ?></td>
				<td><?php echo $row['title']?></td>
				<td><?php echo word_limiter($row['description'],15)?></td>
				<td>
				<a href="<?php echo site_url('payvid/html_out').'/'.$row['code']?>" target="_blank">view</a>&nbsp;|&nbsp;<a href="<?php echo site_url('payvid/save_as_html').'/'.$row['code']?>">save</a>
				</td>
				<td align="center"><?php echo $appr?></td>                 
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
    