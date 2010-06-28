<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// ------------------------------------------------------------------------

/**
 * XemmeX Helpers
 *
 * This helper contains some functions using for XEMMEX.TV project
 * 
 * @package		Confor
 * @subpackage	Helpers
 * @category	Helpers
 * @author		Nguyen Hai Dang (XemmeX developer)
 */

// ------------------------------------------------------------------------

if (! function_exists('xemmex_language'))
{
	function xemmex_language($lg = FALSE)	
	{
		$CI =& get_instance();			
		
		$lang = get_languages('header');
		
		$lang_array = array(
			'en' => 'english',
			'fr' => 'french',
			'ca' => 'french'
		);
		
		if ($lg == FALSE) 
		{
			//$lg = array_search($CI->config->item('language'), $lang_array);
			if (! array_key_exists($lang, $lang_array))	
			{
				$lang = array_search($CI->config->item('language'), $lang_array);
			}
		}
		else
		{
			$lang = $lg;
		}
		//echo $lang;
		if($CI->session->userdata('lang')) 
		{
			$lang = $CI->session->userdata('lang');
			if (array_key_exists($lang, $lang_array)) 
			{
				$CI->config->set_item('language', $lang_array[$lang]);				
				$CI->lang->load('confor', $lang_array[$lang]);
			} 
			else 
			{
				return FALSE;		
			}
		} 
		else 
		{
			if (array_key_exists($lang, $lang_array)) 
			{
				$CI->session->set_userdata('lang',$lang);
				$CI->config->set_item('language', $lang_array[$lang]);
				$CI->lang->load('confor', $lang_array[$lang]);
			} 
			else 
			{
				return FALSE;		
			}
		}
		return $lang;
	}
}

// ------------------------------------------------------------------------
// this function for get text by key in currently language
if ( ! function_exists('__'))
{
	function __($line, $id = '')
	{
		$CI =& get_instance();
		$line = $CI->lang->line($line);
		if ($id != '')
		{
			$line = '<label for="'.$id.'">'.$line."</label>";
		}
		return $line;
	}
}

// ------------------------------------------------------------------------

function get_path($file, $type) 
{	
	$retval = base_url().'assets/'.$type.'/'.$file;
	return $retval;
}

// ------------------------------------------------------------------------

function style($file, $attributes = NULL)
{
	if (empty($file)) return;	
	
	if (is_array($attributes))
	{
		$retval = '<link rel="stylesheet" href="'. get_path($file, 'css') .'" type="text/css" ';
		foreach ($attributes as $key => $value)
		{
			$retval .= "$key=\"$value\" ";
		}
		$retval .= "/>\n";
	}
	else
	{
		$retval = '<link rel="stylesheet" href="'. get_path($file, 'css') .'" type="text/css" media="all" />' . "\n";
	}

	return $retval;
}

// ------------------------------------------------------------------------

function script($file)
{
	if (empty($file)) return;
	return '<script src="'. get_path($file, 'js') .'" type="text/javascript" charset="utf-8"></script>' . "\n";
}

// ------------------------------------------------------------------------

function img($file, $attributes = NULL)
{
	$CI =& get_instance();
	$file_lang = 'assets/img/'.$CI->_data['lang'].'/'.$file;	
	//echo $file_lang;	
	if (file_exists($file_lang))
	{		
		$link = base_url().'assets/img/'.$CI->_data['lang'].'/'.$file;
	} 
	else 
	{
		$link = base_url().'assets/img/'.$file;
	}
	
	if (empty($file)) return;	
	
	if (is_array($attributes))
	{	
		$retval = '<img src="'. $link. '" ';
		foreach ($attributes as $key => $value)
		{
			$retval .= "$key=\"$value\" ";
		}
		$retval .= "/>\n";
	}
	else
	{
		$retval = '<img src="'. $link .'"/>' . "\n";
	}

	return $retval;
}

function form_fckeditor($data = '', $value = '', $extra = '')
{
    $CI =& get_instance();

    $fckeditor_basepath = $CI->config->item('fckeditor_basepath');
    
    require_once( $_SERVER["DOCUMENT_ROOT"] . $fckeditor_basepath. 'fckeditor.php' );
    
    $instanceName = ( is_array($data) && isset($data['name'])  ) ? $data['name'] : $data;
    $fckeditor = new FCKeditor($instanceName);
    
    if( $fckeditor->IsCompatible() )
    {
        $fckeditor->Value = html_entity_decode($value);
        $fckeditor->BasePath = $fckeditor_basepath;
        if( $fckeditor_toolbarset = $CI->config->item('fckeditor_toolbarset_default'))
                $fckeditor->ToolbarSet = $fckeditor_toolbarset;
        
        if( is_array($data) )
        {
            if( isset($data['value']) )
                $fckeditor->Value = html_entity_decode($data['value']);
            if( isset($data['basepath']) )
                $fckeditor->BasePath = $data['basepath'];
            if( isset($data['toolbarset']) )
                $fckeditor->ToolbarSet = $data['toolbarset'];
            if( isset($data['width']) )
                $fckeditor->Width = $data['width'];
            if( isset($data['height']) )
                $fckeditor->Height = $data['height'];
        }
        
        
        return $fckeditor->CreateHtml();
    }
    else
    {
        return form_textarea( $data, $value, $extra );
    }
}

function is_admin($go_after_login=TRUE) 
{
	$CI =& get_instance();
	if ($CI->session->userdata('admin')) 
	{
		$admin_data = array
		(
			'admin_name' => $CI->session->userdata('admin_name'),
			'admin' => $CI->session->userdata('admin'),
			'admin_id' => $CI->session->userdata('admin_id'),
			//'lang' => $this->CI->session->userdata('lang'),
			'right' => $CI->session->userdata('right')
		);
		return $admin_data;
	}
	if ($go_after_login==TRUE)
	{
		redirect('/');
	}
	return FALSE;	
}

function is_speaker($go_after_login=TRUE) 
{
	$CI =& get_instance();
	return $CI->user_lib->is_speaker($go_after_login);	
}

function get_user_id() 
{
	$CI =& get_instance();
	return $CI->session->userdata('speaker_id');
}

function get_user_field($field) 
{
	$CI =& get_instance();
	return $CI->session->userdata($field);
}

if (! function_exists('_substr'))
{
	function _substr($str, $length, $minword = 3)
	{
		$sub = '';
		$len = 0;
	   
		foreach (explode(' ', $str) as $word)
		{
			$part = (($sub != '') ? ' ' : '') . $word;
			$sub .= $part;
			$len += strlen($part);
		   
			if (strlen($word) > $minword && strlen($sub) >= $length)
			{
				break;
			}
		}
	   
		return $sub . (($len < strlen($str)) ? ' [...]' : '');
	}
}

if ( ! function_exists('get_random_top_adv'))
{
	function get_random_top_adv($category=FALSE, $limit=3)
	{
		$CI =& get_instance();
		$CI->load->model('Madvertisement');
		$items = $CI->Madvertisement->get_random_by_category($category, $limit);
		return $items->result_array();
		//....
	}
}
if ( ! function_exists('get_random_top_video'))
{
    function get_random_top_video($category=FALSE)
    {
        $CI =& get_instance();
        $CI->load->model('Mhome');
        $items = $CI->Mhome->get_random_by_video($category, 8);
        return $items->result_array();
        //....
    }
}

if ( ! function_exists('xm_generateRandStr'))
{
	function xm_generateRandStr($length)
	{
		$randstr = "";
		for ($i = 0; $i < $length; $i++) 
		{
			$randnum = mt_rand(0, 61);
			if ($randnum < 10) 
			{
			  $randstr .= chr($randnum + 48);
			} elseif ($randnum < 36) 
			{
			  $randstr .= chr($randnum + 55);
			} else 
			{
			  $randstr .= chr($randnum + 61);
			}
		}
		return $randstr;
	}
}

if ( ! function_exists('xm_generateRandID'))
{
	function xm_generateRandID()
    {
        return md5(xm_generateRandStr(16));
    }
}


if ( ! function_exists('url_title'))
{
	function url_title($str)
	{
		$trans = array(' ' => '-', '-' => '--');
		echo strtr($str,$trans);
	}
}

if ( ! function_exists('rev_url_title'))
{
	function rev_url_title($str)
	{
		$trans = array('-' => ' ', '--' => '-');
		echo strtr($str,$trans);
	}	 
}

if ( ! function_exists('dropdown_data'))
{
	function dropdown_data($setting)
	{
		$CI =& get_instance();
		if (! array_key_exists('order',$setting))
		{
			$CI->db->order_by($setting['value_field'],'asc');
		}
		else
		{
			$CI->db->order_by($setting['order']);
		}
		$query = $CI->db->get($setting['table_name']);		
		$options = array();
		if (isset($setting['init_data']))
		{
			$options[$setting['init_data']['key']] = $setting['init_data']['name'];
		}
		foreach ($query->result() as $row)
		{
			$options[$row->$setting['key_field']] = $row->$setting['value_field'];
		}
		return $options;
	}	 
}


function get_languages( $feature, $spare='' )
{
	// get the languages
	$a_languages = array(
	'af' => 'Afrikaans',
	'sq' => 'Albanian',
	'ar-dz' => 'Arabic (Algeria)',
	'ar-bh' => 'Arabic (Bahrain)',
	'ar-eg' => 'Arabic (Egypt)',
	'ar-iq' => 'Arabic (Iraq)',
	'ar-jo' => 'Arabic (Jordan)',
	'ar-kw' => 'Arabic (Kuwait)',
	'ar-lb' => 'Arabic (Lebanon)',
	'ar-ly' => 'Arabic (libya)',
	'ar-ma' => 'Arabic (Morocco)',
	'ar-om' => 'Arabic (Oman)',
	'ar-qa' => 'Arabic (Qatar)',
	'ar-sa' => 'Arabic (Saudi Arabia)',
	'ar-sy' => 'Arabic (Syria)',
	'ar-tn' => 'Arabic (Tunisia)',
	'ar-ae' => 'Arabic (U.A.E.)',
	'ar-ye' => 'Arabic (Yemen)',
	'ar' => 'Arabic',
	'hy' => 'Armenian',
	'as' => 'Assamese',
	'az' => 'Azeri',
	'eu' => 'Basque',
	'be' => 'Belarusian',
	'bn' => 'Bengali',
	'bg' => 'Bulgarian',
	'ca' => 'Catalan',
	'zh-cn' => 'Chinese (China)',
	'zh-hk' => 'Chinese (Hong Kong SAR)',
	'zh-mo' => 'Chinese (Macau SAR)',
	'zh-sg' => 'Chinese (Singapore)',
	'zh-tw' => 'Chinese (Taiwan)',
	'zh' => 'Chinese',
	'hr' => 'Croatian',
	'cs' => 'Czech',
	'da' => 'Danish',
	'div' => 'Divehi',
	'nl-be' => 'Dutch (Belgium)',
	'nl' => 'Dutch (Netherlands)',
	'en-au' => 'English (Australia)',
	'en-bz' => 'English (Belize)',
	'en-ca' => 'English (Canada)',
	'en-ie' => 'English (Ireland)',
	'en-jm' => 'English (Jamaica)',
	'en-nz' => 'English (New Zealand)',
	'en-ph' => 'English (Philippines)',
	'en-za' => 'English (South Africa)',
	'en-tt' => 'English (Trinidad)',
	'en-gb' => 'English (United Kingdom)',
	'en-us' => 'English (United States)',
	'en-zw' => 'English (Zimbabwe)',
	'en' => 'English',
	'us' => 'English (United States)',
	'et' => 'Estonian',
	'fo' => 'Faeroese',
	'fa' => 'Farsi',
	'fi' => 'Finnish',
	'fr-be' => 'French (Belgium)',
	'fr-ca' => 'French (Canada)',
	'fr-lu' => 'French (Luxembourg)',
	'fr-mc' => 'French (Monaco)',
	'fr-ch' => 'French (Switzerland)',
	'fr' => 'French (France)',
	'mk' => 'FYRO Macedonian',
	'gd' => 'Gaelic',
	'ka' => 'Georgian',
	'de-at' => 'German (Austria)',
	'de-li' => 'German (Liechtenstein)',
	'de-lu' => 'German (Luxembourg)',
	'de-ch' => 'German (Switzerland)',
	'de' => 'German (Germany)',
	'el' => 'Greek',
	'gu' => 'Gujarati',
	'he' => 'Hebrew',
	'hi' => 'Hindi',
	'hu' => 'Hungarian',
	'is' => 'Icelandic',
	'id' => 'Indonesian',
	'it-ch' => 'Italian (Switzerland)',
	'it' => 'Italian (Italy)',
	'ja' => 'Japanese',
	'kn' => 'Kannada',
	'kk' => 'Kazakh',
	'kok' => 'Konkani',
	'ko' => 'Korean',
	'kz' => 'Kyrgyz',
	'lv' => 'Latvian',
	'lt' => 'Lithuanian',
	'ms' => 'Malay',
	'ml' => 'Malayalam',
	'mt' => 'Maltese',
	'mr' => 'Marathi',
	'mn' => 'Mongolian (Cyrillic)',
	'ne' => 'Nepali (India)',
	'nb-no' => 'Norwegian (Bokmal)',
	'nn-no' => 'Norwegian (Nynorsk)',
	'no' => 'Norwegian (Bokmal)',
	'or' => 'Oriya',
	'pl' => 'Polish',
	'pt-br' => 'Portuguese (Brazil)',
	'pt' => 'Portuguese (Portugal)',
	'pa' => 'Punjabi',
	'rm' => 'Rhaeto-Romanic',
	'ro-md' => 'Romanian (Moldova)',
	'ro' => 'Romanian',
	'ru-md' => 'Russian (Moldova)',
	'ru' => 'Russian',
	'sa' => 'Sanskrit',
	'sr' => 'Serbian',
	'sk' => 'Slovak',
	'ls' => 'Slovenian',
	'sb' => 'Sorbian',
	'es-ar' => 'Spanish (Argentina)',
	'es-bo' => 'Spanish (Bolivia)',
	'es-cl' => 'Spanish (Chile)',
	'es-co' => 'Spanish (Colombia)',
	'es-cr' => 'Spanish (Costa Rica)',
	'es-do' => 'Spanish (Dominican Republic)',
	'es-ec' => 'Spanish (Ecuador)',
	'es-sv' => 'Spanish (El Salvador)',
	'es-gt' => 'Spanish (Guatemala)',
	'es-hn' => 'Spanish (Honduras)',
	'es-mx' => 'Spanish (Mexico)',
	'es-ni' => 'Spanish (Nicaragua)',
	'es-pa' => 'Spanish (Panama)',
	'es-py' => 'Spanish (Paraguay)',
	'es-pe' => 'Spanish (Peru)',
	'es-pr' => 'Spanish (Puerto Rico)',
	'es-us' => 'Spanish (United States)',
	'es-uy' => 'Spanish (Uruguay)',
	'es-ve' => 'Spanish (Venezuela)',
	'es' => 'Spanish (Traditional Sort)',
	'sx' => 'Sutu',
	'sw' => 'Swahili',
	'sv-fi' => 'Swedish (Finland)',
	'sv' => 'Swedish',
	'syr' => 'Syriac',
	'ta' => 'Tamil',
	'tt' => 'Tatar',
	'te' => 'Telugu',
	'th' => 'Thai',
	'ts' => 'Tsonga',
	'tn' => 'Tswana',
	'tr' => 'Turkish',
	'uk' => 'Ukrainian',
	'ur' => 'Urdu',
	'uz' => 'Uzbek',
	'vi' => 'Vietnamese',
	'xh' => 'Xhosa',
	'yi' => 'Yiddish',
	'zu' => 'Zulu' );
	
	$index = '';
	$complete = '';
	$found = false;// set to default value
	//prepare user language array
	$user_languages = array();

	//check to see if language is set
	if ( isset( $_SERVER["HTTP_ACCEPT_LANGUAGE"] ) )
	{
		$languages = strtolower( $_SERVER["HTTP_ACCEPT_LANGUAGE"] );
		// $languages = ' fr-ch;q=0.3, da, en-us;q=0.8, en;q=0.5, fr;q=0.3';
		// need to remove spaces from strings to avoid error
		$languages = str_replace( ' ', '', $languages );
		$languages = explode( ",", $languages );
		//$languages = explode( ",", $test);// this is for testing purposes only

		foreach ( $languages as $language_list )
		{
			// pull out the language, place languages into array of full and primary
			// string structure:
			$temp_array = array();
			// slice out the part before ; on first step, the part before - on second, place into array
			$temp_array[0] = substr( $language_list, 0, strcspn( $language_list, ';' ) );//full language
			$temp_array[1] = substr( $language_list, 0, 2 );// cut out primary language
			//place this array into main $user_languages language array
			$user_languages[] = $temp_array;
		}

		//start going through each one
		for ( $i = 0; $i < count( $user_languages ); $i++ )
		{
			foreach ( $a_languages as $index => $complete )
			{
				if ( $index == $user_languages[$i][0] )
				{
					// complete language, like english (canada)
					$user_languages[$i][2] = $complete;
					// extract working language, like english
					$user_languages[$i][3] = substr( $complete, 0, strcspn( $complete, ' (' ) );
				}
			}
		}
	}
	else// if no languages found
	{
		$user_languages[0] = array( '','','','' ); //return blank array.
	}
	// print_r($user_languages);
	// return parameters
	if ( $feature == 'data' )
	{
		return $user_languages;
	}

	// this is just a sample, replace target language and file names with your own.
	elseif ( $feature == 'header' )
	{
		return $user_languages[0][1];
		// switch ( $user_languages[0][1] )
		// {
			// case 'vi':
				// return 'fr';
				// break;
			// case 'fr':
				// return 'fr';
				// break;				
			// default:
				// return 'en';
				// break;
		// }
	}
}

// if ( ! function_exists('sanitize'))
// {
	// function sanitize($string, $trim = false)
	// {
	  // $string = filter_var($string, FILTER_SANITIZE_STRING);
	  // $string = trim($string);
	  // $string = stripslashes($string);
	  // $string = strip_tags($string);
	  // $string = str_replace(array('‘', '’', '“', '”'), array("'", "'", '"', '"'), $string);
	  // if ($trim)
		  // $string = substr($string, 0, $trim);
	  
	  // return $string;
	// }
// }
/* End of file xemmex_helper.php */ 
/* Location: ./system/application/helpers/xemmex_helper.php */ 
