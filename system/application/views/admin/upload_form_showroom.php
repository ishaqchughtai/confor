<html>
<head>
<title>Upload Form</title>
</head>
<body>

<div align="center">
  
<?php echo $error;?>
  <?php echo form_open_multipart('showroom/do_upload');?>
  
  <input type="file" name="userfile" size="20" />
  
  <br />
  <br />
  
  <input type="submit" value="upload" name="upload"/>
  
  </form>
  
</div>
</body>
</html>
