<script type="text/javascript">
    $(function(){
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#lg option:selected').val();				
                gogo = XEMMEX.baseUrl + "event/event_list/" + lg +"/10";	
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>				
	<?php $page = 10;?>          
    <div id="content">
       	<ul class="link_conttrol">
        <li><a class="icon_add" href="<?php echo site_url('event/add_event')?>"><?php echo __("CF_admin_new_event")?></a></li>
    </ul>
    <br />
        <h3><?php echo __("CF_list_event")?></h3><br />
<div class="input text">
		<label><?php echo __("CF_dis_lang")?></label>		
		<?php choose_your_language($lg);?>
	</div>
        <table border="1" width="100%">
            <tr align="left">
                <th width="135"><?php echo __("CF_date")?></th>
                <th width="180"><?php echo __("CF_user_name")?></th>
                <th width="284"><?php echo __("CF_title")?></th>
                <th width="201"><?php echo __("CF_subject")?></th>                
                <th width="26"><?php echo mb_strtoupper(__("CF_status"))?> </th>
                <th width="26" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
            <?php foreach($query as $row):?>
            <?php 					
						$title = $row['Title'];
						$subject = $row['Subject'];
						$description = $row['Description'];					
			?>
                <tr>
                    <td><?php echo date("d-m-Y", strtotime($row['Date']))?></td>
                    <td><?php echo $row['username']?></td>     
                    <td><a href="<?php echo site_url('event_frontend/event_content/'.$row['ID'])?>" target="_blank"><?php echo $title?></a></td>                   
                    
                    <td><?php echo $subject?></td>                   
                    <td><?php if((int)$row['Status']=='0'){echo __("CF_shop_deac");}else{echo __("CF_shop_ac");} ?></td>
                    <td width="26"><a href="<?php echo site_url('event/get_event_admin'.'/'.$row['ID'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td> 
                    <td width="29"><a href="<?php echo site_url('event/delete_event_admin'.'/'.$row['ID'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
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
   
				