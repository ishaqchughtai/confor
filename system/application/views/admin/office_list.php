<style>
	.up_button
	{
		width:16px;
		height:16px;
		display:block;
		float:left;
		margin-right:10px;
	}
</style>
<script type="text/javascript">
    $(function(){
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#lg option:selected').val();				
                gogo = XEMMEX.baseUrl + "conference_office/list_all/" + lg;
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>				
    <div id="content">
		<h3><?php echo __("CF_conference_office")?></h3>	
       	<ul class="link_conttrol">
        <li><a class="icon_add" href="<?php echo site_url('conference_office/add')?>"><?php echo __("CF_add_new_article")?></a></li>
    </ul>
    <br />
        <h3><?php echo __("CF_list_ar")?></h3><br />
<div class="input text">
		<label><?php echo __("CF_dis_lang")?></label>		
		<?php choose_your_language($lg);?>
	</div>
	
        <table border="1" width="100%">
            <tr align="left">
                <th width="80"><?php echo __("CF_date")?></th>
				<th width="70">Order</th>
                <th><?php echo __("CF_title")?></th>                
                <th width="17" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
			<?php 
			$total = count($articles);
            $strNo='';
                if($lg == 'fr')
                {
                    $strNo='No_temp';
                }else
                {
                    $strNo='No';
                }
			for($i=0; $i<$total;$i++):				
                            $no_temp_1 = $articles[$i][$strNo]+1;    
                $no_temp_2 = $articles[$i][$strNo]-1; 
			?>
			            
			<tr>
				<td><?php echo date("d-m-Y", strtotime($articles[$i]['date']))?></td>
				<td>					
					<?php if ((!$is_first_page)||($i>0)):?>
					<a href="<?php echo site_url("conference_office/order_by_no").'/'.$articles[$i][$strNo].'/'.$no_temp_1.'/'.$lg?>" class="up_button icon_1_up_arrow">&nbsp;</a>
					<?php endif;?>
					<?php if ((!$is_last_page)||($i<$total-1)):?>
					<a href="<?php echo site_url("conference_office/order_by_no").'/'.$articles[$i][$strNo].'/'.$no_temp_2.'/'.$lg?>" class="up_button icon_1_down_arrow">&nbsp;</a>
					<?php endif;?>
					<span style="float:right"><?php echo $max_no-($articles[$i][$strNo]-1)?></span> 
				</td>  
				<td><?php echo $articles[$i]['title']?></td>     				
				<td width="17"><a href="<?php echo site_url('conference_office/get_office_admin'.'/'.$articles[$i]['id'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td>
				<td width="17"><a href="<?php echo site_url('conference_office/delete_article').'/'.$articles[$i]['id'].'/'.$articles[$i][$strNo].'/'.$lg?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
			</tr>
			<?php endfor;?>			
			
        </table>
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->
        <div>
            <ul id="pagination"><?php echo $pagination?></ul>			
        </div>
		
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
   
				