<?php
	if (!isset($lg)){ $lg=$lang;}
?>
<ul class="link_conttrol">	
	<li><a class="icon_list" href="<?php echo site_url('vspeaker/list_video_conference')?>/<?php echo $lg?>"><?php echo __("CF_admin_vid_list")?></a></li>
	<li><a class="icon_add" href="<?php echo site_url('vspeaker/new_video_conference')?>"><?php echo __("CF_admin_new_vid")?></a></li>
</ul>