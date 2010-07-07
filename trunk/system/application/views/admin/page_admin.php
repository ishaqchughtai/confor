<h3><?php echo __("CF_accessories")?></h3>
<?php $this->load->view("admin/admin_menu_accessories");?>
<p>&nbsp;    </p>
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
        }elseif($ElementName == 'Training')
        {
            $StrElementName = __("CF_training");   
        }elseif($ElementName == 'Office')
        {
            $StrElementName = __("CF_conference_office");   
        }else
        {
            $StrElementName='';
        }
    ?>
    <div class="content_item">
        <h3><?php echo $StrElementName?></h3>

        <p><?php echo $ElementContent?></p>
        <ul class="link_conttrol">
        <li ><a class="icon_add" href="<?php echo site_url('admin/get_element/'.$ElementName)?>"><?php echo __("CF_edit_element")?></a></li>    
        </ul>
        
    </div>
    <?php } ?>