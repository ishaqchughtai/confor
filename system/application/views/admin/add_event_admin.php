<script type="text/javascript">
	$(function() {
		$("#datepicker").datepicker({
				dateFormat: 'yy/mm/dd',
				onSelect: function(dateText, inst) {   
					 //$('#datepicker').val(dateText);
					 gogo = dateText;
					 //alert(gogo);
				}				
			}
		);
		$("#format").change(function() { 
		$('#datepicker').datepicker('option', {dateFormat: $(this).val()}); });
	});
	</script>
<?php
	$this->load->view('admin/speaker_selector');
?>
				<div class="content_item">
				<ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('event/event_list'.'/'.$lg.'/5')?>"><?php echo __("CF_admin_event_list")?></a></li>
    </ul>
    <br>
					<h3><?php echo __("CF_add_event")?></h3>
					<?php
						$data=array('name' => 'event-form','id' => 'event-form'); 
						echo form_open('event/add_event',$data);
					?>
                    <div class="input text">
						<label><?php echo __("CF_dis_lang")?></label>		
						<?php choose_your_language($lg);?>
					</div>
						<p>
						<input id="speaker_id" type="hidden" name="speaker" value="0"/>
						<label for="title"><?php echo __("CF_one_speaker")?>:</label>
						<input id="speaker_email" name="speaker_name" class="short" type="text" value=""/>
                        <?php echo form_error('speaker_name')?>
						</p>
						
                        <p>						
							<label for="date"><?php echo __("CF_date")?></label>
							<input name="date" class="short" id="datepicker" value="<?php echo date('Y/m/d')?>"/>
                            <?php echo form_error('date')?>
						</p>
                        
						<p>
						
							<label for="title"><?php echo __("CF_title")?>:</label>
							<input name="title" class="short" id="title" value="<?php if(isset($_POST['title'])){ echo $_POST['title'];}?>" />
							<?php echo form_error('title')?>
						
						</p>
						
						<p>
						
							<label for="subject"><?php echo __("CF_subject")?>:</label>
							<input class="short" name="subject" id="subject" value="<?php if(isset($_POST['subject'])){ echo $_POST['subject'];}?>" />
							<?php echo form_error('subject')?>
						
						</p>
						
						<p>
						
							<label for="keywords"><?php echo __("CF_key")?>:</label>
							<input class="short" name="keywords" id="keywords" value="<?php if(isset($_POST['keywords'])){ echo $_POST['keywords'];}?>" />
							<?php echo form_error('keywords')?>
						
						</p>
						
						<p>
						
							<label for="description"><?php echo __("CF_des")?>:</label>
                            <p>
							<?php                       
                                    $data = array('name' => 'description',
                                    'id' => 'description',
                                    'width' => '600',
                                    'height' => '400');
                                    echo form_fckeditor($data);
									echo form_error('description');
                                    ?>
                                    </p>
						</p>						
						<p>						
							<input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_send")?>" />
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
