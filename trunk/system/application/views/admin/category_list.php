<script type="text/javascript">
    $(function(){
        $('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){                           
                var lg = $(selected).val();                              
                gogo = XEMMEX.baseUrl + "admin/list_category/" + lg + "/";    
                window.location = gogo;            
            });    
        });    
    });    
    //-->
</script>
<div id="content">

    <div class="">
        <h3><?php echo __("CF_list_vid_cate")?></h3>
        <div class="input text">
            <label>Display language</label>        
            <?php choose_your_language($lg);?>
        </div>
        <table border="1" width="833">
            <tr align="left">
                <th width="640"><?php echo __("CF_cate_name")?></th>
                <th width="83" colspan="2"><?php echo __("CF_action")?></th>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['Name']?></td>
                    <td><a href="<?php echo site_url("admin/modify_category/".$row['ID'])?>"><?php echo __("CF_modify")?></a></td>
                    <td width="88"><a href="<?php echo site_url("/admin/delete_category/".$row['ID'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
                </tr>
                <?php endforeach;?>
      </table>
        
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <div class="divider"></div>
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->

    </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
   