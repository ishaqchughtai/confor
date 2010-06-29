  <?php
//Define Path
//$ratingURL = "http://".$_SERVER['HTTP_HOST']."/SimpleRatings/";
$ratingURL = base_url()."/SimpleRatings/";
define("srRatingURL",$ratingURL);

//Load Class
require('rClass.php');
?>
      <link href="<?php echo srRatingURL;?>rCSS.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<?php echo srRatingURL;?>rJS.js"></script>
