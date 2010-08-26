<?php
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.0">
<?php foreach( $query as $row ):?>
  <url>
    <loc><?php echo 'http://confor.tv/index.php/video/play/'.$row['vid_id']?></loc>
    <video:video>
      <video:title><![CDATA[<?php echo $row['title']?>]]></video:title>
      <video:description><![CDATA[<?php echo $row['description']?>]]></video:description>
    </video:video>
  </url>
  <?php endforeach;?>
</urlset>
