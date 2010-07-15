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
}?> 
<h3><?php echo __("CF_accessories")?></h3>
<?php $this->load->view("admin/admin_menu_accessories");?>
<p>&nbsp;    </p>

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
            <input name="" type="submit" class="submit" value="<?php echo __("CF_submit")?>"onclick="return confirm('<?php echo __("CF_mess_update")?>')" />                       
        </p>

    </form>    
</div>
