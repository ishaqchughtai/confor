<?php 
    $admin_id=$this->session->userdata('admin_id');
    $admin_right=(int)$this->session->userdata('right');  
?><div class="x2">
    <h3><?php echo __("CF_admin_panel")?></h3>
    <ul class="link_conttrol">
        <?php if($admin_right==1){?>
            <li><a class="icon_list" href="<?php echo site_url('admin/list_admin');?>"><?php echo __("CF_admin_list")?></a></li>
            <li><a class="icon_add" href="<?php echo site_url('admin/add_new_admin');?>"><?php echo __("CF_new_admin")?></a></li>
            <?php }?>
        <li><a class="icon_add" href="<?php echo site_url('admin/edit_profile/'.$admin_id);?>"><?php echo __("CF_edit_admin")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('admin/change_pass/'.$admin_id);?>"><?php echo __("CF_change_pass")?></a></li>
        <li><a class="icon_add" href="<?php echo base_url().'pay/admin';?>"><?php echo __("CF_paypal_man")?></a></li>
        <li><a class="icon_list" href="<?php echo site_url('admin/show_element/about');?>"><?php echo __("CF_accessories")?></a></li>
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
        <li><a class="icon_list" href="<?php echo site_url('showroom/list_images')?>"><?php echo __("CF_showroom")?></a></li>  
		<li><a class="icon_add" href="<?php echo site_url('admin/category_managing')?>"><?php echo __("CF_cate_man")?></a></li>
        <li><a class="icon_add" href="<?php echo site_url('vid/setting')?>">Video settings</a></li>
		<br/>
		<li><a class="icon_list" href="<?php echo site_url('vid/list_video_conference/en')?>"><?php echo __("CF_admin_vid_list")?> - (English)</a></li>
        <li><a class="icon_add" href="<?php echo site_url('vid/new_video_conference/en')?>"><?php echo __("CF_admin_new_vid")?> - (English)</a></li>		
		<br/>
		<li><a class="icon_list" href="<?php echo site_url('vid/list_video_conference/fr')?>"><?php echo __("CF_admin_vid_list")?> - (French)</a></li>
        <li><a class="icon_add" href="<?php echo site_url('vid/new_video_conference/fr')?>"><?php echo __("CF_admin_new_vid")?> - (French)</a></li>		
        
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
    <h3><?php echo __("CF_shop_con")?></h3>    <ul class="link_conttrol"> <li><a class="icon_list" href="<?php echo base_url().'prestashop/admin_shop'?>"><?php echo __("CF_shop_man")?></a></li></ul></div>
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