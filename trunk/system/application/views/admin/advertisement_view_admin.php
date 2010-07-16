<?php $page = 5;?>          
    <div id="content">
       	<ul class="link_conttrol">
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_add_new_adv")?></a></li>
    </ul>
    <br />
        <h3><?php echo __("CF_list_event")?></h3><br />
        <table border="1" width="100%">
            <tr align="left">
                <th width="85"><?php echo __("CF_pre")?></th>
                <th width="150"><?php echo __("CF_adv_date_begin")?></th>
                <th width="150"><?php echo __("CF_adv_date_ex")?></th>
                <th width="83"><?php echo __("CF_advertisement_name")?></th>
                <th width="74"><?php echo __("CF_advertisement_email")?></th>
                <th width="130"><?php echo __("CF_url")?></th>
                <th width="153"><?php echo __("CF_text_tips")?></th>
                <th width="17" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
            <?php foreach($query as $row):?>
            <?php 					
						$id = $row['ID'];
						$date_beginning = date("M jS Y", strtotime($row['DateBeginning']));
						$date_expiry = date("M jS Y", strtotime($row['DateExpiry']));
						$advertiser_name = $row['AdvertiserName'];
						$advertiser_email = $row['AdvertiserEmail'];
						$url = $row['URL'];
						$text_tips = $row['TextTips'];                           
						$image_link = $row['ImageLink']; 					
			?>
                <tr>
                    <td><img src="<?php echo base_url().'assets/uploads/image/'.$image_link ?>" width="81" height="81" />                    </td>
                    <td><?php echo $date_beginning?></td>
                    <td><?php echo $date_expiry?></td>     
                    <td><?php echo $advertiser_name?></td>
                    <td><?php echo $advertiser_email?></td>
                    <td><?php echo $url?></td>
                    <td><?php echo _substr($text_tips,100)?></td>
                    <td width="17"><a href="<?php echo site_url('advertisement/get_advertisement'.'/'.$id)?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td> 
                  <td width="18"><a href="<?php echo site_url('advertisement/delete'.'/'.$id)?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
                </tr>
                <?php endforeach;?>
        </table>
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->
        <div>
            <ul id="pagination">
                    <li><?php echo $pagination?></li>
                </ul>
        </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
    
