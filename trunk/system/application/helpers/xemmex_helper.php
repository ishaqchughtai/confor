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
		
		
		// if (array_key_exists($lang, $lang_array)) 
		// {		
			// $CI->config->set_item('language', $lang_array[$lang]);
			// $CI->lang->load('confor', $lang_array[$lang]);
			// $CI->lang->load('cf', $lang_array[$lang]);
		// } 
		// else 
		// {
			// return FALSE;		
		// }
		
		if($CI->session->userdata('lang')) 
		{
			$lang = $CI->session->userdata('lang');
			if (array_key_exists($lang, $lang_array)) 
			{
				$CI->config->set_item('language', $lang_array[$lang]);
				$CI->lang->load('confor', $lang_array[$lang]);
				$CI->lang->load('cf', $lang_array[$lang]);
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
				$CI->lang->load('cf', $lang_array[$lang]);
			} 
			else 
			{
				return FALSE;		
			}
		}
		return $lang;
	}
}

function lang_name_by_short_key($lg, $return_bool=FALSE)
{
	$lang_array = array(
	'en' => 'english',
	'fr' => 'french',
	'ca' => 'french'
	);
	if (! array_key_exists($lg, $lang_array))	
	{
		if ($return_bool) return FALSE;
		return 'english';
	}	
	else
	{
		return $lang_array[$lg];
	}
}

function choose_your_language($lg=FALSE, $js='')
{
	$lang_option = array(
	'en' => 'English',
	'fr' => 'French'
	);	
	
	if ($lg==FALSE)
	{
		$CI =& get_instance();
		$lg = $CI->_data['lang'];
	}
	echo form_dropdown('lg', $lang_option, $lg,'id="lg" style="width:100px"'.$js);
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
	$CI =& get_instance();
	$file_lang = 'assets/'.$type.'/'.$CI->_data['lang'].'/'.$file;
	if (file_exists($file_lang))
	{
		$retval = base_url().$file_lang;
	}
	else
	{
		$retval = base_url().'assets/'.$type.'/'.$file;
	}
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
		$fckeditor->Value = $value;//html_entity_decode($value);
		$fckeditor->BasePath = $fckeditor_basepath;
		if( $fckeditor_toolbarset = $CI->config->item('fckeditor_toolbarset_default'))
		$fckeditor->ToolbarSet = $fckeditor_toolbarset;
		
		if( is_array($data) )
		{
			if( isset($data['value']) )
			$fckeditor->Value = $data['value'];//html_entity_decode($data['value']);
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
	return $CI->user_lib->is_speaker(FALSE, $go_after_login);	
}

function check_membership($memberships=FALSE, $go_after_login=TRUE, $auto_detect_url=TRUE)
{
	$CI =& get_instance();
	
	if ($auto_detect_url==TRUE) 
	{
		$c = $CI->uri->segment(1);
		$a = $CI->uri->segment(2);
		$CI->_memberships = $CI->MUser->get_membership_by_function(FALSE,$c.'/'.$a);
	}
	
	if (($CI->_memberships) && ($memberships==FALSE))
	{		
		$memberships = $CI->_memberships;
	}
	return $CI->user_lib->is_speaker($memberships, $go_after_login);
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
	function get_random_top_adv()
	{
		$CI =& get_instance();
		$element = $CI->_data['system_setting'];
		$value1 = $element['adv_position1'];
		$value2 = $element['adv_position2'];
		$value3 = $element['adv_position3'];
		$value4 = $element['adv_position4'];
		$CI->load->model('Madvertisement');
		$items = $CI->Madvertisement->get_pos($value1, $value2,$value3, $value4);
		//print_r($items);
		//return;
		$a2 = array();
		foreach($items as $item)
		{
				if ($item['ID'] == $value1) 
				{
					$a2[1] = $item;
				}
				if ($item['ID'] == $value2) 
				{
					$a2[2] = $item;
				}
				if ($item['ID'] == $value3) 
				{
					$a2[3] = $item;
				}
				if ($item['ID'] == $value4) 
				{
					$a2[4] = $item;
				}

		}
		return $a2;
		//....
	}
}
if ( ! function_exists('get_random_top_video'))
{
	function get_random_top_video($category=FALSE,$lg)
	{
		$CI =& get_instance();
		$CI->load->model('Mhome');
		$items = $CI->Mhome->get_random_by_video($category, 8,$lg);
		return $items->result_array();
		//....
	}
}
if ( ! function_exists('get_random_by_speaker'))
{
    function get_random_by_speaker($mem_id=FALSE)
    {
        $CI =& get_instance();
        $CI->load->model('Mhome');
        $items = $CI->Mhome->get_random_by_speaker($mem_id, 8);
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
		if (isset($setting['where']))
		{
			$CI->db->where($setting['where']);
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

function set_order_from_setting($table_name, $field_key, $sort_key, $date_field=FALSE)
{
	$CI =& get_instance();
	$CI->db->order_by($table_name.'.'.$CI->_setting[$field_key], $CI->_setting[$sort_key]);	
	if ($date_field!=FALSE)
	{
		if ($CI->_setting[$field_key]!=$date_field)
		{			
			$CI->db->order_by($table_name.'.'.$date_field, "desc");
		}			
	}

}

function config_pagination_style()
{
	$config['cur_tag_open'] = '<li class="selected"><a href="#">';
	$config['cur_tag_close'] = '</a></li>';	  
	$config['next_tag_open'] = '<li>';
	$config['next_tag_close'] = '</li>';	  
	$config['prev_tag_open'] = '<li>';
	$config['prev_tag_close'] = '</li>';	  
	$config['first_tag_open'] = '<li>';
	$config['first_tag_close'] = '</li>';	  
	$config['last_tag_open'] = '<li>';
	$config['last_tag_close'] = '</li>';	  	
	$config['num_tag_open'] = '<li>';
	$config['num_tag_close'] = '</li>';
	$config['next_link'] = __("CF_next");
	$config['prev_link'] = __("CF_previous");
	$config['last_link'] = __("CF_last");
	$config['first_link'] = __("CF_first");	
	return $config;
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

/**
* getDays()
* 
* @param mixed $number
* @param mixed $term
* @return
*/

function getDays($number, $term)
{
	switch ($term) {
	case 'D':
		return $number;
		break;
	case 'W':
		return($number * 7);
		break;
	case 'M':
		return($number * 31);
		break;
	case 'Y':
		return($number * 365);
		break;
	}
}

/**
* getTerm()
* 
* @param mixed $term
* @return
*/
function getTerm($term)
{
	switch ($term) {
	case 'D':
		return 'Days';
		break;
	case 'W':
		return 'Weeks';
		break;
	case 'M':
		return 'Months';
		break;
	case 'Y':
		return 'Years';
		break;
	}
}

/**
* getDifference()
* 
* @param mixed $startDate
* @param mixed $endDate
* @param integer $format
* @return
*/
function getDifference($startDate, $endDate, $format = 6)
{
	@list($date, $time) = explode(' ', $endDate);
	$startdate = explode("-", $date);
	$starttime = explode(":", $time);
	
	list($date, $time) = explode(' ', $startDate);
	$enddate = explode("-", $date);
	$endtime = explode(":", $time);
	
	$secondsDifference = @mktime($endtime[0], $endtime[1], $endtime[2], $enddate[1], $enddate[2], $enddate[0]) - @mktime($starttime[0], $starttime[1], $starttime[2], $startdate[1], $startdate[2], $startdate[0]);
	
	switch ($format) {
	case 0:
		return $secondsDifference;
	case 1:
		return floor($secondsDifference / 60);
	case 2:
		return floor($secondsDifference / 60 / 60);
	case 3:
		return floor($secondsDifference / 60 / 60 / 24);
	case 4:
		return floor($secondsDifference / 60 / 60 / 24 / 7);
	case 5:
		return floor($secondsDifference / 60 / 60 / 24 / 7 / 4);
	default:
		return floor($secondsDifference / 365 / 60 / 60 / 24);
	}
}

function get_archives()
{
	$CI =& get_instance();
	$CI->db->select('COUNT(vid_id) as vcount, date');
	$CI->db->where('lang',$CI->_data['lang']);
	$CI->db->group_by('MONTH(FROM_UNIXTIME(date))');
	$CI->db->from('videos');
	$result = $CI->db->get();
	$archives = array();
	$month_name_fr = array(
		'Janvier','Février','Mars','Avril','Mai','Juin','Juillet','Août','Septembre','Octobre','Novembre','Décembre'
	);
	//setlocale(LC_TIME, 'french');	
	foreach ($result->result_array() as $item)
	{
		
		$month = mdate("%m", $item['date']);
		$year = mdate("%o", $item['date']);
		$title = '';
		if ($CI->_data['lang']=='fr')
		{
			$title = $month_name_fr[intval($month)-1].' '.$year.' ('.$item['vcount'].')';
		}
		else
		{
			$title = mdate("%F %Y", $item['date']).' ('.$item['vcount'].')';
		}		
		$archives[] = array(
			'title'=> $title,
			'link'=>site_url('video/list_archives').'/'.$year.'/'.$month
		);						
	}				
	return $archives;
}

function remove_meta($id_resource, $type_resource)
{
	$CI =& get_instance();	
	$CI->db->where('type_resource',$type_resource);
	$CI->db->where('id_resource',$id_resource);	
	$CI->db->delete('tblmetadata');	
}

function get_info_for_adv()
{
	$CI =& get_instance();
	$out['video_blog_keyword'] = $CI->_data['video_blog_keyword'];	
	$out['speaker_name'] = $CI->_data['speaker_name'];	
	return $out;
	//return $CI->_data['video_blog_keyword'];
}

function email_template_parse($lg, $code, $ar_key, $ar_value)
{
	$CI =& get_instance();	
	$CI->db->where('lang',$lg);
	$CI->db->where('code',$code);
	//$query = $CI->db->get_where('confor_email_templates',array('id'=>$id));
	$query = $CI->db->get('confor_email_templates');
	if ($query->num_rows()<1) return FALSE;
	$row = $query->row();
	// example $ar_key = array('[NAME]', '[USERNAME]', '[PASSWORD]', '[URL]', '[SITE_NAME]')
	$body = str_replace($ar_key, $ar_value, $row->body);
	//$out['body'] = nl2br($body);
    $out['body'] = $body;
	$out['subject'] = $row->subject;
	return $out;
}
function out_static_page($code, $isMenu=TRUE)
{
     $CI =& get_instance(); 
     $CI->db->where('Lang',$CI->_data['lang']);
     $CI->db->where('Code',$code);
     $query = $CI->db->get('tblaccessories');
     if ($query->num_rows()<1) 
     {
          if ($isMenu) return '';
          return FALSE;
     }
     $row = $query->row();
     $out['link'] = site_url('/').$row->Link;
     $out['name'] = $row->ElementName;
     $out['body'] = $row->ElementContent;
     $out['code'] = $row->Code;
     if ($isMenu)
     {
        return '<a href="'.$out['link'].'" >'.$out['name'].'</a>';
     }
     return $out;
}
function out_static_page_no_lg($code, $isMenu=TRUE,$lg)
{
     $CI =& get_instance(); 
     $CI->db->where('Lang',$lg);
     $CI->db->where('Code',$code);
     $query = $CI->db->get('tblaccessories');
     if ($query->num_rows()<1) 
     {
          if ($isMenu) return '';
          return FALSE;
     }
     $row = $query->row();
     $out['link'] = site_url('/').'/'.$row->Link;
     $out['name'] = $row->ElementName;
     $out['body'] = $row->ElementContent;
     $out['code'] = $row->Code;
     $out['ID'] = $row->ID;
     $out['Lang'] = $row->Lang;
     if ($isMenu)
     {
        return '<a href="'.$out['link'].'" >'.$out['name'].'</a>';
     }
     return $out;
}
/* End of file xemmex_helper.php */ 
/* Location: ./system/application/helpers/xemmex_helper.php */ 
