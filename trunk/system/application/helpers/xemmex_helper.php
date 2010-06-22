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

if (! function_exists('check_language'))
{
	function xemmex_language($lg = FALSE)	
	{
		$CI =& get_instance();
		
		$lang_array = array(
			'en' => 'english',
			'fr' => 'french',
			'vi' => 'vietnam'
		);
		
		if ($lg == FALSE) 
		{
			$lg = array_search($CI->config->item('language'), $lang_array);
		}
				
		$lang = $lg;
		
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

function is_admin($go_after_login=TRUE) {
	$CI =& get_instance();
	if ($CI->session->userdata('admin')) 
	{
		$admin_data = array
		(
			'admin_name' => $CI->session->userdata('admin_name'),
			'admin' => $CI->session->userdata('admin'),
			'id' => $CI->session->userdata('id'),
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

function is_speaker($go_after_login=TRUE) {
	$CI =& get_instance();
	
	if ($CI->session->userdata('speaker_id')) 
	{
		$speaker_data = array
		(
			'speaker_id' => $CI->session->userdata('speaker_id'),
			'speaker_email' => $CI->session->userdata('speaker_email'),
			'speaker_name' => $CI->session->userdata('speaker_name'),
			'lang' => $CI->session->userdata('lang'),			
			'speaker_subcription_name' => $CI->session->userdata('speaker_subcription_name'),
			'speaker_subscription_expiration' => $CI->session->userdata('speaker_subscription_expiration')
		);			
		return $speaker_data;
	} 
	else 
	{
		$email = $CI->Remember_me->check_remember_me();
		if ($email)
		{
			$query = $CI->MSpeaker->get_by_email($email);
			if ($query->num_rows() == 1) 
			{
				$row = $query->row();
				$speaker_data['speaker_id'] = $row->ID;
				$speaker_data['speaker_email'] = $row->Email;
				$speaker_data['speaker_name'] = $row->Name;
				$speaker_data['speaker_subcription_name'] = $row->TypeName;
				$speaker_data['speaker_expire'] = $row->SubscriptionExpiration;
				$speaker_data['lang'] = $row->Language;				
				$CI->session->set_userdata($speaker_data);
				return $speaker_data;												
			} 
		}
	}		 	
	
	if ($go_after_login==TRUE)
	{
		redirect('/');
	}
	return FALSE;
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

if ( ! function_exists('get_random_top_adv'))
{
	function get_random_top_adv($category=FALSE)
	{
		$CI =& get_instance();
		$CI->load->model('Madvertisement');
		$items = $CI->Madvertisement->get_random_by_category($category, 3);
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
        return md5($this->xm_generateRandStr(16));
    }
}	 

/* End of file xemmex_helper.php */ 
/* Location: ./system/application/helpers/xemmex_helper.php */ 
