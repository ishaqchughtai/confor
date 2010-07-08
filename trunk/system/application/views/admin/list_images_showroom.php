<div class="">
        <h3><?php echo __("CF_showroom_menu")?></h3>
        <?php $this->load->view("admin/admin_menu_showroom");?>
        <p>&nbsp;    </p>
    <h4><?php echo __("CF_ad_menu_showroom")?></h4>

    <table border="0" cellpadding="0" cellspacing="1" style="width:100%">
        <tr>
            <th width="65"><?php echo __("CF_action")?></th>            
            <th width="85"><?php echo __("CF_pre")?></th>    
            <th width="150"><?php echo __("CF_title")?></th> 
            <th width="110"><?php echo __("CF_one_speaker")?></th>              
            <th width="30"><?php echo __("CF_viewed")?></th>    
            <th width="30"><?php echo __("CF_show")?></th>    
        </tr>
        <?php foreach($query as $row){                               
        $id = $row['ID'];
        $video = $row['Video'];
        $images = $row['SpeakerImages'];
        $video_title=$row['title'];
        $author_video=$row['name'];
        $viewed=$row['viewed'];
        $show=$row['Show'];
        if($show==1)
        {
            $showtext= __("CF_yes");
        }else
        {
            $showtext=__("CF_No"); 
        }
        ?>
            <tr>
                <td>&nbsp;<a href="<?php echo site_url('showroom/edit_image/'.$row['ID'])?>"><?php echo __("CF_edit")?></a>&nbsp;|&nbsp;<a href="<?php echo site_url('showroom/delete_image/'.$row['ID'])?>" onclick="javascript:return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo ucfirst(__("CF_del"))?></a>&nbsp;</td>
                <td><img src="<?php echo base_url().'assets/uploads/image/'.$images;?>" width="81" height="52" alt=""> </td>
                <td align="center"><?php echo $video_title ?></td>
                <td><?php echo $author_video?></td>                   
                <td align="center"><?php echo $viewed?></td>
                <td align="center"><?php echo $showtext?></td>
            </tr>

            <?php } ?>
    </table>
    <p/>


    <div class="divider"></div>


            </div>
       