<?php $page = 10;?>
	<?php
		foreach($query as $row)
		{
			$id = $row->id;
			$date =  $row->date;
			$title = $row->title;
			$content = $row->content;
			$lg = $row->lang;
            $images=$row->Image;						
		}
	?>	
    			<div class="content_item">
				<ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('conference_office/get_all'.'/'.$lg.'/'.$page)?>"><?php echo __("CF_list_ar")?></a></li>
    </ul>
    <br>
					<h3><?php echo __("CF_add_office")?></h3>
					<?php
						$data=array('name' => 'office-form','id' => 'office-form'); 
						echo form_open('conference_office/edit/'.$id,$data);
					?>
                    <input name="edit_image" id="edit_image" type="hidden" value="<?php echo $images;?>"/>
                    <div class="input text">
						<label><?php echo __("CF_dis_lang")?></label>		
						<?php choose_your_language($lg);?>
					</div>
					<p>
            <label><?php echo __("CF_blog_thum")?> :</label>
            <?php $this->load->view('image_upload',array('edit_image'=>$images));?>
        </p>  	
						<p>
						
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input name="title" class="short" id="title" value="<?php echo $title ?>" />
							<?php echo form_error('title')?>
						
						</p>
						
						<p>
						
							<label for="content"><?php echo __("CF_content")?>:</label>
                            <p>
							<?php 
									
                                    if ( ! isset($_POST['content']))
                                    {
                                        $something = FALSE;
                                    }
                                    else
                                    {
                                        $something = $_POST['content'];
                                    }
                                    $data = array('name' => 'content',
                                    'id' => 'content',
                                    'width' => '600',
                                    'height' => '400',
									'value'=> $content);
                                    echo form_fckeditor($data);
									echo form_error('content');
                                    ?>
                                    </p>
						</p>						
						<p>						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_save")?>" onclick="return confirm('<?php echo __("CF_mess_update")?>');" />
							<input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />						
						</p>
					<?php echo form_close();?>
					
				</div>
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /.content_item -->
				<!-- /#pagination -->
				<div id="left">
			  <!-- /.content_item -->
						
						<p>
			  </div>			
