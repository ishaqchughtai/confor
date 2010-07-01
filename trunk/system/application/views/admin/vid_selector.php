<?php 
/**
 * Speaker selector view
 *
 * @package		Confor
 * @subpackage	View
 * @category	Admin
 * @author		Nguyen Hai Dang - XEMMEX developer
 */
	echo style('xemmex.videoSelector.css');
	echo script('xemmex.videoSelector.js');	
?>

<script>

$(document).ready(function() {	
	$("#vid_title").xemmexVideoSelector	();
});	

</script>			
	<div class="hidden">    
        <div id="vsel">    		
			<div id="vsel_header">
				<strong>Select 1 video</strong>
			</div>
			<div id="vsel_search_panel">
				<div class="vsel_filter_label">
					<h5><?php echo __("CF_filter_data")?></h5>
				</div>					
				<div id="search" class="sidebar_item">
					<form action="" method="post">
						<input id="vsel_filter" name="filter" type="text" class="search_field">
						<input id="vsel_submit" name="submit" type="submit" class="search_submit" value="">
					</form>							
				</div>
			</div>				
			<div id="vsel_content">				
				<div id="vsel_loading" align="center" style="width:480px">
					<img src="<?php echo base_url();?>assets/img/indicator_verybig.gif" style="margin:60px auto"/>					
				</div>				
			</div>
			<div align="center" id="vsel_paging"></div>			
        </div>    
    </div>		
		