<?php

// try not to change too much in here:

ini_set('display_errors',true);
ini_set('error_reporting',E_ALL);

// quick addition for javascript mode, to include all the lightbox effects etc..
if(isset($_REQUEST['js'])){
	header("Content-type: text/javascript");
	$script_dir = 'http://'.$_SERVER['HTTP_HOST'] . dirname( ( $_SERVER['REQUEST_URI'] ? $_SERVER['REQUEST_URI'] : ( $_SERVER['SCRIPT_NAME'] ? $_SERVER['SCRIPT_NAME'] : ($_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : '')))) . '/sendfiles/gb/';
	// optionally, set the folder yourself if it cannot be determined automatically. eg:
	// $script_dir = '/send_to_friend/sendfiles/gb/';
	/*?>
	var GB_ROOT_DIR = "<?php echo $script_dir;?>";
	document.write('<'+'scri'+'pt type="text/javascript" src="<?php echo $script_dir;?>AJS.js"><'+'/sc'+'ript>');
	document.write('<'+'scri'+'pt type="text/javascript" src="<?php echo $script_dir;?>AJS_fx.js"><'+'/sc'+'ript>');
	document.write('<'+'scri'+'pt type="text/javascript" src="<?php echo $script_dir;?>gb_scripts.js"><'+'/sc'+'ript>');
	document.write('<'+'link'+' rel="stylesheet" src="<?php echo $script_dir;?>gb_styles.css" type="text/css" />');
	<?php*/
	?>
	//requires jquery
	if(typeof(jQuery)=='undefined'){
		document.write('<'+'scri'+'pt type="text/javascript" src="<?php echo $script_dir;?>jquery-latest.js"><'+'/sc'+'ript>');
	}
	document.write('<'+'scri'+'pt type="text/javascript" src="<?php echo $script_dir;?>greybox.js"><'+'/sc'+'ript>');
	document.write('<'+'link'+' rel="stylesheet" href="<?php echo $script_dir;?>greybox.css" type="text/css" />');
	var GB_ANIMATION = true;
      $(document).ready(function(){
        $("a.sendtofriend").click(function(){
          var t = this.title || this.innerHTML || this.href;
          GB_show(t,this.href+(this.href.match('url=') ? '&' : '?url='+window.location.href+'&')+'lb',<?php echo $popup_height;?>,<?php echo $popup_width;?>,'<?php echo $script_dir;?>');
          return false;
        });
      });
	<?php
	exit;
}

$url = (isset($_REQUEST['url'])) ? $_REQUEST['url'] : ( isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : false);
if(!$url){
	// what url do we use to post to if none are given / referal
	// just the website address i guess.
	$url = 'http://'.$_SERVER['HTTP_HOST'];
}
if(!preg_match('#^https?://#i',$url)){
	$url = 'http://'.$url;
}
if($restrict_domain){
	if($restrict_domain === true){
		$restrict_domain = $_SERVER['HTTP_HOST'];
	}
	$restrict_domains = explode(',',$restrict_domain);
	$valid_domain = false;
	$url_parts = parse_url($url);
	if(isset($url_parts['host'])){
		foreach($restrict_domains as $val){
			if(preg_match('#'.preg_quote($val,'#').'#i',$url_parts['host'])){
				$valid_domain = true;
			}
		}
	}
	if(!$valid_domain){
		//reset to a valid domain.
		$url = 'http://'.$_SERVER['HTTP_HOST'];
	}
}

$errors = array();

// see if we can pull a description and picture from this page
$page_contents = false;
$description = (isset($_REQUEST['description'])) ? $_REQUEST['description'] : false;
if(!$description){
	// use curl or file_get_contents to parse the page and get some text to use.
	if(!$page_contents){
		$page_contents = get_page_contents($url);
		if(is_array($page_contents)){
			// hack for error handling.
			$errors = array_merge($errors,$page_contents);
			$page_contents = false;
		}
	}
	if($page_contents){
		// strip out some text from the page contesnt to use.
		// use page description, then use body text.
		if(preg_match('#<meta[^<]+name=([\'"])description\1[^>]*>#imsU',$page_contents,$matches)){
			if(preg_match('#content=([\'"])(.*)\1#imsU',$matches[0],$content_matches)){
				$description = trim(htmlspecialchars_decode($content_matches[2]));
			}
		}
		if(!$description){
			// failed to get a meta description, use page content instead.
			$description = trim(substr(htmlspecialchars_decode(preg_replace('#\s+#',' ',strip_tags($page_contents))),0,100));
		}
		// if we dont have a description by now, cant think of any way to get them.
	}
}
$title = (isset($_REQUEST['title'])) ? $_REQUEST['title'] : false;
if(!$title){
	// use curl or file_get_contents to parse the page and get some text to use.
	if(!$page_contents){
		$page_contents = get_page_contents($url);
		if(is_array($page_contents)){
			// hack for error handling.
			$errors = array_merge($errors,$page_contents);
			$page_contents = false;
		}
	}
	if($page_contents){
		// strip out some text from the page contesnt to use.
		// use page description, then use body text.
		if(preg_match('#<title[^>]*>(.*)</title>#imsU',$page_contents,$matches)){
			$title = htmlspecialchars_decode(trim($matches[1]));
		}
		if(!$title){
			// failed to get a meta title, use url instead.
			$title = (basename($url)) ? basename($url) : $url;
		}
	}
}
$images = (isset($_REQUEST['images'])) ? explode('|',$_REQUEST['images']) : array();
if(!$allow_images)$images=array();
if(!$images && $allow_images){
	// use curl or file_get_contents to parse the page and get some text to use.
	if(!$page_contents){
		$page_contents = get_page_contents($url);
		if(is_array($page_contents)){
			// hack for error handling.
			$errors = array_merge($errors,$page_contents);
			$page_contents = false;
		}
	}
	if($page_contents){
		// strip out some text from the page contesnt to use.
		// use page description, then use body text.
		if(preg_match_all('#<img[^<]+src=([\'"])(.*)\1#imsU',$page_contents,$matches)){
			$images = array_unique($matches[2]);
			// dont want a million images to come through, limit this to 10 ? 
			$images = array_slice($images,0,10,true);
		}
	}
}


// find any images to display in the selector.
$image_count=1;
if($images){ 
	foreach($images as $key => $image){ 
		$image = trim($image);
		$image = trim($image,'#');
		if(!$image){
			unset($images[$key]);
			continue;
		}
		$image_count++;
	}
}

$display_thankyou = false;
if(isset($_REQUEST['send'])){
	// send the page to friends if required fields are there.
	$friends = (isset($_REQUEST['their_email']) && is_array($_REQUEST['their_email'])) ? $_REQUEST['their_email'] : array();
	foreach($friends as $key=>$val){
		$val = trim($val);
		if(!$val || !strpos($val,'@')){ // bad validation
			unset($friends[$key]);
		}
	}
	if($url && count($friends) && isset($_REQUEST['your_email']) && strpos($_REQUEST['your_email'],'@')){ // bad validation, meh
		// send html email to all listed friends.
		$parts = parse_url($url);
		if(!$email_address || $email_address == 'example@example.com'){
			// if they haven't changed their email address, use info@domain
			$email_address = 'info@'.$parts['host'];
		}
		$headers = 'From: '.($website_name ? $website_name : $parts['host']).' <'.$email_address.'>' . "\r\n";
		if($send_bcc)$headers .= 'BCC: '.$email_address."\r\n";
		$headers .= 'Reply-To: '.preg_replace('/\r|\n/','',$_REQUEST['your_email'])."\r\n"; // basic spam header injection protection
		$headers .= 'MIME-Version: 1.0' . "\r\n";
		$headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		$headers .= "\r\n";
		foreach($friends as $friend){
			ob_start();
			include('sendfiles/email.html'); // so people can have php in the email, eg date()
			$content = ob_get_clean();
			$replace = array(
				'FROM' => ($_REQUEST['your_name'] ? $_REQUEST['your_name'] . ' (' . $_REQUEST['your_email'] . ')' : $_REQUEST['your_email']),
				'IMAGE' => ((isset($_REQUEST['image_url']) && $_REQUEST['image_url']) ? '<a href="'.$url.'" target="_blank"><img src="'.$_REQUEST['image_url'].'" border="0" alt="Image de votre ami"></a>' : ''),
			);
			foreach($_REQUEST as $key=>$val){
				if(is_array($val))continue;
				$replace[strtoupper($key)] = $val;
			}
			foreach($replace as $key=>$val){
				$content = preg_replace('#\{'.$key.'\}#',$val,$content);
				$email_subject = preg_replace('#\{'.$key.'\}#',$val,$email_subject);
			}
			mail($friend,$email_subject,$content,$headers);
		}
		$display_thankyou = true;
	}else{
		// something went wrong sending, prompt them to fill it in.
		$errors[] = 'Please fill in all required fields';
	}
}

function get_page_contents($url){
	if(function_exists('curl_init')){
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        curl_setopt($ch, CURLOPT_USERAGENT, "Mozilla/4.0 (compatible; PHP Send to Friend)");
        curl_setopt($ch, CURLOPT_TIMEOUT, 15); 
        curl_setopt($ch, CURLOPT_HEADER, true); // header will be at output
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'HEAD');
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_NOBODY, true);
		ob_start(); // hack for curl issue on head requests.
		$data = curl_exec($ch);
		$data2 = ob_get_clean();
		if(!$data && $data2)$data = $data2; // sometimes head request prints data instead of returning. odd. this fixes.
		if(!$data){
			return array(
				"Impossible d'accéder à l'URL",
			);
		}
		if(curl_errno($ch)){
		    return array(
		    	"Curl error: " .curl_error($ch),
		    );
		}
		curl_setopt($ch, CURLOPT_CUSTOMREQUEST, 'GET'); // reset
		curl_setopt($ch, CURLOPT_NOBODY, false);
		curl_setopt($ch, CURLOPT_HEADER, false); // reset
		$final_url = curl_getinfo($ch, CURLINFO_EFFECTIVE_URL);
		if(!$final_url){
			$final_url = $url;
		}
		$content_type = false;
		if(preg_match_all('#content-type:\s?(.*)#i',$data,$matches)){
			end($matches[1]);
			$content_type = current($matches[1]);
			foreach(array(
				'text/html',
				// add other ones here..... 
			) as $check_content){
				if(!preg_match('#'.$check_content.'#i',$content_type)){
					return array(
						'Le contenu de "'.$content_type.'" n\'est pas supporté par le programme.',
					);
				}
			}
		}else{
			return array(
				"Vérifiez l'URL et essayez à nouveau.",
			);
		}
		curl_setopt($ch, CURLOPT_URL, $final_url);
        $data = curl_exec($ch);
	}else{
		// url fopen might not be enabled:
		$data = @file_get_contents($url);
	}
	// strip stuff we will never use:
	$data = preg_replace('#<script[^>]*>.*</script>#imsU','',$data);
	$data = preg_replace('#<style[^>]*>.*</style>#imsU','',$data);
	return $data;
}


// to get a tinyurl url: http://tinyurl.com/api-create.php?url=$url - for a shorter twitter share link. meh. 

?>
