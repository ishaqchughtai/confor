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
  $r->setAttributeNS('http://www.w3.org/2000/xmlns/','xmlns:video','http://www.google.com/schemas/sitemap-video/1.0');
  foreach( $query as $row )
  {
  $keyword = explode(" ", $row['tags']);
  
  $b = $doc->createElement( "url" );
  
  $id = $doc->createElement( "loc" );
  $id->appendChild(
  $doc->createTextNode( 'http://confor.tv/index.php/video/play/'.$row['vid_id'] )
  );
  $b->appendChild( $id );
  
  $video = $doc->createElement("video:video");
  
  $thumbnail = $doc->createElement( "video:thumbnail_loc" );
  $thumbnail->appendChild(
  $doc->createTextNode('http://confor.tv/thumbs/'.$row['shash'])
  );
  $video->appendChild( $thumbnail );
  
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
  
  $viewed = $doc->createElement( "video:view_count" );
  $viewed->appendChild(
  $doc->createTextNode($row['viewed'])
  );
  $video->appendChild( $viewed );
  
  for($i=0;$i<count($keyword);$i++)
  {
	  $tags = $doc->createElement( "video:tag" );
	  $tags->appendChild(
	  $doc->createTextNode($keyword[$i])
	  );
	  $video->appendChild( $tags );
  }
  
  $date = $doc->createElement( "video:publication_date" );
  $date->appendChild(
  $doc->createTextNode(mdate("%Y-%m-%d", $row['date']))
  );
  $video->appendChild( $date );
  
  $category = $doc->createElement( "video:category" );
  $category->appendChild(
  $doc->createTextNode($row['Name'])
  );
  $video->appendChild( $category );
  
  $uploader = $doc->createElement( "video:uploader" );
  $uploader->appendChild(
  $doc->createTextNode($row['first_name'].$row['name'])
  );
  $video->appendChild( $uploader );
  
  $b->appendChild( $video );
  $r->appendChild( $b );
  }
  
  $doc->saveXML();
  
 $doc->save("videositemap.xml")
  ?> 