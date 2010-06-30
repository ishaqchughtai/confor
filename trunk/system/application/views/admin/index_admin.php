<?php 
    $admin_id=$this->session->userdata('admin_id');
    $admin_right=(int)$this->session->userdata('right');  
?><?php
    foreach($status as $row){	$status = $row->status;	}?><div class="x2">
    <h3><?php echo __("CF_admin_panel")?></h3>
    <ul class="link_conttrol">
        <?php if($admin_right==1){?>
            <li><a class="icon_list" href="<?php echo site_url('admin/list_admin');?>"><?php echo __("CF_admin_list")?></a></li>
            <li><a class="icon_add" href="<?php echo site_url('admin/add_new_admin');?>"><?php echo __("CF_new_admin")?></a></li>
            <?php }?>
        <li><a class="icon_add" href="<?php echo site_url('admin/edit_profile/'.$admin_id);?>"><?php echo __("CF_edit_admin")?></a></li>
		<li><a class="icon_add" href="<?php echo base_url().'pay/admin';?>">Paypal Management</a></li>
    </ul>
    <p>&nbsp;</p>
</div>
<!-- /.x2 - represents a half windows size div -->

<div class="x2 no_margin">
    <h3><?php echo __("CF_speaker_con")?></h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('admin/list_user')?>"><?php echo __("CF_speaker_list")?></a></li>
    </ul>
</div>
<div class="divider"></div>
<div class="x2">
    <h3><?php echo __("CF_vid_con")?></h3>                                                                                      
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('showroom/add_new_images')?>"><?php echo __("CF_showroom")?></a></li>  
        <li><a class="icon_list" href="<?php echo site_url('admin/list_video_conference/0/3')?>"><?php echo __("CF_admin_vid_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('admin/new_video_conference')?>"><?php echo __("CF_admin_new_vid")?></a></li>
    </ul>
</div>
<!-- /.x2 - represents a half windows size div -->

<div class="x2 no_margin">
    <h3><?php echo __("CF_event_con")?> </h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('event/event_list')?>"><?php echo __("CF_admin_event_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('event/add_event')?>"><?php echo __("CF_admin_new_event")?></a></li>
    </ul>
</div>
<div class="divider"></div>
<div class="x2">
    <h3><?php echo __("CF_ticket_con")?></h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('ticket/open_tickets')?>"><?php echo __("CF_admin_ticket_open_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('ticket/closed_tickets')?>"><?php echo __("CF_admin_ticket_closed_list")?></a></li>
    </ul>
</div>
<div class="x2 no_margin">
    <h3><?php echo __("CF_shop_con")?></h3>    <ul class="link_conttrol">    <?php if ($status):?>    <li><a class="icon_list" href="<?php echo base_url().'shop/administrator'?>"><?php echo __("CF_shop_man")?></a></li>    <li><a class="icon_add" href="<?php echo site_url('shop/deactive')?>" onclick="return confirm('Do you really wish to deactive shop?')"><?php echo __("CF_shop_deac")?></a></li>    <?php else:?>    <label></label>    <li><a class="icon_add" href="<?php echo site_url('shop/active')?>" onclick="return confirm('Do you really wish to active shop?')"><?php echo __("CF_shop_ac")?></a></li>        <?php endif;?>  </ul></div>
<div class="divider"></div>
<div class="x2">
    <h3><?php echo __("CF_blog_con")?></h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('blog/blog_list')?>"><?php echo __("CF_admin_blog_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('blog/add_blog')?>"><?php echo __("CF_admin_new_blog")?></a></li>
    </ul>
</div>
<div class="x2 no_margin">
    <h3><?php echo __("CF_adv_con")?></h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement/advertisement_list')?>"><?php echo __("CF_adv_list")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_new_adv")?></a></li>
    </ul>
</div>
<div class="divider"></div>