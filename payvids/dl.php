<?php
$path = addslashes($_SERVER['REQUEST_URI']);
$fname = basename($path);
header('Location: http://'. $_SERVER['SERVER_NAME'].'/confor/index.php/payvideo/getvideo/'.$fname);
?>