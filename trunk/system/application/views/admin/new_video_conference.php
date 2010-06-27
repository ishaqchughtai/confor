<?php
	$this->load->view('admin/speaker_selector');
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
		$('#upload_button').val('Converting...');
		$.ajax({
			type: "POST",
			url: XEMMEX.baseUrl + 'admin/do_upload_ajax',			
			data:{
				'myuploader':$('#myuploader').val(),
				'vname':$('#vname').val()
			},		
			dataType: 'text',
			success: function(data){				
				$('#vname').val(data.toString());
				$('#upload_button').val('Upload');				
				if (data!=0) alert('Your file has been uploaded');
			}
		});	
	}
	
	function doUpload(){		
		myUpload = document.getElementById("myuploader");
		if (myUpload.getqueuecount() > 0)
		{
			myUpload.startupload();
			//myUpload.reset();
		}
		else
		{
			alert("Please browse files for upload");
		}					
		return false;
	}
	
</script>



              <div class="x2">

                    <h3>Add new video</h3>
					<?php $this->load->view("admin/admin_menu_video");?>
                    <p>&nbsp;	</p>
                    <h3>Add video conference </h3> 
					  <?php echo form_open('admin/new_video_conference/');?>
						
						<p>
						<input id="speaker_id" type="hidden" name="speaker" value="0"/>
						<label for="title">Speaker:</label>
						<input id="speaker_email" name="speaker_email" class="short" type="text" value=""/>
						<?php echo form_error('speaker_email')?>
                        </p>
						
						<p>
                        <label for="title">Title:</label>
                        <input class="medium" name="title" id="title" value="<?php echo set_value('title');?>"/>
                        <?php echo form_error('title')?>
                    </p>
                    <p>
                        <label for="description">Description:</label>
                        <textarea name="description" id="description" rows="4" cols="" value="<?php echo set_value('description');?>"></textarea>
                        <?php echo form_error('description')?>
                    </p>
                    <p>
                        <label for="category">Category:</label>
                        <select class="medium" name="category">
                            <?php foreach($query as $row):?>
                            <option value="<?php echo $row['ID']?>"><?php echo $row['Name']?></option>
                            <?php endforeach;?>
                        </select>
                        <a href="#">Category Management</a>
                    </p>
                    <p>
                        <label for="keywords">Keywords:</label>
                        <input class="medium" name="keywords" id="keywords" value="<?php echo set_value('keywords');?>"/>
                        <?php echo form_error('keywords')?>
                    </p>
                    <p>
                        <label for="video">Video:</label> <br />   
						<?php
							$CI->uploader->Render();					
						?>
						<input id="upload_button" type="submit" onclick="return doUpload();" value="Upload" />												                        
						<input id="vname" type="hidden" name="vname" value="0"/>
							<?php if(isset($error)):?>
        					<p class="not_warning"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        					<?php endif?>
                    </p>
                    <p>
                        <input name="submit" type="submit" class="submit" value="ADD" />
                    </p>
					<?php echo form_close()?>	


                   </div>
				   
				   
              <!-- /.x2 - represents a half windows size div -->
                <!-- /.x2 - represents a half windows size div -->
                <!--                  -->
                <!-- END OF .x2 CLASS -->
                <!--                  -->
                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

           
           