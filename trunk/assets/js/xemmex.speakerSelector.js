	XEMMEX.Speaker = {};
	XEMMEX.Speaker.basePagingUrl = XEMMEX.baseUrl + 'speaker/do_paging/';
	XEMMEX.Speaker.numPerPage = 10;
	
	jQuery.fn.xemmexSpeakerSelector = function(settings) {
		var defaults={			
			popup : "#ssel",
			pagingUrl : "",
			numPerPage: 10,
			width: 500,
			height: 460
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
						$(".speaker_item").each(function(i){
							$(this).remove();
						});							
						$("#ssel_loading").hide();
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

			$("#ssel_paging > a").click(function(i){		
				return getSpeakers(this.href);
			});
			
			$("#ssel_submit").click(function(){
				return getSpeakers(false);
			});		

			$("#ssel_loading").ajaxStart(function(){
				$(this).show();
			});
			
			$("#ssel_loading").ajaxStop(function(){
				$(this).hide();
			});				
			
		})		
	
	}