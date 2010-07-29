<?php

define('PS_ADMIN_DIR', getcwd());

include(PS_ADMIN_DIR.'/../config/config.inc.php');

if (!class_exists('Cookie'))
	exit();

$cookie = new Cookie('psAdmin', substr($_SERVER['SCRIPT_NAME'], strlen(__PS_BASE_URI__), -10));
if (!$cookie->isLoggedBack())
	die;

if (isset($_FILES['virtual_product_file']) AND is_uploaded_file($_FILES['virtual_product_file']['tmp_name']) AND 
(isset($_FILES['virtual_product_file']['error']) AND !$_FILES['virtual_product_file']['error'])	OR 
(!empty($_FILES['virtual_product_file']['tmp_name']) AND $_FILES['virtual_product_file']['tmp_name'] != 'none'))
{
	$filename = $_FILES['virtual_product_file']['name'];
	$file = $_FILES['virtual_product_file']['tmp_name'];
    $file_type = $_FILES['virtual_product_file']['type'];    
	$newfilename = ProductDownload::getNewFilename();

	if (!copy($file, _PS_DOWNLOAD_DIR_.$newfilename))
	{
		header('HTTP/1.1 500 Error');
		echo '<return result="error" msg="no rights" filename="'.$filename.'" />';
	}
	@unlink($file);
    //Rewrite the file
        if(preg_match('/html/',$file_type) || preg_match('/htm/',$file_type))
        {
            
            //Rewrite html file again to concat productid
            //$link = $_GET['id_product'];            
            
            chmod(_PS_DOWNLOAD_DIR_.$newfilename,0777);
            $content_html = file_get_contents(_PS_DOWNLOAD_DIR_.$newfilename);
            
            if(preg_match('/href="http:\/\//',$content_html)) 
            {
                //open html and process here
                $start_post = strpos($content_html,'<a href="')+strlen('<a href="');
                $end_post = strpos($content_html,'</a>');
                $substr_first = substr($content_html,$start_post,$end_post-$start_post);
                $end_post_ = strlen($substr_first)-strpos($substr_first,'">');
                $substr_last = substr($content_html,$start_post,$end_post-$end_post_-$start_post);
                //$content = str_replace($substr_last,$substr_last.='/id_product=123456',$content);
                /*if($id_product!='') $link .='/'.$id_product;
                elseif($physical_file!='') $link .='/'.$physical_file;
                else $link .='/hehehehe';*/
                if(substr($substr_last,-1,1)!='/') $link = '/'.$_GET['id_product'];
                $content_html = str_replace($substr_last,$substr_last.$link,$content_html);
                file_put_contents(_PS_DOWNLOAD_DIR_.$newfilename,$content_html);  
            }
           // echo 'Here '.$content_html;
        }
        //--End Rewrite the file
	header('HTTP/1.1 200 OK');
	echo '<return result="success" msg="'.$newfilename.'" filename="'.$filename.'" />';
}
else
{
	header('HTTP/1.1 500 Error');
	echo '<return result="error" msg="big error" filename="'.ProductDownload::getNewFilename().'" />';
}

?>
