<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Image_lib extends CI_Image_lib
{
    function convert($type = 'jpg', $delete_orig = FALSE)
    {
        $this->full_dst_path = $this->dest_folder . end($this->explode_name($this->dest_image)) . '.' . $type;
        
        if (!($src_img = $this->image_create_gd()))
        {
            return FALSE;
        }
        
        if ($this->image_library == 'gd2' AND function_exists('imagecreatetruecolor'))
        {
            $create = 'imagecreatetruecolor';
            $copy = 'imagecopyresampled';
        }
        else
        {
            $create = 'imagecreate';
            $copy = 'imagecopyresized';
        }

        $dst_img = $create($this->width, $this->height);
        $copy($dst_img, $src_img, 0, 0, 0, 0, $this->width, $this->height, $this->width, $this->height);
        
        $types = array('gif' => 1, 'jpg' => 2, 'jpeg' => 2, 'png' => 3);
        
        $this->image_type = $types[$type];
        
        if ($delete_orig)
        {
            unlink($this->full_src_path);        
        }

        if ($this->dynamic_output == TRUE)
        {
            $this->image_display_gd($dst_img);
        }
        else
        {
            if (!$this->image_save_gd($dst_img))
            {
                return FALSE;
            }
        }

        imagedestroy($dst_img);
        imagedestroy($src_img);

        @chmod($this->full_dst_path, DIR_WRITE_MODE);

        return TRUE;
    }    
}
/*
Usage----
$config['source_image'] = './uploads/my_pic.png';
$this->image_lib->initialize($config); 
$this->image_lib->convert('jpg', TRUE); 
*/
/* End of file MY_Image_lib.php */
/* Location: ./application/libraries/MY_Image_lib.php */ 