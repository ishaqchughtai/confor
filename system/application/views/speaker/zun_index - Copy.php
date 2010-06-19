			THIS IS ZUN TEST
<script>
	XEMMEX = {
		baseUrl: '<?php echo site_url("/")?>',
		Speaker:{}
	};
	XEMMEX.Speaker.basePagingUrl = XEMMEX.baseUrl + 'speaker/do_paging';
	XEMMEX.Speaker.numPerPage = 10;
	
	$.fn.xemmexSpeakerSelector = function(settings) {
		var defaults={			
			popup : "#ssel",
			pagingUrl : "",
			numPerPage: 10,
			width: 500,
			height: 400
		};	
		var settings = $.extend(defaults, settings);
		
		function getSpeakers(urlPaging) {	
			$(".speaker_item").each(function(i){
				$(this).remove();
			});	
			getPagingHtml(urlPaging);
			listSpeakers(urlPaging);
			return false;
		}
		
		function getPagingHtml(urlPaging) {
			if (!urlPaging) urlPaging = settings.pagingUrl + settings.numPerPage;
			urlPaging = urlPaging.replace('do_paging','get_paging_html');		
			keyword = $("#ssel_filter").val();
			$.ajax({
				type: "POST",
				url: urlPaging,
				data:{'keyword':keyword},
				success: function(data){				
					$("#ssel_paging").empty();
					$("#ssel_paging").append(data + '&nbsp;');
					$("#ssel_paging > a").click(function(i){		
						return getSpeakers(this.href);
					});				
				}
			});		
		}
		
		function listSpeakers(urlPaging) {		
			if (!urlPaging) urlPaging = settings.pagingUrl + settings.numPerPage;
			keyword = $("#ssel_filter").val();		
			$.ajax({
				type: "POST",
				url: urlPaging,
				dataType: "json",
				data:{'keyword':keyword},
				success: function(data){				
					if(data.error) {
						alert('ERROR:' + data.error);
					} else {				
						s='';
						s1 = '<div class="speaker_item"><span class="ui-icon ui-icon-mail-closed"></span>';					
						s4 = '</div>';					
						for ( var i in data.speakers )
						{												
							s2 = '<span>'+data.speakers[i]['Email']+'</span>';
							s3 = '<input type="hidden" value="'+data.speakers[i]['ID']+'"/>';
							s += s1 + s2 + s3 + s4;						
						}										
						$("#loading").hide();
						$("#ssel_content").append(s);
						$(".speaker_item").click(
							function() {
								spk_id = $(this).find("input").get(0).value;
								spk_email = $(this).find("span").get(1).innerHTML;
								$.fancybox.close();	
								$('#speaker_id').val(spk_id);
								$('#speaker_email').val(spk_email);							
							}
						);					
					}				
				}
			});		
		}		

		this.each(function(i){
			node = $(this);
			node.click(
				function() {
					return getSpeakers(false);	
				}			
			);
			node.fancybox({
				href : settings.popup,
				autoScale : false,
				autoDimensions : false,
				transitionOut : 'none',
				transitionIn : 'none',
				scrolling : 'no',
				width : settings.width,
				height : settings.height
			});	

			$("#ssel_loading").ajaxStart(function(){
				$(this).show();
			});

			$("#ssel_paging > a").click(function(i){		
				return getSpeakers(this.href);
			});
			
			$("#ssel_submit").click(function(){
				return getSpeakers(false);
			});			
			
		})		
	
	}

	$(document).ready(function() {	
		$("#speaker_email").click(
			function() {
				return getSpeakers(false);	
			}
		);
		$("#speaker_email").fancybox({
				href : '#ssel',
				autoScale: false,
				autoDimensions: false,
				transitionOut:'none',
				transitionIn:'none',
				scrolling:'no',
				width:500,
				height:460
			}
		);			
		$("#loading").ajaxStart(function(){
			$(this).show();
		});
		
		$("#paging > a").click(function(i){		
			return getSpeakers(this.href);
		});
		
		$("#filter_submit").click(function(){
			return getSpeakers(false);
		});
						
	});
	
	basePagingUrl = '<?php echo site_url("speaker/do_paging")?>/';
	numPage = 10;
		
	function getSpeakers(urlPaging) {	
		$(".speaker_item").each(function(i){
			$(this).remove();
		});	
		getPagingHtml(urlPaging);
		listSpeakers(urlPaging);
		return false;
	}
	
	function getPagingHtml(urlPaging) {
		if (!urlPaging) urlPaging = basePagingUrl + numPage;
		urlPaging = urlPaging.replace('do_paging','get_paging_html');		
		keyword = $("#filter").val();
		$.ajax({
			type: "POST",
			url: urlPaging,			
			data:{'keyword':keyword},			
			success: function(data){				
				$("#paging").empty();
				$("#paging").append(data + '&nbsp;');
				$("#paging > a").click(function(i){		
					return getSpeakers(this.href);
				});				
			}
		});		
	}
	
	function listSpeakers(urlPaging) {		
		if (!urlPaging) urlPaging = basePagingUrl + numPage;
		keyword = $("#filter").val();		
		$.ajax({
			type: "POST",
			url: urlPaging,
			dataType: "json",
			data:{'keyword':keyword},
			success: function(data){				
				if(data.error) {
					alert('ERROR:' + data.error);
				} else {				
					s='';
					s1 = '<div class="speaker_item"><span class="ui-icon ui-icon-mail-closed"></span>';					
					s4 = '</div>';					
					for ( var i in data.speakers )
					{												
						s2 = '<span>'+data.speakers[i]['Email']+'</span>';
						s3 = '<input type="hidden" value="'+data.speakers[i]['ID']+'"/>';
						s += s1 + s2 + s3 + s4;						
					}										
					$("#loading").hide();
					$("#ssel_content").append(s);
					$(".speaker_item").click(
						function() {
							spk_id = $(this).find("input").get(0).value;
							spk_email = $(this).find("span").get(1).innerHTML;
							$.fancybox.close();	
							$('#speaker_id').val(spk_id);
							$('#speaker_email').val(spk_email);							
						}
					);					
				}				
			}
		});		
	}	
</script>		
<style>
	#ssel {	
		background:#fff;
		width:500px;
		height:460px;	
		padding:0px;
	}
	#ssel_header {
		height:24px;
		background:#66CC33;
		color:#fafafa;				
		width:480px;
		padding:6px 10px 0px 10px;
		font-size:11pt;
		float:left;
	}
	#ssel_content {
		padding:10px;
		float:left;
		height:320px;
	}	
	#search_panel {
		width:480px;
		float:left;
		background:#DDD;		
		padding:10px 10px 0px 10px;
	}	
	#search_panel .sidebar_item {
		margin:0px;				
		width:280px;
		float:left;
	}

	#search_panel .filter_label {				
		width:180px;
		padding:6px 10px 0 0;
		margin:0px;
		text-align:right;		
		float:left;
	}
	#search_panel .filter_label h5 {				
		color:#000;
	}	
	.speaker_item {		
		background:#fafafa;
		cursor:pointer;
		width:410px;
		border:1px solid #ccc;
		padding:4px 14px;		
		margin:2px 20px 2px 20px;	
		float:left;
	}
	.speaker_item:hover {
		background:#999;
		color:#fff;
	}
	.speaker_item span {
		float:left;		
		display:block;		
		text-decoration:none;
	}
	.speaker_item .ui-icon {
		margin-right:8px;
	}	
	
	#paging
	{
		font-family:Arial;
		padding:12px 20px 12px 20px;
		background:#DDD;
		width:460px;
		float:left;		
	}

	#paging a
	{
		padding: 3px 8px 3px 8px;
		border:1px #444 solid;
		text-decoration:none;
		background:#fafafa;
		color:#444;
	}

	#paging a:hover
	{
		padding: 3px 8px 3px 8px;
		border:1px #444 solid;
		text-decoration:none;
		background:#eee;
		color:#444;
	}

	#paging b
	{
		padding: 3px 8px 3px 8px;
		margin-left:4px;
		text-decoration:none;
		border:1px #ccc solid;
		background:#444;
		color:#fafafa;
	}
	
	#speaker_email {
		cursor:pointer;
	}
	
</style>	
	<form method="post">
	<input id="speaker_id" type="hidden" name="speaker_id" value="0"/>
	<input id="speaker_email" class="short" type="text" value=""/>
	</form>
	
	<div class="hidden">    
        <div id="ssel">    		
			<div id="ssel_header">
				<strong>Select speaker from database</strong>
			</div>
			<div id="search_panel">
				<div class="filter_label">
					<h5>Filter your data</h5>
				</div>					
				<div id="search" class="sidebar_item">
					<form action="" method="post">
						<input id="filter" name="filter" type="text" class="search_field">
						<input id="filter_submit" name="submit" type="submit" class="search_submit" value="">
					</form>							
				</div>
			</div>				
			<div id="ssel_content">				
				<div id="loading" align="center" style="width:480px">
					<img src="<?php echo base_url();?>assets/img/indicator_verybig.gif" style="margin:60px auto"/>					
				</div>				
			</div>
			<div align="center" id="paging"></div>			
        </div>    
    </div>
	
</div>
			