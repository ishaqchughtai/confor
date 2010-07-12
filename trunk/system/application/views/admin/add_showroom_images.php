<script>
XEMMEX.bUrl = "<?php echo base_url()?>";
XEMMEX.SpeakerSelectorCb = function(i)
{
	$('#vid_id').val(0);
	$('#vid_title').val('');
}
</script>
<?php $this->load->view('admin/speaker_selector');	?>
<?php $this->load->view('admin/vid_selector');	?>

<div class="content_item">
    <?php if(isset($error)):?>
        <p class="not_info medium"><span class="img"></span><?php echo $error;?><span class="close"></span></p>
        <?php endif;?>
        <h3><?php echo __("CF_showroom_menu")?></h3>
        <?php $this->load->view("admin/admin_menu_showroom");?>
        <p>&nbsp;    </p>
    <h4><?php echo __("CF_add_showroom")?></h4>
    

    <form action="" method="post" enctype="multipart/form-data" name="showroom">        
		<p>
		<input id="speaker_id" type="hidden" name="speaker" value="<?php if (isset($speaker)) echo $speaker?>"/>
		<label for="title"><?php echo __("CF_one_speaker")?>:</label>
		<input id="speaker_email" name="speaker_email" class="short" type="text" value="<?php echo set_value('speaker_email');?>"/>
		<?php echo form_error('speaker_email')?>
		</p>
						
		<p>
		<input id="vid_id" type="hidden" name="vid_id" value="<?php if (isset($vid_id)) echo $vid_id?>"/>
		<label for="title"><?php echo __("CF_vid_from_speaker")?></label>
		<input id="vid_title" name="vid_title" class="short" type="text" value="<?php if (isset($vid_title)) echo $vid_title?>"/>			
		<?php echo form_error('vid_title')?>
		</p>		
                      
        <p>
        <label><?php echo __("CF_blog_thum")?> :</label>
		<?php $this->load->view('image_upload');?>
		</p>                       
        <p>			
            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_submit")?>" />
            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
        </p>
    </form>

</div>
                <!-- /.content_item -->