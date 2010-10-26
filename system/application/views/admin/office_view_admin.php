<script type="text/javascript">
    $(function(){
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#lg option:selected').val();				
                gogo = XEMMEX.baseUrl + "conference_office/get_all/" + lg +"/10";	
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>				
	<?php $page = 10;?>          
    <div id="content">
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
                <th width="381"><?php echo __("CF_date")?></th>
                <th width="475"><?php echo __("CF_title")?></th>                
                <th width="17" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
            <?php foreach($query as $row):?>
                <tr>
                <td><?php echo date("d-m-Y", strtotime($row['date']))?></td>
                	<td><?php echo $row['title']?></td>     
                    <td width="17"><a href="<?php echo site_url('conference_office/get_office_admin'.'/'.$row['id'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td>
                    <td width="17"><a href="<?php echo site_url('conference_office/delete'.'/'.$row['id'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
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
   
				