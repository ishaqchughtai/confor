<script type="text/javascript">
    $(function(){
		$('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){ 		  				
				var lg = $(selected).val();				
				var cate = $('#lg option:selected').val();				
                gogo = XEMMEX.baseUrl + "training/index/" + lg;	
                window.location = gogo;			
            });	
        });	
    });	
    //-->
</script>				          
    <?php $this->load->view("admin/admin_menu_training");?> 
    <div id="content">

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
                <td><?php echo date("F jS Y", strtotime($row['Date']))?></td>
                	<td><?php echo $row['Title']?></td>     
                    <td width="17"><a href="<?php echo site_url('training/get_training_admin').'/'.$row['ID']?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td>
                    <td width="17"><a href="<?php echo site_url('training/delete_article').'/'.$row['ID']?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
                </tr>
                <?php endforeach;?>
        </table>
        <div>
            <ul id="pagination">
                    <li><?php echo $pagination?></li>
                </ul>
        </div>
</div>
   
				