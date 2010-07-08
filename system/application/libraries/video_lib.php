<?php 
/**
* CodeIgniter
*
* An open source application development framework for PHP 4.3.2 or newer
*
* @package        CodeIgniter
* @author        Rick Ellis
* @copyright    Copyright (c) 2006, EllisLab, Inc.
* @license        http://www.codeignitor.com/user_guide/license.html
* @link        http://www.codeigniter.com
* @since        Version 1.0
* @filesource
*/

// ------------------------------------------------------------------------

/**
* Video Class
*
* @package        CodeIgniter
* @subpackage    Libraries
* @category    Libraries
* @author        Philip Sturgeon
*/

define('FFMPEG_BINARY', '/usr/local/bin/ffmpeg');
define('FFMPEG_FLVTOOLS_BINARY', '/usr/bin/flvtool2');

define('VID_PATH', './videos/');
define('SCR_PATH', './thumbs/');
define('VID_TEMP_PATH', 'temp/');
define('VMAXRATE', 25);
define('VBRATE', 200);
define('SRATE', 22050);
define('SBRATE', 32);
define('R_HEIGHT', 240);
define('R_WIDTH', 320);
define('RESIZE', 'yes');
define('KEEP_ORIGINAL', 0);
define('MAX_UPLOAD_SIZE', 20);
define('THUMB_HEIGHT', 90);
define('THUMB_WIDTH', 120);
define('FFMPEG_TYPE', 'static');

define('ROOT', dirname(__FILE__));
define('BASEURL', $_SERVER['DOCUMENT_ROOT']);

class Video_lib {

    var $filename             = '';
    var $videoWidth            = 0;
    var $videoHeight        = 0;
    var $videoFPS            = 0;
    var $audioBitRate        = 0;
    var $audioSampleRate    = 0;
    var $duration            = 0;
    
    var $error_string = '';
    
    var $videoObj;
    var $CI;
    
    /**
     * Constructor - Sets Preferences
     *
     * The constructor can be passed an array of config values
     */    
    function Video_lib()
    {    
        $this->CI =& get_instance();
        //$this->CI->config->load('content');
        
        log_message('debug', "Video Class Initialized");
        
        if(extension_loaded('ffmpeg')):
            log_message('debug', "Video Class exited before finishing, missing the FFMPEG extention.");
            $this->error_string  = "ffmpeg extension not loaded";
        endif;
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
        $this->CI=& get_instance();
                        
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
    
    /**
     * Convert the file to FLV
     *
     * @access    public
     * @param    array
     * @return    void
     */    
    function convert_to_flv($destFolder)
    {
        $this->CI=& get_instance();
        
        $ffmpegPath = '/usr/local/bin/ffmpeg';//$this->CI->config->item('ffmpegPath');
        $flvtool2Path = '/usr/bin/flvtool2';//$this->CI->config->item('flvtool2Path');
        
        // Extention of file is...
        list($name, $ext) = explode('.', basename($this->filename));
        $cname = $destFolder.$name.'.flv';
		//$cmd = $ffmpegPath . " -i " . $this->filename . " -ar " . $this->audioSampleRate . " -ab " . $this->audioBitRate . " -f flv -s " . $this->videoWidth . "x" . $this->videoHeight .  " | " . $flvtool2Path . " -U stdin " . $converted_name;
		//$cmd = $ffmpegPath . " -i " . $this->filename . " -ar 22050 -ab 32 -f flv -s 320x240 " . $cname;		

		// $cmd = FFMPEG_BINARY . " -i " . $this->filename . " -vcodec flv -b ".VBRATE." -r 800". " -ar "
		// .SRATE." -ab ".SBRATE." -f flv -s "
		// .R_WIDTH."x".R_HEIGHT." ".$cname 
		// . " | " . FFMPEG_FLVTOOLS_BINARY . " -U " . $cname;		
		//$video_rate = min( VMAXRATE, $this->videoFPS );
		
		$cmd = FFMPEG_BINARY . " -i " . $this->filename . " -vcodec flv -b 200 -r 25". " -ar 22050"
		." -ab 32 -f flv -aspect 4:3 -s "
		.R_WIDTH."x".R_HEIGHT." ".$cname 
		. " | " . FFMPEG_FLVTOOLS_BINARY . " -Uv " . $cname. ' >> ./test/a2.tmp';
		
		
		echo $cmd;
		exec($cmd);
		
		return;
        // Call our convert using exec()
        //exec($ffmpegPath . " -i " . $this->filename . " -ar " . $this->audioSampleRate . " -ab " . $this->audioBitRate . " -f flv -s " . $this->videoWidth . "x" . $this->videoHeight . " " . $converted_name . " | " . $flvtool2Path . " -U stdin " . $converted_name);
		//exec($ffmpegPath . " -i " . $this->filename . " -ar " . 44100 . " -ab " . 64 . " -f flv -s " . 320 . "x" . 240 . " " . $converted_name . " | " . $flvtool2Path . " -U stdin " . $converted_name);
        // Delete the origional file if the new files size is more than 0
        if(file_exists($this->filename) && filesize($converted_name) > 0)
        {
            unlink($this->filename);
            $this->filename = $converted_name;    
        } else {
            log_message('debug', "Video convert error, new file size is 0");
			echo 'chan chua';
            return false;
        }
        
        // Check the new file exists, return true or false
        return (file_exists($this->filename));
    
    }
    
    // Take the current video object and creates a thumbail
    function create_thumb($thumbFile)
    {
        if(!is_object($this->videoObj)) echo 'FALSE';
        
        // Pick a frame to use as the thumb, this is 1/8th through it    
        //$captureFrame = round($this->videoObj->getFrameCount() / 3);
        
        $thumb=$this->videoObj->getFrame(20);

        if ($thumb) {

            $thumbImage = $thumb->toGDImage();
            if ($thumbImage) {

                    imagepng($thumbImage,$thumbFile);
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

	function exec( $cmd ) {
		# use bash to execute the command
		# add common locations for bash to the PATH
		# this should work in virtually any *nix/BSD/Linux server on the planet
		# assuming we have execute permission
		//$cmd = "PATH=\$PATH:/bin:/usr/bin:/usr/local/bin bash -c \"$cmd\" ";
		return shell_exec( $cmd );
	}	
	

	function calculate_size_padding( $parameters, $source_info, & $width, & $height, & $ratio, & $pad_top, & $pad_bottom, & $pad_left, & $pad_right ) {
		$p = $parameters;
		$i = $source_info;

		switch( $p['resize'] ) {
			# dont resize, use same size as source, and aspect ratio
			# WARNING: some codec will NOT preserve the aspect ratio
			case 'no':
				$width      = $i['video_width'   ];
				$height     = $i['video_height'  ];
				$ratio      = $i['video_wh_ratio'];
				$pad_top    = 0;
				$pad_bottom = 0;
				$pad_left   = 0;
				$pad_right  = 0;
				break;
			# resize to parameters width X height, use same aspect ratio
			# WARNING: some codec will NOT preserve the aspect ratio
			case 'WxH':
				$width  = $p['video_width'   ];
				$height = $p['video_height'  ];
				$ratio  = $i['video_wh_ratio'];
				$pad_top    = 0;
				$pad_bottom = 0;
				$pad_left   = 0;
				$pad_right  = 0;
				break;
			# make pixel square
			# reduce video size if bigger than p[width] X p[height]
			# and preserve aspect ratio
			case 'max':
				$width        = (float)$i['video_width'   ];
				$height       = (float)$i['video_height'  ];
				$ratio        = (float)$i['video_wh_ratio'];
				$max_width    = (float)$p['video_width'   ];
				$max_height   = (float)$p['video_height'  ];

				# make pixels square
				if( $ratio > 1.0 )
					$width = $height * $ratio;
				else
					$height = $width / $ratio;

				# reduce width
				if( $width > $max_width ) {
					$r       = $max_width / $width;
					$width  *= $r;
					$height *= $r;
				}

				# reduce height
				if( $height > $max_height ) {
					$r       = $max_height / $height;
					$width  *= $r;
					$height *= $r;
				}

				# make size even (required by many codecs)
				$width  = (integer)( ($width  + 1 ) / 2 ) * 2;
				$height = (integer)( ($height + 1 ) / 2 ) * 2;
				# no padding
				$pad_top    = 0;
				$pad_bottom = 0;
				$pad_left   = 0;
				$pad_right  = 0;
				break;
			# make pixel square
			# resize video to fit inside p[width] X p[height]
			# add padding and preserve aspect ratio
			case 'fit':
				# values need to be multiples of 2 in the end so
				# divide width and height by 2 to do the calculation
				# then multiply by 2 in the end
				$ratio        = (float)$i['video_wh_ratio'];
				$width        = (float)$i['video_width'   ] / 2;
				$height       = (float)$i['video_height'  ] / 2;
				$trt_width    = (float)$p['video_width'   ] / 2;
				$trt_height   = (float)$p['video_height'  ] / 2;

				# make pixels square
				if( $ratio > 1.0 )
					$width = $height * $ratio;
				else
					$height = $width / $ratio;
				
				# calculate size to fit
				$ratio_w = $trt_width  / $width;
				$ratio_h = $trt_height / $height;

				if( $ratio_h > $ratio_w ) {
					$width  = (integer)$trt_width;
					$height = (integer)($width / $ratio);
				} else {
					$height = (integer)$trt_height;
					$width  = (integer)($height * $ratio);
				}

				# calculate padding
				$pad_top    = (integer)(($trt_height - $height + 1) / 2);
				$pad_left   = (integer)(($trt_width  - $width  + 1) / 2);
				$pad_bottom = (integer)($trt_height  - $height - $pad_top );
				$pad_right  = (integer)($trt_width   - $width  - $pad_left);

				# multiply by 2 to undo division and get multiples of 2
				$width      *= 2;
				$height     *= 2;
				$pad_top    *= 2;
				$pad_left   *= 2;
				$pad_bottom *= 2;
				$pad_right  *= 2;
				break;
		}
	}

	function parse_format_info( $output, & $info ) {

		# search the output for specific patterns and extract info
		# check final encoding message
		if( ereg( 'Unknown format', $output, $args) ) {
			$Unkown = "Unkown";
		} else {
			$Unkown = "";
		}
		if( ereg( 'video:([0-9]+)kB audio:([0-9]+)kB global headers:[0-9]+kB muxing overhead', $output, $args ) ) {
			$video_size = (float)$args[1];
			$audio_size = (float)$args[2];
		} else {
			return false;
		}

		# check for last enconding update message
		if( ereg( '(frame=([^=]*) fps=[^=]* q=[^=]* L)?size=[^=]*kB time=([^=]*) bitrate=[^=]*kbits/s[^=]*$', $output, $args ) ) {
			$frame_count = $args[2] ? (float)$args[2] : 0;
			$duration    = (float)$args[3];
		} else {
			return false;
		}

		$info['duration'] = $duration;
		$info['bitrate' ] = (integer)($info['size'] * 8 / 1024 / $duration);
		if( $frame_count > 0 )
			$info['video_rate']	= (float)$frame_count / (float)$duration;
		if( $video_size > 0 )
			$info['video_bitrate']	= (integer)($video_size * 8 / $duration);
		if( $audio_size > 0 )
			$info['audio_bitrate']	= (integer)($audio_size * 8 / $duration);
			# get format information
		if( ereg( "Input #0, ([^ ]+), from", $output, $args ) ) {
			$info['format'] = $args[1];
		}

		# get video information
		if( ereg( 'Video: ([^ ]+), ([^ ]+), ([0-9]+)x([0-9]+)( \[PAR ([0-9]+):([0-9]+) DAR ([0-9]+):([0-9]+)\])?', $output, $args ) ) {
			$info['video_codec'  ] = $args[1];
			$info['video_color'  ] = $args[2];
			$info['video_width'  ] = $args[3];
			$info['video_height' ] = $args[4];
			if( $args[5] ) {
				$par1 = $args[6];
				$par2 = $args[7];
				$dar1 = $args[8];
				$dar2 = $args[9];
				if( (int)$dar1 > 0 && (int)$dar2 > 0  && (int)$par1 > 0 && (int)$par2 > 0 )
					$info['video_wh_ratio'] = ( (float)$dar1 / (float)$dar2 ) / ( (float)$par1 / (float)$par2 );
			}
			# laking aspect ratio information, assume pixel are square
			if( $info['video_wh_ratio'] === 'N/A' )
				$info['video_wh_ratio'] = (float)$info['video_width'] / (float)$info['video_height'];
		}

		# get audio information
		if( ereg( "Audio: ([^ ]+), ([0-9]+) Hz, ([^\n,]*)", $output, $args ) ) {
			$info['audio_codec'   ] = $args[1];
			$info['audio_rate'    ] = $args[2];
			$info['audio_channels'] = $args[3];
		}

		# check if file contains a video stream
		return $video_size > 0;

		#TODO allow files with no video (only audio)?
		#return true;
	}
	
	
}
// END VIDEO Class 