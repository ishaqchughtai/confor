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
    <description><?php echo $page_description;?></description>
    <dc:language><?php echo $page_language; ?></dc:language>    
    
    <?php foreach($blogs->result() as $item): ?>    
        <item>
          <title><?php echo xml_convert($item->Title); ?></title>		  
          <link><?php echo site_url('blog_frontend/blog_content/' . $item->Name.'/'.$item->Title) ?></link>		  
          <guid><?php echo site_url('blog_frontend/blog_content/' . $item->Name.'/'.$item->Title) ?></guid>

          <description><![CDATA[
      <?php echo character_limiter($item->Text,200);?>
      ]]></description>
	  
      <pubDate><?php echo $item->Date;?></pubDate>
        </item>

        
    <?php endforeach; ?>
    
    </channel>	
	</rss>  