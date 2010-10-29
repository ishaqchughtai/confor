<script type="text/javascript">
    $(function() {
        $("#datepicker").datepicker({
            dateFormat: 'yy/mm/dd',
            onSelect: function(dateText, inst) {   
                //$('#datepicker').val(dateText);
                gogo = dateText;
                //alert(gogo);
            }                
        }
        );
        $("#format").change(function() { 
            $('#datepicker').datepicker('option', {dateFormat: $(this).val()}); });
    });
</script>
<?php
    foreach($query as $row)
    {
        $id = $row['ID'];
        $date_beginning = date("Y/m/d", strtotime($row['DateBeginning']));
        $date_expiry = date("Y/m/d", strtotime($row['DateExpiry']));
        $title = $row['Title'];
        $body = $row['Body'];
        $advertiser_email = $row['AdvertiserEmail'];
        $url = $row['URL'];                        
        $viewed = $row['Viewed'];
}?>

<div class="content_item">
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement_text/advertisement_list')?>"><?php echo __("CF_adv_list_text")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement_text/add')?>"><?php echo __("CF_new_adv_text")?></a></li>
    </ul><br />
    <h3><?php echo __("CF_edit_adv_text")?> </h3>
    <?php
        $data=array('name' => 'advertisement_text','id' => 'advertisement-form'); 
        echo form_open('advertisement_text/edit/'.$id,$data);
    ?>
    <p>                        
        <label for="date_expiry"><?php echo __("CF_adv_date_ex")?>:</label>
        <input name="date_expiry" class="short" id="datepicker" value="<?php echo $date_expiry?>" />
        <?php echo form_error('date_expiry')?>

    </p>

    <p>

        <label for="title"><?php echo __("CF_title")?>:</label>
        <input class="short" name="title" id="title" value="<?php echo $title?>" />
        <?php echo form_error('title')?>

    </p>
    <p>

        <label for="body"><?php echo __("CF_blog_body")?></label>
        <textarea class="short" name="body" id="body" rows="5"><?php echo $body?></textarea>
        <?php echo form_error('body')?>

    </p>
    <p>

        <label for="url"><?php echo __("CF_url")?>:</label>
        <input class="short" name="url" id="url" value="<?php echo $url?>" />
        <?php echo form_error('url')?>

    </p> 
    <p>                        
        <label for="advertiser_email"><?php echo __("CF_advertiser_email")?>:</label>
        <input class="short" name="advertiser_email" id="advertiser_email" value="<?php echo $advertiser_email ?>" readonly="true" />
        <?php echo form_error('advertiser_email')?>

    </p>

    <input name="btnedit" type="submit" class="submit" id="btnedit" value="<?php echo __("CF_save")?>" onclick="return confirm('<?php echo __("CF_mess_update")?>');" />
    <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />

    </p>

    <?php echo form_close();?>

</div>

<div id="left">                    
    <p>
              </div>                    