THIS IS ZUN TEST
<?php 
	echo style('xemmex.speakerSelector.css');
	echo script('xemmex.speakerSelector.js');
?>
<script>


	$(document).ready(function() {	
		$("#speaker_email").xemmexSpeakerSelector({
			pagingUrl : XEMMEX.Speaker.basePagingUrl,
			numPerPage: 10,			
		});								
	});
	

</script>		

	<form method="post">
	<input id="speaker_id" type="hidden" name="speaker_id" value="0"/>
	<input id="speaker_email" class="short" type="text" value=""/>
	</form>
	
	<?php $this->load->view("admin/speaker_selector");?>
	
</div>
			