<?php 
/**
 * Video upload view
 *
 * @package		Confor
 * @subpackage	View
 * @category	Uploader
 * @author		Nguyen Hai Dang - XEMMEX developer
 */ 
	$CI=& get_instance(); 
	$uname = isset($uname)?$uname:'0';	
?>

<style>
#vid_uploaderButton
{
	width:220px;
	height:25px;	
	border:1px #ccc solid;
	margin-right:5px
	color:#008EB0;
}

#upload_button
{
	width:90px; 
	cursor:pointer;
	margin-right:0px
}

#converting span{
	color:#999;
	margin-left:10px;
}


</style>

<script>
	
	

	function CuteWebUI_AjaxUploader_OnPostback()
	{		
		var upload_url = "<?php echo $CI->video_upload_lib->ajax_link;?>";				
		$('#upload_button').hide();
		$('#converting').show();
		$.ajax({
			type: "POST",
			url: upload_url,
			data:{
				'vid_uploader':$('#vid_uploader').val(),
				'uname':$('#uname').val()
			},		
			dataType: 'text',
			success: function(data){				
				$('#uname').val(data.toString());												
				$('#upload_button').show();
				$('#converting').hide();
		
				if (data!=0) 
				{
					alert("<?php echo __("CF_success_upload")?>");										
					$('#preview_img').attr('src','<?php echo base_url()?>'+'temp/'+data+'.jpg');
				}
				else
				{
					alert("<?php echo __("CF_error_occurred")?>");
				}				
				var uploader = document.getElementById("vid_uploader");
				uploader.reset();
			}
		});	
	}
	
	function doUpload(){		
		myUpload = document.getElementById("vid_uploader");
		if (myUpload.getqueuecount() > 0)
		{
			myUpload.startupload();			
		}
		else
		{
			alert("<?php echo __("CF_please_browse")?>");
		}					
		return false;
	}
</script>			
	
	<p><?php $CI->video_upload_lib->uploader->Render();?></p>	
	<p></p>
	<p>
	<input id="upload_button" type="submit" onclick="return doUpload()" value="<?php echo __("CF_up")?>" />
	<div id="converting" class="hidden">
		<img align="left" src="<?php echo base_url()?>assets/img/indicator_arrows_black.gif"/>
		<span><?php echo __("CF_converting")?>..</span>
	</div>
	</p>
	<input id="uname" type="hidden" name="uname" value="<?php echo $uname?>"/>
	<p>
		<?php if ($uname=='0'):?>
			<?php if (isset($edit_image)):?>
			<img id="preview_img" src="<?php echo base_url().'thumbs/'.$edit_image?>"/>
			<?php else:?>
			<img id="preview_img" src="<?php echo base_url()?>assets/img/noimage.gif"/>
			<?php endif;?>
		<?php else:?>
		<img id="preview_img" src="<?php echo base_url().'temp/'.$uname?>.jpg"/>
		<?php endif;?>	
	</p>
