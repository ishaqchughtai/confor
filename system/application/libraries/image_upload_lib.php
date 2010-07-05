<?php 
/**
* Image Upload library Class
*
* @package		Confor
* @subpackage	Libraries
* @category		Uploader
* @author		Nguyen Hai Dang - XEMMEX developer
*/

require_once "phpuploader/include_phpuploader.php"; 
//define('ROOT', dirname(__FILE__));
define('DOC_ROOT', $_SERVER['DOCUMENT_ROOT']);

class Image_upload_lib {

	var $old_image = '';
	var $uploader;
	
	var $temp_path = '/temp/';
	var $upload_folder = './assets/uploads/image/';
	
	var $max_size = 2;
	var $allowed_ext = '.jpg, .gif, .png';
	var $ajax_link = '';
	var $max_width = 1024;
	var $max_height = 768;
	
	var $is_resize = TRUE;
	var $resize_w = 600;
	var $resize_h = 400;
	
	var $is_thumb = TRUE;
	var $thumb_w = 120;
	var $thumb_h = 90;
	
	var $ratio = TRUE;
	
    function Image_upload_lib()
    {    
        $this->CI =& get_instance();
    }
	
	
	function init()
	{
		$this->uploader = new PhpUploader();        						
		$this->uploader->InsertText = "Select file (Max ".$this->max_size."Mb)";		
		$this->uploader->Name = "image_uploader";
		$this->uploader->MaxSizeKB = $this->max_size*1024*1024;
		$this->uploader->AllowedFileExtensions = $this->allowed_ext;
		$this->uploader->MultipleFilesUpload = false;
		$this->uploader->ManualStartUpload = true;
		$this->uploader->MaxFilesLimit = 1; 
		$this->uploader->UploadType = "Flash";		
	}
	
	function delete_temp()
	{
		
	}
	
	function do_with_temp($new_name, $ext)
	{		
		$this->CI->load->library('image_lib');
				
		$uname = $this->CI->input->post('uname');
		
		$image_info = $this->CI->image_lib->get_image_properties($this->upload_folder.$new_name.'.'.$ext,TRUE);
		if ($image_info)
		{
			if (($image_info['width'] > $this->max_width)||($image_info['height'] > $this->max_height))
			{
				$this->remove_old_image($new_name.'.'.$ext);
				echo 0;
				return;
			}
		}
		
		$config['image_library'] = 'gd2';
		$config['maintain_ratio'] = $this->ratio;
						
		
		if ($this->is_thumb)
		{
			
			$config['source_image'] = $this->upload_folder.$new_name.'.'.$ext;
			$config['create_thumb'] = FALSE;
			$config['new_image'] = $this->upload_folder.'thumb_'.$new_name.'.'.$ext;			
			$config['width'] = $this->thumb_w;
			$config['height'] = $this->thumb_h;		
			$this->CI->image_lib->initialize($config); 
			if (!$this->CI->image_lib->resize()) 
			{
				echo '0';
				return;
			}
		}		
		
		if ($this->is_resize)
		{

			$config['source_image'] = $this->upload_folder.$new_name.'.'.$ext;
			//$config['new_image'] = '.'.$this->upload_folder.$new_name.'.'.$ext;			
			$config['new_image'] = FALSE;
			$config['create_thumb'] = FALSE;			
			$config['width'] = $this->resize_w;
			$config['height'] = $this->resize_h;	
			$this->CI->image_lib->initialize($config); 
			if (!$this->CI->image_lib->resize()) 
			{
				echo '0';
				return;
			}
		}
				
		echo $new_name.'.'.$ext;
		if (strlen($uname)>1)
		{
			$this->remove_old_image($uname);
		}
	}
	
	function do_upload_ajax()
	{
		$fileguid=@$_POST["image_uploader"];    
		if($fileguid)    
		{    
			//get the uploaded file based on GUID    
			$mvcfile=$this->uploader->GetUploadedFile($fileguid);    
			if($mvcfile)    
			{    			
				$fname = $mvcfile->FileName;				
				$ext = end(explode(".", $fname));
				$new_name = xm_generateRandStr(16);
											
				$mvcfile->CopyTo($this->upload_folder.$new_name.'.'.$ext); 
				$mvcfile->Delete();								
				$this->do_with_temp($new_name, $ext);				
				return;
			}
		}
		echo 0;				
	}
	
	function remove_old_image($fname, $delete_in_db = FALSE)
	{
		//if (($fname == $this->old_image)&&($delete_in_db==FALSE)) return 2;
		
		if (file_exists($this->upload_folder.$fname))
		{
			if (file_exists($this->upload_folder.'thumb_'.$fname))
			{
				unlink($this->upload_folder.'thumb_'.$fname);
			}
			unlink($this->upload_folder.$fname);
			return 1;
		}		
		return 0;
	}
	
	function remove_image_from_db($id, $id_field, $field, $table)
	{
		$this->CI->db->select($field);
		$this->CI->db->where($id_field, $id);
		$this->CI->db->limit(1);
		$this->CI->db->from($table);
		
		$query = $this->CI->db->get();
		if ($query->num_rows()>0) 
		{
			$row = $query->row();			
			$fname = $row->$field;
			if ($this->remove_old_image($fname)==1) return TRUE;			
		}
		return FALSE;
		//$query = $this->CI->db->get_where($table, array($id_field => $id), 1);
	}
	
}
// END VIDEO Class 