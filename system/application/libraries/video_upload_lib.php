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

//define('FFMPEG_BINARY', '/usr/local/bin/ffmpeg');
//define('FFMPEG_FLVTOOLS_BINARY', '/usr/bin/flvtool2');
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
	
	var $videoObj;
	var $ajax_link = '';
	var $uploader;
	
	var $temp_path = './temp/';
	var $upload_folder = './videos/';
	var $upload_folder_thumb = './thumbs/';	
	var $temp_expiration = 300;
	var $convert_cmd = FFMPEG_BINARY;
		
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
		if (file_exists($this->temp_path.$uname.'.flv') && (filesize($this->temp_path.$uname.'.flv')>0))
		{			
			$data['vhash'] = $uname.'.flv';
			$data['shash'] = $uname.'.jpg';
			copy($this->temp_path.$uname.'.flv',$this->upload_folder.$uname.'.flv');
			copy($this->temp_path.$uname.'.jpg',$this->upload_folder_thumb.$uname.'.jpg');
			$this->remove_temp($uname);
			$this->CI->db->insert('videos', $data);
			return TRUE;
		}
		else
		{
			return FALSE;
		}
	}			
	
	function remove_video_by_vid_id($vid_id)
	{
		$this->CI->db->select('vhash,shash');
		$this->CI->db->from('videos');
		$this->CI->db->limit(1);
		$this->CI->db->where('vid_id', $vid_id);
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
			$this->CI->db->delete('videos');
			return TRUE;
		}							
	}
				
	function convert_to_flv($fname)
	{				
		$temp_name = $this->temp_path.$fname;
		$cname = $this->temp_path.$fname.'.flv';
		//copy($temp_name,$cname);
		//$cmd = FFMPEG_BINARY . " -i " . $temp_name  . " -ar ".SRATE." -ab ".SBRATE." -f flv -s ".R_WIDTH."x".R_HEIGHT." " . $cname;
		//exec($cmd);
		
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
			$this->convert_cmd .= ' -s '.$this->video_settings['resize_w'].'x'.$this->video_settings['resize_h'];
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
		$cmd = FFMPEG_BINARY . " -i ". $src. " -vframes ".$this->video_settings['thumb_frame']." -an ";
		$cmd .= "-s ".$this->video_settings['thumb_w']."x".$this->video_settings['thumb_h']." ";
		$cmd .= $dest;
		exec($cmd);
	}
	
	function get_video_info($path)
	{				
	}		
	
	// --------------------------------------------------------------------
	// Used in the convertion pricess!
	function _makeMultipleTwo ($value)
	{
		$sType = gettype($value/2);
		return ($sType == "integer") ? $value : ($value-1);
	}	

	function start_encoding( $parameters, $source_info, $lockfile ) {
		$ffmpeg = FFMPEG_BINARY;

		$p = & $parameters;
		$i = & $source_info;

		$opt_av = " -y ";
		$p['video_codec'];
		// Prepare the ffmpeg command to execute
		if(isset($p['extra_options']))
		$opt_av .= " -y {$p['extra_options']} ";

		// file format
		if(isset($p['format']))
		$opt_av .= " -f {$p['format']} ";
		// video codec, frame rate and bitrate
		$video_rate = min( $p['video_max_rate'], $i['video_rate'] );
		$opt_av .= " -vcodec {$p['video_codec']} -b {$p['video_bitrate']} -r $video_rate ";

		// video size, aspect and padding
		$this->calculate_size_padding( $p, $i, $width, $height, $ratio, $pad_top, $pad_bottom, $pad_left, $pad_right );
		$opt_av .= " -s {$width}x{$height} -aspect $ratio -padcolor 000000 -padtop $pad_top -padbottom $pad_bottom -padleft $pad_left -padright $pad_right ";
		
		// audio codec, rate and bitrate
		if(!empty($p['audio_codec']) && $p['audio_codec'] != 'None'){
			$opt_av .= " -acodec {$p['audio_codec']}";
		}
		// audio codec, rate and bitrate
		$opt_av .= " -ar {$p['audio_rate']} -ab {$p['audio_bitrate']} ";
		
		if(!isset($output))
		$output = "";
		//$lockfile = BASEDIR . "/files/temp/lock.tmp";
		// execute ffmpeg, send output to the log file, run in background, with low priority (niced)	
		//$this->exec("echo $ffmpeg -i {$p['path_source']} $opt_av {$p['path_target']} >> {$p['path_log']} ");
		$this->exec( "$ffmpeg -i '{$p['path_source']}' $opt_av '{$p['path_target']}' &> '{$p['path_log']}'" );
		
		// Adding FLVtool2 for addin video meta deta
		if(!empty($p['flvtool2'])){
			$this->exec( "{$p['flvtool2']} -U {$p['path_target']} >> '{$p['path_log']}'" );
			$opt_av .= " {$p['flvtool2']} -U {$p['path_target']} >> '{$p['path_log']}'";
		}
		
		$this->exec( "echo $ffmpeg -i {$p['path_source']} $opt_av {$p['path_target']} >> '{$p['path_log']}'" );
	}	

	function make_unique_name()
	{
		return xm_generateRandStr(16).time();
		//return uniqid('v_'.time().'_');
	}
}
