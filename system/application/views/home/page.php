<?php foreach($query as $row){
                            $StrElementName = '';                               
                            $ElementName = $row['ElementName'];
                            $ElementContent = $row['ElementContent'];
                            if($ElementName == 'About')
                            {
                                $StrElementName = __("CF_about_us");
                            }elseif($ElementName == 'How')
                            {
                                $StrElementName = __("CF_how");    
                            }elseif($ElementName == 'Rules')
                            {
                                $StrElementName = __("CF_rules");    
                            }elseif($ElementName == 'About_fr')
                            {
                                $StrElementName = __("CF_about_us");   
                            }elseif($ElementName == 'How_fr')
                            {
                                $StrElementName = __("CF_how");   
                            }elseif($ElementName == 'Rules_fr')
                            {
                                $StrElementName = __("CF_rules");   
                            }
                        ?>
<div class="content_item">
    <h3><?php echo $StrElementName?></h3>
    
    <p><?php echo $ElementContent?></p>    
</div>
<?php } ?>