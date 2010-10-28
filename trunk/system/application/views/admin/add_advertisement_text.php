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
                <div class="content_item">
                
                <ul class="link_conttrol">
        <li><a class="icon_list" href="<?php echo site_url('advertisement_text/advertisement_list')?>"><?php echo __("CF_adv_list_text")?></a></li>
    </ul><br />

                    <h3><?php echo __("CF_add_new_adv_text")?></h3>
                    
                    <form action="<?php echo site_url('advertisement_text/add')?>" method="post" enctype="multipart/form-data" class="global" name="advertisement">
                        <p>                        
                            <label for="date_expiry"><?php echo __("CF_adv_date_ex")?></label>
                            <input name="date_expiry" class="short" id="datepicker" value="<?php if(isset($_POST['date_expiry'])){ echo $_POST['date_expiry'];}?>" />
                            <?php echo form_error('date_expiry')?>                        
                        </p>
                        <p>                        
                            <label for="advertiser_email"><?php echo __("CF_advertiser_email")?></label>
                            <input class="short" name="advertiser_email" id="advertiser_email" value="<?php if(isset($_POST['advertiser_email'])){ echo $_POST['advertiser_email'];}?>" />
                            <?php echo form_error('advertiser_email')?>                        
                        </p>
                                                <p>                        
                            <label for="url"><?php echo __("CF_url")?></label>
                            <input class="short" name="url" id="url" value="<?php if(isset($_POST['url'])){ echo $_POST['url'];}?>" />
                            <?php echo form_error('url')?>                        
                        </p>
                        <p>                        
                            <label for="title"><?php echo __("CF_title")?></label>
                            <input class="short" name="title" id="title" value="<?php if(isset($_POST['title'])){ echo $_POST['title'];}?>" />
                            <?php echo form_error('title')?>                        
                        </p>                        
                        
                        <p>
                        
                            <label for="body"><?php echo __("CF_blog_body")?></label>
                            <textarea class="short" name="body" id="body" rows="5"><?php if(isset($_POST['body'])){ echo $_POST['body'];}?></textarea>
                            <?php echo form_error('body')?>
                        
                        </p>                                                  
                  <p>
                        
                            <input name="btnsubmit" type="submit" class="submit" value="<?php echo __("CF_post")?>" />
                            <input name="btnreset" type="reset" class="reset" value="<?php echo __("CF_reset")?>" />
                        
                  </p>
                    </form>
                    
                </div>
                <!-- /.content_item -->
                <!-- /.content_item -->
                <!-- /.content_item -->
                <!-- /#pagination -->
                <div id="left">
              <!-- /.content_item -->
                        
                        <p>
              </div>