<?php 
    $admin_id=$this->session->userdata('admin_id');
    $admin_right=(int)$this->session->userdata('right');  
?><?php
foreach($status as $row){	$status = $row['Status'];	}?><div class="x2">
    <h3>Administrator Panel</h3>
    <ul class="link_conttrol">
    <?php if($admin_right==1){?>
        <li><a class="icon_list" href="<?php echo site_url('admin/list_admin');?>">Administrator List</a></li>
        <li><a class="icon_add" href="<?php echo site_url('admin/add_new_admin');?>">New administrator</a></li>
    <?php }?>
        <li><a class="icon_add" href="<?php echo site_url('admin/edit_profile/'.$admin_id);?>">Edit Profile</a></li>
    </ul>
    <p>&nbsp;</p>
</div>
<!-- /.x2 - represents a half windows size div -->

<div class="x2 no_margin">
    <h3>Speakers Control</h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('admin/list_user')?>">Speaker List</a></li>
    </ul>
</div>
<div class="divider"></div>
<div class="x2">
  <h3>Conferences Control</h3>
  <ul class="link_conttrol">
    <li><a class="icon_list" href="<?php echo site_url('admin/list_video_conference/0/3')?>">Video conference List</a></li>
    <li><a class="icon_add" href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
  </ul>
</div>
<!-- /.x2 - represents a half windows size div -->

<div class="x2 no_margin">
    <h3>Event Control </h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('event/event_list')?>">Event List</a></li>
        <li><a class="icon_add" href="<?php echo site_url('event/add_event')?>">New event</a></li>
    </ul>
</div>
<div class="divider"></div>
<div class="x2">
  <h3>Ticket Control</h3>
  <ul class="link_conttrol">
    <li><a class="icon_list" href="<?php echo site_url('ticket/open_tickets')?>">Ticket Open List</a></li>
    <li><a class="icon_add" href="<?php echo site_url('ticket/closed_tickets')?>">Ticket Closed List</a></li>
  </ul>
</div>
<div class="x2 no_margin">
    <h3>Shop Control </h3>    <ul class="link_conttrol">    <?php if ($status):?>    <li><a class="icon_list" href="<?php echo base_url().'shop/administrator'?>">Shop Management</a></li>    <li><a class="icon_add" href="<?php echo site_url('shop/deactive')?>" onclick="return confirm('Do you really wish to deactive shop?')">Deactive</a></li>    <?php else:?>    <label></label>    <li><a class="icon_add" href="<?php echo site_url('shop/active')?>" onclick="return confirm('Do you really wish to active shop?')">Active</a></li>        <?php endif;?>  </ul></div>
<div class="divider"></div>
<div class="x2">
    <h3>Blog Control</h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('blog/blog_list')?>">Blog List</a></li>
        <li><a class="icon_add" href="<?php echo site_url('blog/add_blog')?>">New blog</a></li>
    </ul>
</div>
<div class="x2 no_margin">
    <h3>Paying advertisements Control </h3>
    <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement/advertisement_list')?>">Advertisement List</a></li>
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>">New Advertisement</a></li>
    </ul>
</div>
<div class="divider"></div>