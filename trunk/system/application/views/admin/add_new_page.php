<script type="text/javascript">
    $(function(){       
        $('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){                           
                var lg = $(selected).val();                
                var cate = $('#vid_cate option:selected').val();                
                gogo = XEMMEX.baseUrl + "admin/get_element/" + lg;    
                window.location = gogo;            
            });    
        });    
    });    
    //-->
</script>
<h3><?php echo __("CF_accessories")?></h3>
<?php $this->load->view("admin/admin_menu_accessories");?>
<p>&nbsp;    </p>
<div class="input text">
    <label>Display language</label>        
    <?php choose_your_language($lg);?>
</div>
<?php foreach($query as $row){
                            $StrElementName = '';                               
                            $ElementName = $row['ElementName'];
                            $ElementContent = $row['ElementContent'];
                            if($ElementName == 'About')
                            {
                                $StrElementName = 'About us';
                            }elseif($ElementName == 'How')
                            {
                                $StrElementName = 'How it works';    
                            }elseif($ElementName == 'Rules')
                            {
                                $StrElementName = 'The rules';    
                            }elseif($ElementName == 'About_fr')
                            {
                                $StrElementName = 'About us';   
                            }elseif($ElementName == 'How_fr')
                            {
                                $StrElementName = 'How it works';   
                            }elseif($ElementName == 'Rules_fr')
                            {
                                $StrElementName = 'The rules';   
                            }
}?>
<div class="content_item">                 
    <form id="contactform" action="<?php echo site_url("admin/update_element/".$ElementName)?>" method="post" enctype="multipart/form-data" class="global">                   
        <p>
            <h3 ><?php echo $StrElementName?></h3>
            <p></p>    
            <?php echo form_error('ElementContent');?>                    
            <label for="description"><?php echo __("CF_blog_body")?>:</label><br />
            <?php
                $data = array('name' => 'ElementContent',
                'id' => 'ElementContent',
                'width' => '600',
                'height' => '400',
                'value'=>$ElementContent);
                echo form_fckeditor($data);
            ?>                   
        </p>

        <p>                    
            <input name="" type="submit" class="submit" value="<?php echo __("CF_submit")?>"onclick="return confirm('Do you really wish to update?')" />
            <input name="" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />                        
        </p>

    </form>    
</div>
