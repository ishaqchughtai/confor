<?php $this->load->view($side_bar['page'], $side_bar);
    $ramdomvideo = get_random_top_video($category,$lang);
    $lgtemp='';
    if($lang=='fr')
    {
        $lgtemp='_fr';
    }
?> 
	<div id="footer" style="width:100%">
	
		<div id="footer_wrapper">
		
			<div id="footer_content">
		
				<div id="footer_column_1">
				
				<h6><?php echo __("CF_services")?></h6>
					
				  <ul>
					
					  <li><a alt="Confor.tv - <?php echo __("CF_conference_office")?>" title="Confor.tv - <?php echo __("CF_conference_office")?>" href="<?php echo site_url("office_frontend/office/5") ?>"><?php echo __("CF_conference_office")?></a></li>
					
                      <li><a alt="Confor.tv - <?php echo __("CF_formation")?>" title="Confor.tv - <?php echo __("CF_formation")?>" href="<?php echo site_url("training_frontend/index/".$lang) ?>"><?php echo __("CF_formation")?></a></li>
					
				  </ul>
				  <!-- /ul -->
				
				</div>
				<!-- /#footer_column_1 -->
			
				<div id="footer_column_2">
				
					<h6><?php echo __("CF_support")?></h6>
					
					<ul>
					
						<li><?php echo out_static_page('OnlineSupp')?></li>
					
						<li><?php echo out_static_page('TelephoneS')?></li>
					
						<li><?php echo out_static_page('How')?></li>
					
						<li><?php echo out_static_page('EmailForm')?></li>
					
						<li><a href="<?php echo site_url("contact")?>"><?php echo __("CF_email")?></a></li>
					
						
					
					</ul>
					<!-- /ul -->
				
				</div>
				<!-- /#footer_column_2 -->
			
				<div id="footer_column_3">
				
					<h6><?php echo __("CF_shop")?></h6>
					<?php                    
                    $get_category = $this->mshopproduct->getAllCategories((($lang=='fr')?'2':'1'),base_url().'prestashop/category.php');
                    if($get_category && count($get_category)>0)
                    {
                        echo '<ul>';
                        foreach($get_category as $i_cat)
                        {
                            echo '<li>'.$i_cat.'</li>';
                        }
                        echo '</ul>';
                    }
                    ?>
					<!--<ul>
					
						<li><a href="<?php echo base_url();?>prestashop/category.php?id_category=6<?php echo ($lang=='fr')?'&id_lang=2':'&id_lang=1'?>"><?php echo __("CF_books")?></a></li>
					
						<li><a href="#"><?php echo __("CF_tickets")?></a></li>
					
						
					
						<li><a href="#"><?php echo __("CF_porter")?></a></li>
					
						<li><a href="<?php echo base_url();?>prestashop/category.php?id_category=5<?php echo ($lang=='fr')?'&id_lang=2':'&id_lang=1'?>"><?php echo __("CF_confer")?></a></li>					
						
					
					</ul>-->
					<!-- /ul -->
				
				</div>
				<!-- /#footer_column_3 -->
			
				<div id="footer_column_4">
				
					<h6><?php echo __("CF_ran_vid")?></h6>
				<?php for($i=0; $i<count($ramdomvideo); $i++):?>
                <a href="<?php echo site_url('video/play/'.$ramdomvideo[$i]['vid_id'])?>">
                <img src="<?php echo base_url().'thumbs/'.$ramdomvideo[$i]['shash']?>" width="81" height="52" alt="<?php echo stripslashes($ramdomvideo[$i]['title']) ?>" title="<?php echo stripslashes($ramdomvideo[$i]['title']) ?>">
                </a>                            
                <!-- /.content .top_box_block --->
            <?php endfor;?>
				</div>
				<!-- /#footer_column_4 -->
				
			</div>
			<!-- /#footer_content -->
		
		</div>
		<!-- /#footer_wrapper -->
	
	</div>
	<!-- /#footer -->
	
	<div id="copyright">
	
		<div id="copyright_wrapper">
		
			<ul class="left">
			
				<li><a alt="Confor.tv - <?php echo __("CF_home")?>" title="Confor.tv - <?php echo __("CF_home")?>" href="<?php echo base_url()?>"><?php echo __("CF_home")?></a></li>
			
				<li><?php echo out_static_page('About')?></li>
			
				<li><a alt="Confor.tv - <?php echo __("CF_blog")?>" title="Confor.tv - <?php echo __("CF_blog")?>" href="<?php echo site_url("blog_frontend") ?>"><?php echo __("CF_blog")?></a></li>
			
				<li><a alt="Confor.tv - <?php echo __("CF_shop")?>" title="Confor.tv - <?php echo __("CF_shop")?>" href="<?php echo site_url("shop") ?>"><?php echo __("CF_shop")?></a></li>
                
                <li><a alt="Confor.tv - <?php echo __("CF_contact")?>" title="Confor.tv - <?php echo __("CF_contact")?>" href="<?php echo site_url("contact")?>"><?php echo __("CF_contact")?></a></li>
			
         <?php if($this->session->userdata('admin')): ?>        
        <li><a href="<?php echo site_url("admin") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a href="<?php echo site_url("admin/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php elseif($this->session->userdata('speaker_id')): ?>
        <li><a alt="Confor.tv - <?php echo __("CF_setting")?>" title="Confor.tv - <?php echo __("CF_setting")?>" href="<?php echo site_url("speaker") ?>"><?php echo __("CF_setting")?></a></li>
        <li><a alt="Confor.tv - <?php echo __("CF_logout")?>" title="Confor.tv - <?php echo __("CF_logout")?>" href="<?php echo site_url("speaker/logout") ?>"><?php echo __("CF_logout")?></a></li>        
        <?php else: ?>
        <li><a alt="Confor.tv - <?php echo __("CF_register")?>" title="Confor.tv - <?php echo __("CF_register")?>" href="<?php echo site_url("home/register") ?>"><?php echo __("CF_register")?></a></li>        
        <li><a alt="Confor.tv - <?php echo __("CF_login")?>" title="Confor.tv - <?php echo __("CF_login")?>" href="<?php echo site_url("home/login") ?>"><?php echo __("CF_login")?></a></li>        
        <?php endif ?>
			
			</ul>
			<!-- /.left content-->
			
			<span class="right">&copy; 2010 Confor.tv | <?php echo __("CF_copy_right")?> <a alt="XemmeX" title="XemmeX" href="http://xemmex.com/">XemmeX</a></span>
			<!-- /.right content-->
		
		</div>
		<!-- /#copyright _wrapper-->
	
	</div>
	<!-- /#copyright -->			
</body>
</html>