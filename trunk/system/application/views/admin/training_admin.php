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
                gogo = XEMMEX.baseUrl + "training/index/" + lg;	
                window.location = gogo;			
            });	
        });	
    });	

    function save_click_training()
    {
        var order_temp1 = $("#order_input_temp1").val();
        var order_temp2 = $("#order_input_temp2").val();
        var lg = $('#lg option:selected').val();
        gogo = XEMMEX.baseUrl + "training/swap_by_no/"+order_temp1 +'/'+order_temp2+'/'+lg;    
        window.location = gogo;   
    }
    //-->
</script>				          
<?php $this->load->view("admin/admin_menu_training");?>
<ul class="link_conttrol">
         <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/formation_list/1')?>"><?php echo __("CF_edit_meta")?></a></li>
    </ul>
    <br /> 
<div id="content">

    <div class="input text">
        <label><?php echo __("CF_dis_lang")?></label>		
        <?php choose_your_language($lg);?>
        <br />
    </div>
    <table border="1" width="100%">
        <tr align="left">
            <th width="100"><?php echo __("CF_date")?></th>
            <th width="150"><?php echo __("CF_order")?>  </th> 
            <th width="475"><?php echo __("CF_title")?></th>                
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
                <td><?php echo date("d-m-Y", strtotime($articles[$i]['Date']))?></td>
                <td>                    
                    <?php if ((!$is_first_page)||($i>0)):?>
                        <a href="<?php echo site_url("training/order_by_no").'/'.$articles[$i][$strNo].'/'.$no_temp_1.'/'.$lg?>" class="up_button icon_1_up_arrow">&nbsp;</a>
                        <?php endif;?>

                    <?php if ((!$is_last_page)||($i<$total-1)):?>
                        <a href="<?php echo site_url("training/order_by_no").'/'.$articles[$i][$strNo].'/'.$no_temp_2.'/'.$lg?>" class="up_button icon_1_down_arrow">&nbsp;</a>
                        <?php endif;?>
                        <div align="center">
                        <span style="float:right; ">
                            <img src="<?php echo base_url().'/'.'assets/img/filesave.png'?>" height="27px" width="27px" align="right" title="<?php echo __("CF_save_order")?>" onclick="save_click_training();" style="cursor: pointer;">
                        </span>
                        <span style="float:right; ">
                            &nbsp;&nbsp;&nbsp;
                        </span>
                        <span style="float: right;">
                            <input name="order_input_temp2"  type="text" id="order_input_temp2" value="<?php echo $max_no-($articles[$i][$strNo]-1)?>" size="5"/> 
                            <input name="order_input_temp1" type="hidden" id="order_input_temp1" value="<?php echo $articles[$i][$strNo]?>"/> 
                            <input name="lang_temp" type="hidden" id="lang_temp" value="<?php echo $lg?>"/>
                        </span>
                        </div>
                </td>
                <td><?php echo $articles[$i]['Title']?></td>     
                <td width="17"><a href="<?php echo site_url('training/get_training_admin').'/'.$articles[$i]['ID']?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td>
                <td width="17"><a href="<?php echo site_url('training/delete_article').'/'.$articles[$i]['ID'].'/'.$articles[$i][$strNo].'/'.$lg?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
            </tr>
            <?php endfor;?>
    </table>
    <div>
        <ul id="pagination">
            <li><?php echo $pagination?></li>
        </ul>
    </div>
</div>
   
				
