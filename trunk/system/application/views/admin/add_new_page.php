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
                            }elseif($ElementName == 'Training')
                            {
                                $StrElementName = 'Training';   
                            }
}?>
<div class="content_item">                 
    <form id="contactform" action="<?php echo site_url("accessories/update_element/".$ElementName)?>" method="post" enctype="multipart/form-data" class="global">                   
        <p>
            <label ><?php echo __("CF_element_name")?> : <?php echo $StrElementName?></label>
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
