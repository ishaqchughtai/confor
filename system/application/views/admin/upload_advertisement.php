<html>
<head>
<title>Upload Form</title>
</head>
<body>

<h3 align="center">Your file was successfully uploaded!</h3>
<div align="center">
  <ul>
    <li>Click Link :<a href="#" onClick="window.opener.document.event.image_link.value='<?php echo $Link_full?>';window.close();"> <?php echo $Link_full?></a></li>
							
  </ul>
</div>
<p align="center"><?php echo anchor('advertisement/do_upload', 'Upload Another File!'); ?></p>

</body>
</html>