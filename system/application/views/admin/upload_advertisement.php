<html>
<head>
<title><?php echo __("CF_Upload_Form Form")?></title>
</head>
<body>

<h3 align="center"><?php echo __("CF_success_upload")?>!</h3>
<div align="center">
  <ul>
    <li><?php echo __("CF_click_link")?> :<a href="#" onClick="window.opener.document.event.image_link.value='<?php echo $Link_full?>';window.close();"> <?php echo $Link_full?></a></li>
							
  </ul>
</div>
<p align="center"><?php echo anchor('advertisement/do_upload', __("CF_upload_another")); ?></p>

</body>
</html>