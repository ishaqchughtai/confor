<script type="text/javascript">
function search_click (){
 keyword = $('#keyword').val();
 gogo = XEMMEX.baseUrl + "advertisement/search_advertisement/" + keyword + "/5";
 window.location = gogo;
 return false;
}
</script>
</div>
			<div id="right">
			
    <h3><?php echo __("CF_search")?></h3>
    <h5><?php echo __("CF_adv_search")?></h5>
    <div class="sidebar_item" id="search">
    <form action="<?php echo site_url('advertisement/search_advertisement')?>" method="post">
      <input id="keyword" name="search_field" type="text" class="search_field" >
      <input name="btnsearch" type="submit" class="search_submit" value="" onclick="return search_click();">
    </form>
    <!-- #search form -->
  </div>
				<!-- /.sidebar_item #search -->                                            
			</div>
			<!-- /#content #right - right side of main content or sidebar -->

		</div>
		<!-- /#content -->
		
	</div>
	<!-- /#top-box -->
</div>
<!-- /#wrapper -->	
			