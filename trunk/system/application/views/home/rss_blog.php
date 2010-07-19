<?php
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<rss version="2.0">
    <channel>
    <title><?php echo $feed_name; ?></title>
	<description><![CDATA[ <?php echo $page_description;?> ]]></description>
    <link><?php echo $feed_url; ?></link>
	<copyright>Confor.ca</copyright>
	<pubDate><?php echo gmdate("D, d M Y H:i:s \G\M\T", time());?></pubDate>
    <lastBuildDate><?php echo gmdate("D, d M Y H:i:s \G\M\T", time());?></lastBuildDate>
    <?php foreach($blogs->result() as $item): ?>
        <item>
          <title><?php echo xml_convert($item->Title); ?></title>
		  <description><![CDATA[ <?php echo character_limiter(strip_tags($item->Text),200);?> ]]></description>
          <link><?php echo site_url('blog_frontend/blog_content/' . $item->Name.'/'.$item->Title);?></link>
	      <pubDate><?php echo gmdate("D, d M Y H:i:s \G\M\T",strtotime($item->Date));?></pubDate>
        </item>
    <?php endforeach; ?>
    </channel>
</rss>