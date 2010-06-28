<?php 
/**
 * Speaker selector view
 *
 * @package		Confor
 * @subpackage	View
 * @category	Uploader
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
 
	$CI=& get_instance(); 
?>

<style>
#myuploaderButton
{
	width:150px;
	height:35px;
	float:left;
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
		var upload_url = (XEMMEX.ajax_upload_url===undefined)?'admin/do_upload_ajax':XEMMEX.ajax_upload_url;
		$('#upload_button').val('Converting...');
		$.ajax({
			type: "POST",
			url: XEMMEX.baseUrl + upload_url,		
			data:{
				'myuploader':$('#myuploader').val(),
				'vname':$('#vname').val()
			},		
			dataType: 'text',
			success: function(data){				
				$('#vname').val(data.toString());
				$('#upload_button').val('Upload');				
				if (data!=0) alert('Your file has been uploaded');
				
				var uploader = document.getElementById("myuploader");
				uploader.reset();
				//var guidlist = uploader.value;				
			}
		});	
	}
	
	function doUpload(){		
		myUpload = document.getElementById("myuploader");
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

	<label for="video">Video:</label> <br />   
	<?php $CI->uploader->Render();?>
	<input id="upload_button" type="submit" onclick="return doUpload()" value="Upload" />												                        
	<input id="vname" type="hidden" name="vname" value="0"/>