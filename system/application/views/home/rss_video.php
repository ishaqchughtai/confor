<?php 
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<rss version="2.0"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/">

    <channel>
    
    <title><?php echo $feed_name; ?></title>

    <link><?php echo $feed_url; ?></link>
    <description>
	<?php 
		echo $page_description; 
		if (isset($video_cate))
		{
			echo ' - Category: '.$video_cate;
		}
	?>	
	</description>
    <dc:language><?php echo $page_language; ?></dc:language>    
    <dc:rights>Copyright <?php echo gmdate("Y", time()); ?></dc:rights>    

    <?php foreach($videos->result() as $item): ?>    
        <item>
          <title><?php echo xml_convert($item->title); ?></title>		  
          <link><?php echo site_url('video/play/' . $item->vid_id) ?></link>
		  <category><?php echo $item->category_name?></category>			  
          <guid><?php echo site_url('video/play/' . $item->vid_id) ?></guid>

          <description><![CDATA[
      <?php echo character_limiter($item->description,200);?>
      ]]></description>
	  
      <pubDate><?php echo date ('r', $item->date);?></pubDate>
        </item>

        
    <?php endforeach; ?>
    
    </channel>	
	</rss>  