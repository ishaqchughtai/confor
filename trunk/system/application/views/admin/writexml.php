<?php
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:video="http://www.google.com/schemas/sitemap-video/1.0">
<?php foreach( $query as $row ):?>
<?php $keyword = explode(" ", $row['tags']);?>
  <url>
    <loc><?php echo 'http://confor.tv/index.php/video/play/'.$row['vid_id']?></loc>
    <video:video>
      <video:thumbnail_loc><?php echo base_url().'thumbs/'.$row['shash'];?></video:thumbnail_loc>
      <video:title><![CDATA[<?php echo $row['title']?>]]></video:title>
      <video:description><![CDATA[<?php echo $row['description']?>]]></video:description>
      <video:view_count><?php echo $row['viewed']?></video:view_count>
      <?php for($i=0;$i<count($keyword);$i++):?>
      <video:tag><![CDATA[<?php echo $keyword[$i]?>]]></video:tag>
      <?php endfor?>
      <video:publication_date><?php echo mdate("%Y-%m-%d", $row['date'])?></video:publication_date>
      <video:category><![CDATA[<?php echo $row['Name']?>]]></video:category>
      <video:uploader><![CDATA[<?php echo $row['first_name'].$row['name']?>]]></video:uploader>
    </video:video>
  </url>
  <?php endforeach;?>
</urlset>
