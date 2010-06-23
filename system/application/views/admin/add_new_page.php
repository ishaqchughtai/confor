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
    <form id="contactform" action="<?php echo site_url("Accessories/update_element/".$ElementName)?>" method="post" enctype="multipart/form-data" class="global">                   
        <p>
            <label >Element Name : <?php echo $StrElementName?></label>
            <p></p>    
            <?php echo form_error('ElementContent');?>                    
            <label for="description">Body:</label><br />
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
            <input name="" type="submit" class="submit" value="Submit" />
            <input name="" type="reset" class="reset" value="Reset" />                        
        </p>

    </form>    
</div>
