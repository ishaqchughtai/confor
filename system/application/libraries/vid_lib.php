<?php  if (!defined('BASEPATH')) exit('No direct script access allowed');
require_once "phpuploader/include_phpuploader.php"; 
/**
* User library Class
*
* @package		Confor
* @subpackage	Libraries
* @category		Video
* @author		Nguyen Hai Dang - XEMMEX developer
*/

define('FFMPEG_BINARY', '/usr/local/bin/ffmpeg');
define('FFMPEG_FLVTOOLS_BINARY', '/usr/bin/flvtool2');

define('VID_PATH', './videos/');
define('SCR_PATH', './thumbs/');
define('VID_TEMP_PATH', 'temp/');
							//Dang original format
define('VBRATE', 500000);	//500000
define('SRATE', 22050);		//22050
define('SBRATE', 32);		//22050
define('R_HEIGHT', 380);	//240
define('R_WIDTH', 620);		//320
define('RESIZE', 'yes');
define('KEEP_ORIGINAL', 0);
define('MAX_UPLOAD_SIZE', 600);
define('THUMB_HEIGHT', 90);
define('THUMB_WIDTH', 180);		//120
define('FFMPEG_TYPE', 'static');

class Vid_lib {
	var $allowed_ext = "*.avi,*.mp4,*.flv,*.mpg,*.asf,*.3gp,*.mmv,*.mpe,*.mpeg,*.ogv,*.rm,*.wmv,*.ts";
	var $filename  = '';
	var $videoWidth = 0;
	var $videoHeight = 0;
	var $videoFPS = 0;
	var $audioBitRate = 0;
	var $audioSampleRate = 0;
	var $duration = 0;    
	var $error_string = '';    
	var $videoObj;

	function Vid_lib()
	{    
		$this->CI =& get_instance();
	}
	
	function do_upload_ajax_admin()
	{
		if (! is_admin(FALSE)) 
		{
			echo '0';
			return;
		}		
		$this->_do_upload_ajax();
	}
	
	function do_upload_ajax_user()
	{
		if (! is_speaker(FALSE)) 
		{
			echo '0';
			return;
		}		
		$this->_do_upload_ajax();
	}	
	
	function _do_upload_ajax()
	{		
		$fileguid=@$_POST["myuploader"];    
		$is_convert = TRUE;
		if($fileguid)    
		{    
			//get the uploaded file based on GUID    
			$mvcfile=$this->CI->uploader->GetUploadedFile($fileguid);    
			if($mvcfile)    
			{    			
				$old_name = $this->CI->input->post('vname');
				$new_name = xm_generateRandStr(16);
								
				$ext = end(explode(".", $mvcfile->FileName));
				if (strtolower($ext) == 'flv')
				{
					$mvcfile->CopyTo("./".VID_PATH.$new_name.'.flv');
					$is_convert = FALSE;
				}
				
				$mvcfile->CopyTo("./".VID_TEMP_PATH.$new_name); 
				$mvcfile->Delete();
				
				$file = base_url().VID_TEMP_PATH.$new_name;								
				
				$this->load_video($file);
				if ($is_convert) $this->convert_to_flv(VID_PATH);
				$this->create_thumb(SCR_PATH.$new_name.'.jpg');
				if (file_exists("./".VID_TEMP_PATH.$new_name) && (filesize(VID_PATH.$new_name.'.flv')>0))
				{
					unlink("./".VID_TEMP_PATH.$new_name);					
					if (strlen($old_name)>1)
					{						
						// unlink(VID_PATH.$old_name.'.flv');
						// unlink(SCR_PATH.$old_name.'.jpg');
						$this->delete_old_data($old_name.'.flv', $old_name.'.jpg');
					}					
				} 
				else
				{					
					echo 0;
					return;
				}			
				echo $new_name;
				return;
			}
		}
		echo 0;		
	}
	
	function delete_old_data($vhash, $shash)
	{
		$vhash = VID_PATH.$vhash;
		$shash = SCR_PATH.$shash;
		if (file_exists($vhash)) unlink($vhash);
		if (file_exists($shash)) unlink($shash);
	}
	
	function init_uploader()
	{
		$this->CI->uploader = new PhpUploader();        
		$this->CI->uploader->InsertText = "Select files (Max ".MAX_UPLOAD_SIZE."Mb)";
		$this->CI->uploader->Name = "myuploader";
		$this->CI->uploader->MaxSizeKB = MAX_UPLOAD_SIZE*1024*1024;
		$this->CI->uploader->AllowedFileExtensions = $this->allowed_ext;
		$this->CI->uploader->MultipleFilesUpload = false;
		$this->CI->uploader->ManualStartUpload = true;
		$this->CI->uploader->MaxFilesLimit = 1; 
		$this->CI->uploader->UploadType = "Flash";
	}	
		
	// --------------------------------------------------------------------

	/**
	* Initialize preferences
	*
	* @access    public
	* @param    array
	* @return    void
	*/    

	function load_video($srcFile = '')
	{				
		// Create our FFMPEG-PHP object
		$this->videoObj = new ffmpeg_movie($srcFile);
		
		// Store the name of the file
		$this->filename = $srcFile;
		
		if(!empty($this->videoObj)):
		
		$this->videoWidth        = $this->_makeMultipleTwo($this->videoObj->getFrameWidth());
		$this->videoHeight        = $this->_makeMultipleTwo($this->videoObj->getFrameHeight());
		$this->videoFPS            = $this->videoObj->getFrameRate();
		$this->audioBitRate        = @intval($this->videoObj->getAudioBitRate()/1000);
		$this->audioSampleRate    = @$this->videoObj->getAudioSampleRate();
		$this->duration            = $this->videoObj->getDuration();
		
		else:
		$this->error_string = 'Unable to initiate video properly.';
		
		endif;
	}	
	
	// --------------------------------------------------------------------	
	/**
	* Convert the file to FLV
	*
	* @access    public
	* @param    array
	* @return    void
	*/    
	function convert_to_flv($destFolder)
	{				
		//list($name, $ext) = explode('.', basename($this->filename));		
		$converted_name = $destFolder.basename($this->filename).'.flv';
		$cmd = FFMPEG_BINARY . " -i " . $this->filename . " -ar ".SRATE." -ab ".SBRATE." -f flv -s ".R_WIDTH."x".R_HEIGHT." " . $converted_name;
		exec($cmd);
	}		
	
	// Take the current video object and creates a thumbail	
	function create_thumb($thumbFile)
	{
		if(!is_object($this->videoObj)) echo 'FALSE';
		
		// Pick a frame to use as the thumb, this is 1/8th through it    
		$captureFrame = round($this->videoObj->getFrameCount() / 3);
		
		$thumb=$this->videoObj->getFrame($captureFrame);
		if ($thumb) {

			$thumbImage = $thumb->toGDImage();
			if ($thumbImage) {

				imagejpeg($thumbImage,$thumbFile);
				imagedestroy($thumbImage);
				
				return true;
			}
		}    
		return false;
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

	
}
