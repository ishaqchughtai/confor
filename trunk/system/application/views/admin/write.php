<?php
	/*
  $employees = array();
  $employees [] = array(
  'name' => 'Albert',
  'age' => '34',
  'salary' => "$10000"
  );
  $employees [] = array(
  'name' => 'Claud',
  'age' => '20',
  'salary' => "$2000"
  );*/
  
  $doc = new DOMDocument("1.0",'UTF-8');
  $doc->formatOutput = true;
  
  
  $r = $doc->createElementNS( 'http://www.sitemaps.org/schemas/sitemap/0.9','urlset' );
  $doc->appendChild( $r );
  $r->setAttributeNS('http://www.google.com/schemas/sitemap-video/1.0','xmlns:video','http://www.google.com/schemas/sitemap-video/1.0');
  foreach( $query as $row )
  {
  
  $b = $doc->createElement( "url" );
  
  $id = $doc->createElement( "loc" );
  $id->appendChild(
  $doc->createTextNode( 'http://confor.tv/index.php/video/play/'.$row['vid_id'] )
  );
  $b->appendChild( $id );
  
  $video = $doc->createElement("video:video");
  
  $title = $doc->createElement( "video:title" );
  $title->appendChild(
  $doc->createTextNode($row['title'])
  );
  $video->appendChild( $title );
  
  $description = $doc->createElement( "video:description" );
  $description->appendChild(
  $doc->createTextNode($row['description'])
  );
  $video->appendChild( $description );
  $b->appendChild( $video );
  $r->appendChild( $b );
  }
  
  $doc->saveXML();
  
 $doc->save("write.xml")
  ?> 