<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
require_once "phpuploader/include_phpuploader.php"; 
/**
* Video library Class
*
* @package		Confor
* @subpackage	Libraries
* @category		Video
* @author		Nguyen Hai Dang - XEMMEX developer
*/

// define('FFMPEG_BINARY', '/usr/local/bin/ffmpeg');
// define('FFMPEG_FLVTOOLS_BINARY', '/usr/bin/flvtool2');
define('FFMPEG_BINARY', 'c:/ffmpeg/ffmpeg.exe');
define('FFMPEG_FLVTOOLS_BINARY', 'c:/ffmpeg/flvtool2.exe');
define('FFMPEG_TYPE', 'static');

// define('VBRATE', 500000);
// define('SRATE', 22050);
// define('SBRATE', 32);
// define('R_HEIGHT', 380);
// define('R_WIDTH', 620);
// define('RESIZE', 'yes');
// define('KEEP_ORIGINAL', 0);
// define('MAX_UPLOAD_SIZE', 600);



class Video_upload_lib {
	
	//var $videoObj;
	var $_media_data = FALSE;
	var $ajax_link = '';
	var $uploader;
	
	var $temp_path = './temp/';
	var $upload_folder = './videos/';
	var $upload_folder_thumb = './thumbs/';	
	var $temp_expiration = 3600;
	var $convert_cmd = FFMPEG_BINARY;
	var $video_table_name = 'videos';
		
	var $default_video_settings = array(
		'allowed_ext' => "*.avi,*.mp4,*.flv,*.mpg,*.asf,*.3gp,*.mmv,*.mpe,*.mpeg,*.ogv,*.rm,*.wmv,*.ts",
		'resize_w' => 320,
		'resize_h' => 240,
		'thumb_w' => 128,
		'thumb_w' => 96,
		'max_upload_size' =>600,
		'vbrate' => 5000000,
		'sbrate' => 64,
		'srate' => 22050,
		'ratio' => "4:3",
		'thumb_frame' => 20,
		'thumb_time_get' => 10,
		'is_resize' => 1,
		'keep_ratio' => 1
	);
	
	var $video_settings = FALSE;
	
	/**
	* Formats supported
	* 3g2             3gp2 format
	* 3gp             3gp format
	* aac             ADTS AAC
	* aiff            Audio IFF
	* amr             3gpp amr file format
	* asf             asf format
	* avi             avi format
	* flv             flv format
	* gif             GIF Animation
	* mov             mov format
	* mov,mp4,m4a,3gp,3g2,mj2 QuickTime/MPEG4/Motion JPEG 2000 format
	* mp2             MPEG audio layer 2
	* mp3             MPEG audio layer 3
	* mp4             mp4 format
	* mpeg            MPEG1 System format
	* mpeg1video      MPEG video
	* mpeg2video      MPEG2 video
	* mpegvideo       MPEG video
	* psp             psp mp4 format
	* rm              rm format
	* swf             Flash format
	* vob             MPEG2 PS format (VOB)
	* wav             wav format
	* jpeg            mjpeg format
	* yuv4mpegpipe    yuv4mpegpipe format
	*/
	
	/**
	* Size Presets
	*/
	// const SIZE_SAS	 			= 'SameAsSource';
	// const SIZE_SQCIF 			= '128x96';
	// const SIZE_QCIF 			= '176x144';
	// const SIZE_CIF 				= '352x288';
	// const SIZE_4CIF 			= '704x576';
	// const SIZE_QQVGA 			= '160x120';
	// const SIZE_QVGA 			= '320x240';
	// const SIZE_VGA 				= '640x480';
	// const SIZE_SVGA 			= '800x600';
	// const SIZE_XGA 				= '1024x768';
	// const SIZE_UXGA 			= '1600x1200';
	// const SIZE_QXGA 			= '2048x1536';
	// const SIZE_SXGA 			= '1280x1024';
	// const SIZE_QSXGA 			= '2560x2048';
	// const SIZE_HSXGA 			= '5120x4096';
	// const SIZE_WVGA 			= '852x480';
	// const SIZE_WXGA 			= '1366x768';
	// const SIZE_WSXGA 			= '1600x1024';
	// const SIZE_WUXGA 			= '1920x1200';
	// const SIZE_WOXGA 			= '2560x1600';
	// const SIZE_WQSXGA 			= '3200x2048';
	// const SIZE_WQUXGA 			= '3840x2400';
	// const SIZE_WHSXGA 			= '6400x4096';
	// const SIZE_WHUXGA 			= '7680x4800';
	// const SIZE_CGA 				= '320x200';
	// const SIZE_EGA				= '640x350';
	// const SIZE_HD480 			= '852x480';
	// const SIZE_HD720 			= '1280x720';
	// const SIZE_HD1080			= '1920x1080';
	
	/**
	* Ratio Presets
	*/
	// const RATIO_STANDARD		= '4:3';
	// const RATIO_WIDE			= '16:9';
	// const RATIO_CINEMATIC		= '1.85';	
	
	
	function Video_upload_lib()
	{    
		$this->CI =& get_instance();
		$this->load_setting_from_db();
		set_time_limit(3600);
	}
	
	function load_setting_from_db()
	{
		$this->video_settings = $this->get_video_setting();
		if ($this->video_settings == FALSE)
		{
			$this->video_settings = $this->default_video_settings;
		}
	}
	
	function get_video_setting()
	{
		$this->CI->db->limit(1);
		$query = $this->CI->db->get('video_settings');
		if ($query->num_rows()<1) 
		{
			return FALSE;
		}
		else 
		{
			return $query->row_array();
		}						
	}
	
	function set_video_setting($data)
	{
		$this->CI->db->where('id', 1);
		$this->CI->db->update('video_settings', $data);	
	}
		
	function init()
	{
		$this->uploader = new PhpUploader();        
		$this->uploader->InsertText = "Select files (Max ".$this->video_settings['max_upload_size']."Mb)";
		$this->uploader->Name = "vid_uploader";
		$this->uploader->MaxSizeKB = $this->video_settings['max_upload_size']*1024*1024;
		$this->uploader->AllowedFileExtensions = $this->video_settings['allowed_ext'];
		$this->uploader->MultipleFilesUpload = false;
		$this->uploader->ManualStartUpload = true;
		$this->uploader->MaxFilesLimit = 1; 
		$this->uploader->UploadType = "Flash";
	}	
			
	// TEMP
	function do_with_temp($new_name, $ext)
	{
		$this->remove_temp_expired(time()-$this->temp_expiration);
		$this->add_temp($new_name);
		$uname = $this->CI->input->post('uname');
		$is_convert = TRUE;				
		
		$this->video_settings['thumb_time_get'] = 10;
		if ($this->get_video_info($this->temp_path.$new_name))
		{
			if ($this->_media_data['duration']['seconds']>0)
			$this->video_settings['thumb_time_get'] = round($this->_media_data['duration']['seconds']/2);
		}		
		
		if (strtolower($ext) == 'flv')
		{
			$temp_name = $this->temp_path.$new_name;
			$cname = $this->temp_path.$new_name.'.flv';
			copy($temp_name,$cname);			
			$this->create_thumb($this->temp_path, $new_name);
			unlink($this->temp_path.$new_name);
			$is_convert = FALSE;
		}		
		
		if ($is_convert)
		{
			$this->convert_to_flv($new_name);
			unlink($this->temp_path.$new_name);	
		}
		
		if (file_exists($this->temp_path.$new_name.'.flv') && (filesize($this->temp_path.$new_name.'.flv')>0))
		{
			echo $new_name;
			if (strlen($uname)>1)
			{
				$this->remove_temp($uname);				
			}
		}
		else
		{
			echo 0;
			return;
		}					
	}
	// add temp file to database
	function add_temp($new_name)
	{
		$video_save = array(
		'expire'		=> time(),
		'ip_address' 	=> $this->CI->input->ip_address(),
		'filename'		=> $new_name
		);
		$query = $this->CI->db->insert_string('video_temps', $video_save);		
		$this->CI->db->query($query);
		
	}
	// remove temp from database
	function remove_temp($fname)
	{
		$this->CI->db->where('filename',$fname);
		$this->CI->db->delete('video_temps');
		$this->remove_temp_video_file($fname);
	}
	
	function remove_temp_expired($expiration)
	{		
		$this->CI->db->where('expire < ', $expiration);
		$query = $this->CI->db->get('video_temps'); 
		foreach ($query->result() as $row)
		{			
			$this->remove_temp_video_file($row->filename);
		}

		$this->CI->db->where('expire < ', $expiration);
		$this->CI->db->delete('video_temps'); 
	}	
	
	function remove_temp_video_file($uname)
	{
		$video = $this->temp_path.$uname.'.flv';
		$thumb = $this->temp_path.$uname.'.jpg';
		if (file_exists($video)) unlink($video);
		if (file_exists($thumb)) unlink($thumb);
		return TRUE;
	}	
	
	// check uploaded temp file expiration (validation callback function)
	function is_correct_video($fname)
	{
		$expiration = time()-$this->temp_expiration; 
		$this->remove_temp_expired($expiration);
		$sql = "SELECT COUNT(*) AS count FROM video_temps WHERE filename = ? AND ip_address = ? AND expire > ?";
		$binds = array($fname, $this->CI->input->ip_address(), $expiration);
		$query = $this->CI->db->query($sql, $binds);
		$row = $query->row();
		if ($row->count == 0)
		{
			return false;
		}	
		return true;		
	}
	
	// ajax response
	function do_upload_ajax()
	{	
		$fileguid=@$_POST["vid_uploader"];    
		if($fileguid)    
		{    
			//get the uploaded file based on GUID    
			$mvcfile=$this->uploader->GetUploadedFile($fileguid);    
			if($mvcfile)
			{    			
				$fname = $mvcfile->FileName;
				$ext = end(explode(".", $fname));
				$new_name = $this->make_unique_name();
											
				$mvcfile->CopyTo($this->temp_path.$new_name); 
				$mvcfile->Delete();
				$this->do_with_temp($new_name, $ext);
				return;
			}
		}
		echo 0;			
	}
	
	function add_new_video($data, $uname)
	{
		$this->remove_temp_expired(time()-$this->temp_expiration);
		if (file_exists($this->temp_path.$uname.'.flv') && (filesize($this->temp_path.$uname.'.flv')>0))
		{			
			$data['vhash'] = $uname.'.flv';
			$data['shash'] = $uname.'.jpg';
			copy($this->temp_path.$uname.'.flv',$this->upload_folder.$uname.'.flv');
			copy($this->temp_path.$uname.'.jpg',$this->upload_folder_thumb.$uname.'.jpg');
			$this->remove_temp($uname);
			$this->CI->db->insert($this->video_table_name, $data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}			
	
	function remove_video_by_vid_id($vid_id, $speaker_id=0)
	{
		$this->CI->db->select('vhash,shash');
		$this->CI->db->from($this->video_table_name);
		$this->CI->db->limit(1);
		$this->CI->db->where('vid_id', $vid_id);
		if ($speaker_id > 0) $this->CI->db->where('mem_id', $speaker_id);
		$result = $this->CI->db->get();
		if ($result->num_rows()<1) 
		{
			return FALSE;
		}
		else 
		{
			$item = $result->row();
			$video = $this->upload_folder.$item->vhash;
			$thumb = $this->upload_folder_thumb.$item->shash;
			if (file_exists($video)) unlink($video);
			if (file_exists($thumb)) unlink($thumb);
			$this->CI->db->where('vid_id', $vid_id);
			$this->CI->db->delete($this->video_table_name);
			return TRUE;
		}							
	}
				
	function convert_to_flv($fname)
	{				
		$temp_name = $this->temp_path.$fname;
		$cname = $this->temp_path.$fname.'.flv';
			
		$this->set_video_input($temp_name);
		$this->set_audio_sample_frequency();
		$this->set_audio_bitrate();		
		$this->set_format_to_flv();
		//$this->set_audio_codec();
		$this->set_video_bit_rate();
		$this->set_resize();
		//$this->set_video_codec('flv');
		//$this->set_video_frame_rate(25);
		$this->set_video_output($cname);
		
		exec($this->convert_cmd);		
		$this->add_meta_to_flv($cname);
		
		$this->create_thumb($this->temp_path, $fname);
	}		
	
	function set_video_input($path)
	{
		$this->convert_cmd .= ' -i '.$path;
	}
	
	function set_video_output($path)
	{
		$this->convert_cmd .= ' '.$path;
	}	
	
	function set_audio_codec()
	{
		$this->convert_cmd .= ' -acodec mp3';
	}
	
	function set_audio_bitrate()
	{
		$this->convert_cmd .= ' -ab '.$this->video_settings['sbrate'];
	}
	
	function set_audio_sample_frequency()
	{
		$this->convert_cmd .= ' -ar '.$this->video_settings['srate'];
	}

	function set_resize()
	{
		if ($this->video_settings['is_resize']==1)
		{	
		
			if ($this->_media_data == FALSE)
			{
				$this->convert_cmd .= ' -s '.$this->video_settings['resize_w'].'x'.$this->video_settings['resize_h'];
				return;
			}
			$scale = "";
			$original_width = $this->_media_data['video']['dimensions']['width'];
			$original_height = $this->_media_data['video']['dimensions']['height'];			
			if( $original_width > $original_height ) {
				if( $original_width > $this->video_settings['resize_w'] ) {
					$ratio = $this->video_settings['resize_w'] / $original_width;
					$new_height = round( $original_height * $ratio );
					$scale = " -s ".$this->video_settings['resize_w']."x".$new_height;
				}
			} else {
				if( $original_height > $this->video_settings['resize_h'] ) {
					$ratio = $this->video_settings['resize_h'] / $original_height;
					$new_width = round( $original_width * $ratio );
					$scale = " -s ".$new_width."x".$this->video_settings['resize_h'];
				}
			}
	
			if ($scale!="")
			{
				$this->convert_cmd .= $scale;
			}			
		}
	}
	
	function set_ratio()
	{
		if ($this->video_settings['keep_ratio']==0)
		{	
			$this->convert_cmd .= ' -aspect '.$this->video_settings['ratio'];
		}		
	}
	
	function set_format_to_flv()
	{
		$this->convert_cmd .= ' -f flv';
	}
	
	function set_video_bit_rate()
	{
		$this->convert_cmd .= ' -b '.$this->video_settings['vbrate'];
	}
	
	function set_video_codec($format)
	{	
		$this->convert_cmd .= ' -vcodec '.$format;
	}
	
	function set_video_frame_rate($fps)
	{
		$this->convert_cmd .= ' -r '.$fps;
	}
	
	function add_meta_to_flv($path)
	{
		$cmd = FFMPEG_FLVTOOLS_BINARY . ' -U ' . $path;
		exec($cmd);
	}
	
	function create_thumb($path, $fname)
	{
		$src = $path.$fname.'.flv';
		$dest = $path.$fname.'.jpg';
		//$cmd = FFMPEG_BINARY . " -i ". $src. " -vframes ".$this->video_settings['thumb_frame']." -an ";
		$cmd = FFMPEG_BINARY . " -i ". $src. " -vframes 1 -ss ".$this->video_settings['thumb_time_get']." -an ";
		$cmd .= "-s ".$this->video_settings['thumb_w']."x".$this->video_settings['thumb_h']." ";
		$cmd .= $dest;
		exec($cmd);
	}
	
	// --------------------------------------------------------------------
	// Used in the convertion pricess!
	function _makeMultipleTwo ($value)
	{
		$sType = gettype($value/2);
		return ($sType == "integer") ? $value : ($value-1);
	}	

	function make_unique_name()
	{
		return xm_generateRandStr(16).time();
		//return uniqid('v_'.time().'_');
	}
		
	function get_video_info($path)
	{	
		exec(FFMPEG_BINARY.' -i '.$path.' 2>&1', $buffer);
		$buffer = implode("\r\n", $buffer);	
		$data = array();
		preg_match_all('/Duration: (.*)/', $buffer, $matches);
		if(count($matches) > 0)
		{
			$parts 								= explode(', ', trim($matches[1][0]));
			$data['duration']					= array();
			$timecode					 		= $parts[0];
			$data['duration']['seconds'] 		= $this->timecodeToSeconds($timecode);
			$data['bitrate']  					= intval(ltrim($parts[2], 'bitrate: '));
			$data['duration']['start']  		= ltrim($parts[1], 'start: ');
			$data['duration']['timecode']		= array();
			$data['duration']['timecode']['rounded'] = substr($timecode, 0, 8);
			$data['duration']['timecode']['seconds'] = array();
			$data['duration']['timecode']['seconds']['exact']   = $timecode;
			$data['duration']['timecode']['seconds']['excess']  = intval(substr($timecode, 9));
		}
		
		preg_match('/Stream(.*): Video: (.*)/', $buffer, $matches);
		if(count($matches) > 0)
		{
			$data['video'] 						= array();
			preg_match('/([0-9]{1,5})x([0-9]{1,5})/', $matches[2], $dimensions_matches);
			// 					print_r($dimensions_matches);
			$dimensions_value = $dimensions_matches[0];
			$data['video']['dimensions'] 	= array(
			'width' 					=> floatval($dimensions_matches[1]),
			'height' 					=> floatval($dimensions_matches[2])
			);
			// 					get the framerate
			preg_match('/([0-9\.]+) (fps|tb)\(r\)/', $matches[0], $fps_matches);
			$data['video']['frame_rate'] 	= floatval($fps_matches[1]);
			$fps_value = $fps_matches[0];
			// 					get the ratios
			preg_match('/\[PAR ([0-9\:\.]+) DAR ([0-9\:\.]+)\]/', $matches[0], $ratio_matches);
			if(count($ratio_matches))
			{
				$data['video']['pixel_aspect_ratio'] 	= $ratio_matches[1];
				$data['video']['display_aspect_ratio'] 	= $ratio_matches[2];
			}
			// 					work out the number of frames
			if(isset($data['duration']) && isset($data['video']))
			{
				// 						set the total frame count for the video
				$data['video']['frame_count'] 						= ceil($data['duration']['seconds'] * $data['video']['frame_rate']);
				// 						set the framecode
				$frames												= ceil($data['video']['frame_rate']*($data['duration']['timecode']['seconds']['excess']/10));
				$data['duration']['timecode']['frames'] 			= array();
				$data['duration']['timecode']['frames']['exact']  	= $data['duration']['timecode']['rounded'].'.'.$frames;
				$data['duration']['timecode']['frames']['excess'] 	= $frames;
				$data['duration']['timecode']['frames']['total'] 	= $data['video']['frame_count'];
			}
			// 					formats should be anything left over, let me know if anything else exists
			$parts 							= explode(',', $matches[2]);
			$other_parts 					= array($dimensions_value, $fps_value);
			$formats = array();
			foreach($parts as $key=>$part)
			{
				$part = trim($part);
				if(!in_array($part, $other_parts))
				{
					array_push($formats, $part);
				}
			}
			$data['video']['pixel_format'] 	= $formats[1];
			$data['video']['codec'] 		= $formats[0];
		}
		
		// 				match the audio stream info
		preg_match('/Stream(.*): Audio: (.*)/', $buffer, $matches);
		if(count($matches) > 0)
		{
			// 					setup audio values
			$data['audio'] = array(
			'stereo'		=> -1, 
			'sample_rate'	=> -1, 
			'sample_rate'	=> -1
			);
			$other_parts = array();
			// 					get the stereo value
			preg_match('/(stereo|mono)/i', $matches[0], $stereo_matches);
			if(count($stereo_matches))
			{
				$data['audio']['stereo'] 		= $stereo_matches[0];
				array_push($other_parts, $stereo_matches[0]);
			}
			// 					get the sample_rate
			preg_match('/([0-9]{3,6}) Hz/', $matches[0], $sample_matches);
			if(count($sample_matches))
			{
				$data['audio']['sample_rate'] 	= count($sample_matches) ? floatval($sample_matches[1]) : -1;
				array_push($other_parts, $sample_matches[0]);
			}
			// 					get the bit rate
			preg_match('/([0-9]{1,3}) kb\/s/', $matches[0], $bitrate_matches);
			if(count($bitrate_matches))
			{
				$data['audio']['bitrate'] 		= count($bitrate_matches) ? floatval($bitrate_matches[1]) : -1;
				array_push($other_parts, $bitrate_matches[0]);
			}
			// 					formats should be anything left over, let me know if anything else exists
			$parts 							= explode(',', $matches[2]);
			$formats = array();
			foreach($parts as $key=>$part)
			{
				$part = trim($part);
				if(!in_array($part, $other_parts))
				{
					array_push($formats, $part);
				}
			}
			$data['audio']['codec'] 		= $formats[0];
		}		

		if(!count($data))
		{
			$data = FALSE;
		}
		else
		{
			$data['_raw_info'] = $buffer;
		}		
		$this->_media_data = $data;
		return $data;		
	}		
		
	/**
	 * Translates a timecode to the number of seconds.
	 * NOTE: this is now a depreciated, use formatTimecode() instead.
	 *
	 * @depreciated Use formatTimecode() instead.
	 * @access public
	 * @uses PHPVideoToolkit::formatTimecode()
	 * @param integer $input_seconds The number of seconds you want to calculate the timecode for.
	 */
	public function timecodeToSeconds($input_timecode='00:00:00')
	{
		return $this->formatTimecode($input_timecode, '%hh:%mm:%ss', '%st');
	}
	
	/**
	 * Translates a timecode to the number of seconds
	 *
	 * @access public
	 * @param integer $input_seconds The number of seconds you want to calculate the timecode for.
	 * @param integer $input_format The format of the timecode is being given in.
	 * 		default '%hh:%mm:%ss'
	 * 			- %hh (hours) representative of hours
	 * 			- %mm (minutes) representative of minutes
	 * 			- %ss (seconds) representative of seconds
	 * 			- %fn (frame number) representative of frames (of the current second, not total frames)
	 * 			- %ms (milliseconds) representative of milliseconds (of the current second, not total milliseconds) (rounded to 3 decimal places)
	 * 			- %ft (frames total) representative of total frames (ie frame number)
	 * 			- %st (seconds total) representative of total seconds (rounded).
	 * 			- %sf (seconds floored) representative of total seconds (floored).
	 * 			- %sc (seconds ceiled) representative of total seconds (ceiled).
	 * 			- %mt (milliseconds total) representative of total milliseconds. (rounded to 3 decimal places)
	 * 		Thus you could use an alternative, '%hh:%mm:%ss:%ms', or '%hh:%mm:%ss' dependent on your usage.
	 * @param integer $return_format The format of the timecode to return. The default is
	 * 		default '%ts'
	 * 			- %hh (hours) representative of hours
	 * 			- %mm (minutes) representative of minutes
	 * 			- %ss (seconds) representative of seconds
	 * 			- %fn (frame number) representative of frames (of the current second, not total frames)
	 * 			- %ms (milliseconds) representative of milliseconds (of the current second, not total milliseconds) (rounded to 3 decimal places)
	 * 			- %ft (frames total) representative of total frames (ie frame number)
	 * 			- %st (seconds total) representative of total seconds (rounded).
	 * 			- %sf (seconds floored) representative of total seconds (floored).
	 * 			- %sc (seconds ceiled) representative of total seconds (ceiled).
	 * 			- %mt (milliseconds total) representative of total milliseconds. (rounded to 3 decimal places)
	 * 		Thus you could use an alternative, '%hh:%mm:%ss:%ms', or '%hh:%mm:%ss' dependent on your usage.
	 * @param mixed|boolean|integer $frames_per_second The number of frames per second to translate for. If left false
	 * 		the class automagically gets the fps from PHPVideoToolkit::getFileInfo(), but the input has to be set
	 * 		first for this to work properly.
	 * @return float Returns the value of the timecode in seconds.
	 */
	public function formatTimecode($input_timecode, $input_format='%hh:%mm:%ss', $return_format='%ts', $frames_per_second=false)
	{
// 			first we must get the timecode into the current seconds
		$input_quoted 	= preg_quote($input_format);
		$placeholders 	= array('%hh', '%mm', '%ss', '%fn', '%ms', '%ft', '%st', '%sf', '%sc', '%mt');
		$seconds 		= 0;
		$input_regex 	= str_replace($placeholders, '([0-9]+)', preg_quote($input_format));
		preg_match('/'.$input_regex.'/', $input_timecode, $matches);
// 			work out the sort order for the placeholders
		$sort_table = array();
		foreach($placeholders as $key=>$placeholder)
		{
			if(($pos = strpos($input_format, $placeholder)) !== false)
			{
				$sort_table[$pos] = $placeholder;
			}
		}
		ksort($sort_table);
// 			check to see if frame related values are in the input
		$has_frames = strpos($input_format, '%fn') !== false;
		$has_total_frames = strpos($input_format, '%ft') !== false;
		if($has_frames || $has_total_frames)
		{
// 				if the fps is false then we must automagically detect it from the input file
			// if($frames_per_second === false)
			// {
				// $info = $this->getFileInfo();
				// if($info === false || (!isset($info['video']) || !isset($info['video']['frame_rate'])))
				// {
					// return -1;
				// }
				// $frames_per_second = $info['video']['frame_rate'];
			// }
		}			
// 			increment the seconds with each placeholder value
		$key = 1;
		foreach($sort_table as $placeholder)
		{
			if(!isset($matches[$key]))
			{
				break;
			}
			$value = $matches[$key];
			switch($placeholder)
			{
// 					time related ones
				case '%hh' : 
					$seconds += $value * 3600;
					break;
				case '%mm' : 
					$seconds += $value * 60;
					break;
				case '%ss' : 
				case '%sf' :
				case '%sc' :
					$seconds += $value;
					break;
				case '%ms' : 
					$seconds += floatval('0.'.$value);
					break;
				case '%st' : 
				case '%mt' :
					$seconds = $value;
					break 1;
					break;
// 					frame related ones
				case '%fn' : 
					$seconds += $value/$frames_per_second;
					break;
				case '%ft' : 
					$seconds = $value/$frames_per_second;
					break 1;
					break;
			}
			$key += 1;
		}
// 			then we just format the seconds
		return $this->formatSeconds($seconds, $return_format, $frames_per_second);
	}
	
	
	/**
	 * Translates a number of seconds to a timecode.
	 *
	 * @access public
	 * @param integer $input_seconds The number of seconds you want to calculate the timecode for.
	 * @param integer $return_format The format of the timecode to return. The default is
	 * 		default '%hh:%mm:%ss'
	 * 			- %hh (hours) representative of hours
	 * 			- %mm (minutes) representative of minutes
	 * 			- %ss (seconds) representative of seconds
	 * 			- %fn (frame number) representative of frames (of the current second, not total frames)
	 * 			- %ms (milliseconds) representative of milliseconds (of the current second, not total milliseconds) (rounded to 3 decimal places)
	 * 			- %ft (frames total) representative of total frames (ie frame number)
	 * 			- %st (seconds total) representative of total seconds (rounded).
	 * 			- %sf (seconds floored) representative of total seconds (floored).
	 * 			- %sc (seconds ceiled) representative of total seconds (ceiled).
	 * 			- %mt (milliseconds total) representative of total milliseconds. (rounded to 3 decimal places)
	 * 		Thus you could use an alternative, '%hh:%mm:%ss:%ms', or '%hh:%mm:%ss' dependent on your usage.
	 * @param mixed|boolean|integer $frames_per_second The number of frames per second to translate for. If left false
	 * 		the class automagically gets the fps from PHPVideoToolkit::getFileInfo(), but the input has to be set
	 * 		first for this to work properly.
	 * @return string|integer Returns the timecode, but if $frames_per_second is not set and a frame rate lookup is required 
	 * 		but can't be reached then -1 will be returned.
	 */
	public function formatSeconds($input_seconds, $return_format='%hh:%mm:%ss', $frames_per_second=false)
	{
		$timestamp 		= mktime(0, 0, $input_seconds, 0, 0);
		$floored 		= floor($input_seconds);
		$hours  		= date('H', $timestamp);
		$mins	  		= date('i', $timestamp);
		$searches 		= array();
		$replacements 	= array();
// 			these ones are the simple replacements
// 			replace the hours
		$using_hours = strpos($return_format, '%hh') !== false;
		if($using_hours)
		{
			array_push($searches, '%hh');
			array_push($replacements, $hours);
		}
// 			replace the minutes
		$using_mins = strpos($return_format, '%mm') !== false;
		if($using_mins)
		{
			array_push($searches, '%mm');
// 				check if hours are being used, if not and hours are required enable smart minutes
			if(!$using_hours && $hours > 0)
			{
				$value = ($hours * 60) + $mins;
			}
			else
			{
				$value = $mins;
			}
			array_push($replacements, $value);
		}
// 			replace the seconds
		if(strpos($return_format, '%ss') !== false)
		{
// 				check if hours are being used, if not and hours are required enable smart minutes
			if(!$using_mins && !$using_hours && $hours > 0)
			{
				$mins = ($hours * 60) + $mins;
			}
// 				check if mins are being used, if not and hours are required enable smart minutes
			if(!$using_mins && $mins > 0)
			{
				$value = ($mins * 60) + date('s', $timestamp);
			}
			else
			{
				$value = date('s', $timestamp);
			}
			array_push($searches, '%ss');
			array_push($replacements, $value);
		}
// 			replace the milliseconds
		if(strpos($return_format, '%ms') !== false)
		{
			$milli = round($input_seconds - $floored, 3);
			$milli = substr($milli, 2);
			$milli = empty($milli) ? '0' : $milli;
			array_push($searches, '%ms');
			array_push($replacements, $milli);
		}
// 			replace the total seconds (rounded)
		if(strpos($return_format, '%st') !== false)
		{
			array_push($searches, '%st');
			array_push($replacements, round($input_seconds));
		}
// 			replace the total seconds (floored)
		if(strpos($return_format, '%sf') !== false)
		{
			array_push($searches, '%sf');
			array_push($replacements, floor($input_seconds));
		}
// 			replace the total seconds (ceiled)
		if(strpos($return_format, '%sc') !== false)
		{
			array_push($searches, '%sc');
			array_push($replacements, ceil($input_seconds));
		}
// 			replace the total seconds
		if(strpos($return_format, '%mt') !== false)
		{
			array_push($searches, '%mt');
			array_push($replacements, round($input_seconds, 3));
		}
// 			these are the more complicated as they depend on $frames_per_second / frames per second of the current input
		$has_frames = strpos($return_format, '%fn') !== false;
		$has_total_frames = strpos($return_format, '%ft') !== false;
		if($has_frames || $has_total_frames)
		{
// 				if the fps is false then we must automagically detect it from the input file
			// if($frames_per_second === false)
			// {
				// $info = $this->getFileInfo();
				// if($info === false || (!isset($info['video']) || !isset($info['video']['frame_rate'])))
				// {
					// return -1;
				// }
				// $frames_per_second = $info['video']['frame_rate'];
			// }
// 				replace the frames
			$excess_frames = false;
			if($has_frames)
			{
				$excess_frames = ceil(($input_seconds - $floored) * $frames_per_second);
// 			print_r(array($input_seconds, $excess_frames));
				array_push($searches, '%fn');
				array_push($replacements, $excess_frames);
			}
// 				replace the total frames (ie frame number)
			if($has_total_frames)
			{
				$round_frames = $floored * $frames_per_second;
				if(!$excess_frames)
				{
					$excess_frames = ceil(($input_seconds - $floored) * $frames_per_second);
				}
				array_push($searches, '%ft');
				array_push($replacements, $round_frames + $excess_frames);
			}
		}
// 			print_r(array($searches, $replacements, $return_format));
// 			print_r(array($input_seconds, $timestamp, $return_format, str_replace($searches, $replacements, $return_format)));
		return str_replace($searches, $replacements, $return_format);
	}
	
}
