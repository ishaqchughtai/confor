<script type="text/javascript">
    $(function(){
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#lg option:selected').val();				
                gogo = XEMMEX.baseUrl + "manage_event/your_event/" + lg +"/10";	
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>
<?php $page = 10;?>
<br /> 
    <div id="content">
       	<ul class="link_conttrol">
        <li><a class="icon_add" href="<?php echo site_url('manage_event/add')?>"><?php echo __("CF_admin_new_event")?></a></li>
    </ul>
    <br />
        <h3><?php echo __("CF_list_event")?></h3><br /><br/>
        
        <div class="input text">
		<label>Display language</label>		
		<?php choose_your_language($lg);?>
	</div>
        <table border="1" width="1000px">
            <tr align="left">
                <th width="208"><?php echo __("CF_date")?></th>
                <th width="292"><?php echo __("CF_title")?></th>
                <th width="158"><?php echo __("CF_subject")?></th>
                <th width="268"><?php echo __("CF_key")?></th>
                <th width="17" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
            <?php foreach($your_event as $row):?>
            <?php 
											
						$title = $row['Title'];
						$subject = $row['Subject'];
						$description = $row['Description'];					
			?>
            <?php $keyword = explode(" ", $row['Keywords']); ?>
                <tr>
                    <td><?php echo date("F jS Y", strtotime($row['Date']))?></td>     
                    <td><a href="<?php echo site_url('event_frontend/event_content/'.$row['ID'])?>" target="_blank"><?php echo $title?></a></td>                   
                    
                    <td><?php echo $subject?></td>
                    <td>
					<?php for($i=0;$i<count($keyword);$i++){?>
                      <?php echo $keyword[$i]?>
                      <?php if ($i<count($keyword)-1) echo ','?>
                      <?php ;}?>
                    </td>                    
                    <td width="17"><a href="<?php echo site_url('manage_event/get_event'.'/'.$row['Speaker'].'/'.$row['ID'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td> 
                    <td width="17"><a href="<?php echo site_url('manage_event/delete_event'.'/'.$row['Speaker'].'/'.$row['ID'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
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
   
				

