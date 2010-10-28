<?php
    foreach($query as $row)
    {
        $id = $row['ID'];
        $date_beginning = date("d-m-Y", strtotime($row['DateBeginning']));
        $date_expiry = date("d-m-Y", strtotime($row['DateExpiry']));
        $title = $row['Title'];
        $body = $row['Body'];
        $advertiser_email = $row['AdvertiserEmail'];
        $url = $row['URL'];                        
        $viewed = $row['Viewed'];
}?>
<div class="content_item">
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement_text/advertisement_list')?>"><?php echo __("CF_adv_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement_text/add')?>"><?php echo __("CF_new_adv")?></a></li>
    </ul><br />
    <h3><?php echo __("CF_avd_details")?> </h3>
    <?php
        $data=array('name' => 'advertisement_text','id' => 'advertisement-form'); 
        echo form_open('advertisement_text/get_advertisement'.'/'.$id,$data);
    ?>
    <p>

        <label for="date_beginning"><?php echo __("CF_adv_date_begin")?>:</label>
        <input name="date_beginning" class="short" value="<?php echo $date_beginning?>" readonly="true" />        

    </p>
    <p>

        <label for="date_expiry"><?php echo __("CF_adv_date_ex")?>:</label>
        <input name="date_expiry" class="short" id="datepicker" value="<?php echo $date_expiry?>"readonly="true" />

    </p>

    <p>

        <label for="title"><?php echo __("CF_title")?>:</label>
        <input class="short" name="title" id="title" value="<?php echo $title?>"readonly="true" />


    </p>
    <p>

        <label for="body"><?php echo __("CF_blog_body")?>:</label>
        <textarea class="short" name="body" id="body" rows="5" readonly="true"><?php echo $body?></textarea>


    </p>                                            
    <p>

        <label for="url"><?php echo __("CF_url")?>:</label>
        <input class="short" name="url" id="url" value="<?php echo $url?>" readonly="true"/>

    </p>
    <p>                        
        <label for="advertiser_email"><?php echo __("CF_advertiser_email")?>:</label>
        <input class="short" name="advertiser_email" id="advertiser_email" value="<?php echo $advertiser_email ?>" readonly="true" />

    </p>                       
    <p>

        <label for="viewed"><?php echo __("CF_viewed")?>:</label>
        <input class="short" name="viewed" id="viewed" value="<?php echo $viewed?>"readonly="true" />
    </p>
    <p>
        <input name="btnedit" type="submit" class="submit" id="btnedit" value="<?php echo __("CF_edit")?>" />

    </p>
    <?php echo form_close();?>

</div>

<div id="left">                    
    <p>
              </div>    