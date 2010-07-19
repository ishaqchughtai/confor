<?php 
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<rss version="2.0">
    <channel>    
    <title><?php echo $feed_name; ?></title>
    <link><?php echo $feed_url; ?></link>
	<copyright>Confor.ca</copyright>
    <description><![CDATA[ <?php echo $page_description;?> ]]></description>
    
    <?php foreach($blogs->result() as $item): ?>
        <item>
          <title><?php echo xml_convert($item->Title); ?></title>		  
          <link><?php echo site_url('blog_frontend/blog_content/' . $item->Name.'/'.$item->Title) ?></link>		            
          <description><![CDATA[ <?php echo character_limiter(strip_tags($item->Text),200);?> ]]></description>
	      <pubDate><?php echo $item->Date;?></pubDate>
        </item>        
    <?php endforeach; ?>
    </channel>	
</rss>  