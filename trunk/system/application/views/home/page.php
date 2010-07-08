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
                            }elseif($ElementName == 'Office')
                            {
                                $StrElementName = 'Conference Office';   
                            }
                        ?>
<div class="content_item">
    <h3><?php echo $StrElementName?></h3>
    
    <p><?php echo $ElementContent?></p>    
</div>
<?php } ?>