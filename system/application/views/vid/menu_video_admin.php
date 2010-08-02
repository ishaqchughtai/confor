<?php
	if (!isset($lg)){ $lg=$lang;}
?>

	<li><a class="icon_setting" href="<?php echo site_url('vid/setting')?>"><?php echo __("CF_video_setting")?></a></li>
	<li><a class="icon_add_category" href="<?php echo site_url('admin/category_managing')?>"><?php echo __("CF_cate_man")?></a></li>	
	<li><a class="icon_list" href="<?php echo site_url('vid/list_video_conference')?>/<?php echo $lg?>"><?php echo __("CF_admin_vid_list")?></a></li>
	<li><a class="icon_add" href="<?php echo site_url('vid/new_video_conference')?>"><?php echo __("CF_admin_new_vid")?></a></li>
</ul>