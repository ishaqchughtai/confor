<?php 
/**
 * Speaker selector view
 *
 * @package		Confor
 * @subpackage	View
 * @category	Admin
 * @author		Nguyen Hai Dang - XEMMEX developer
 */

	echo style('xemmex.speakerSelector.css');
	echo script('xemmex.speakerSelector.js');
?>
<script>
$(document).ready(function() {	
	$("#speaker_email").xemmexSpeakerSelector({
		pagingUrl : XEMMEX.Speaker.basePagingUrl,
		numPerPage: 10,		
		cb: function(i)
		{
			if (typeof XEMMEX.SpeakerSelectorCb == 'function')
			{
				XEMMEX.SpeakerSelectorCb(i);
			}
		}
	});								
});	
</script>			
	<div class="hidden">    
        <div id="ssel">    		
			<div id="ssel_header">
				<strong><?php echo __("CF_select_speaker")?></strong>
			</div>
			<div id="ssel_search_panel">
				<div class="ssel_filter_label">
					<h5><?php echo __("CF_filter_data")?></h5>
				</div>					
				<div id="search" class="sidebar_item">
					<form action="" method="post">
						<input id="ssel_filter" name="filter" type="text" class="search_field">
						<input id="ssel_submit" name="submit" type="submit" class="search_submit" value="">
					</form>							
				</div>
			</div>				
			<div id="ssel_content">				
				<div id="ssel_loading" align="center" style="width:480px">
					<img src="<?php echo base_url();?>assets/img/indicator_verybig.gif" style="margin:60px auto"/>					
				</div>				
			</div>
			<div align="center" id="ssel_paging"></div>			
        </div>    
    </div>		
		