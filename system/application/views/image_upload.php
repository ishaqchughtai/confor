<?php 
/**
 * Image upload view
 *
 * @package		Confor
 * @subpackage	View
 * @category	Uploader
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
 
	$CI=& get_instance(); 
	$uname = isset($uname)?$uname:'0';	
	// if (isset($edit_image))
	// {
		// $CI->image_upload_lib->old_image = $edit_image;
	// }
?>

<style>
#image_uploaderButton
{
	width:150px;
	height:35px;
	
	border:1px #ccc solid;
	margin-right:5px
}

#upload_button
{
	width:90px; 
	cursor:pointer;
	margin-right:0px
}
</style>

<script>
	
	

	function CuteWebUI_AjaxUploader_OnPostback()
	{
		//var upload_url = (XEMMEX.ajax_upload_url===undefined)?'zun/do_upload_ajax':XEMMEX.ajax_upload_url;
		var upload_url = "<?php echo $CI->image_upload_lib->ajax_link;?>";
		
		$('#upload_button').val('saving...');
		$.ajax({
			type: "POST",
			url: upload_url,
			data:{
				'image_uploader':$('#image_uploader').val(),
				'uname':$('#uname').val()
			},		
			dataType: 'text',
			success: function(data){				
				$('#uname').val(data.toString());				
				
				$('#upload_button').val('Upload');
				if (data!=0) 
				{
					alert('Your file has been uploaded');
					$('#preview_img').attr('src','<?php echo base_url()?>'+'assets/uploads/image/thumb_'+data);
				}
				else
				{
					alert("<?php echo __("CF_error_occurred")?>");
				}
				
				var uploader = document.getElementById("image_uploader");
				uploader.reset();
				//var guidlist = uploader.value;				
				//alert(guidlist);
			}
		});	
	}
	
	function doUpload(){		
		myUpload = document.getElementById("image_uploader");
		if (myUpload.getqueuecount() > 0)
		{
			myUpload.startupload();			
		}
		else
		{
			alert("Please browse files for upload");
		}					
		return false;
	}
</script>			
	
	<p><?php $CI->image_upload_lib->uploader->Render();?></p>	
	<p></p>
	<p><input id="upload_button" type="submit" onclick="return doUpload()" value="<?php echo __("CF_up")?>" /></p>
	<input id="uname" type="hidden" name="uname" value="<?php echo $uname?>"/>
	<p>
	<?php if ($uname=='0'):?>
		<?php if (isset($edit_image)):?>
		<img id="preview_img" src="<?php echo base_url().'assets/uploads/image/thumb_'.$edit_image?>"/>
		<?php else:?>
		<img id="preview_img" src="<?php echo base_url()?>assets/img/noimage.gif"/>
		<?php endif;?>
	<?php else:?>
	<img id="preview_img" src="<?php echo base_url().'assets/uploads/image/thumb_'.$uname?>"/>
	<?php endif;?>
	
	</p>