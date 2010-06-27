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
        $converted_name = $destFolder.$name.'.flv';
        $this->audioBitRate = 22050;
		$this->audioBitRate = 32;		
		//$cmd = $ffmpegPath . " -i " . $this->filename . " -ar " . $this->audioSampleRate . " -ab " . $this->audioBitRate . " -f flv -s " . $this->videoWidth . "x" . $this->videoHeight .  " | " . $flvtool2Path . " -U stdin " . $converted_name;
		$cmd = $ffmpegPath . " -i " . $this->filename . " -ar 22050 -ab 32 -f flv -s 320x240 " . $converted_name;		
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

}
// END VIDEO Class 