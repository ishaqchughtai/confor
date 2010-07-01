/**
 * Video selector by speaker_id
 *
 * @package		Confor
 * @subpackage	Javascript
 * @category	Admin
 * @author		Nguyen Hai Dang - XEMMEX developer
 */

	XEMMEX.Vid = {};
	XEMMEX.Vid.basePagingUrl = XEMMEX.baseUrl + 'showroom/do_paging/';
	XEMMEX.Vid.numPerPage = 6; 	
	
	jQuery.fn.xemmexVideoSelector = function(settings) {
		var defaults={			
			popup : "#vsel",
			pagingUrl : XEMMEX.Vid.basePagingUrl,
			numPerPage: XEMMEX.Vid.numPerPage,
			width: 500,
			height: 460
		};	
		var settings = $.extend(defaults, settings);
		
		function getVids(urlPaging) {	
			$(".vid_item").each(function(i){
				$(this).remove();
			});	
			getPagingHtml(urlPaging);
			listVids(urlPaging);
			return false;
		}
		
		function getPagingHtml(urlPaging) {
			if (!urlPaging) urlPaging = settings.pagingUrl + settings.numPerPage;
			urlPaging = urlPaging.replace('do_paging','get_paging_html');		
			keyword = $("#vsel_filter").val();			
			speaker_id = $("#speaker_id").val();
			$.ajax({
				type: "POST",
				url: urlPaging,
				data:{'keyword':keyword, 'speaker_id':speaker_id},
				success: function(data){				
					$("#vsel_paging").empty();
					$("#vsel_paging").append(data + '&nbsp;');
					$("#vsel_paging > a").click(function(i){
						return getVids(this.href);
					});				
				}
			});		
		}
		
		function listVids(urlPaging) {		
			if (!urlPaging) urlPaging = settings.pagingUrl + settings.numPerPage;
			keyword = $("#vsel_filter").val();
			speaker_id = $("#speaker_id").val();
			$.ajax({
				type: "POST",
				url: urlPaging,
				dataType: "json",
				data:{'keyword':keyword, 'speaker_id':speaker_id},
				success: function(data){				
					if(data.error) {
						alert('ERROR:' + data.error);
					} else {				
						s='';
						s1 = '<div class="vid_item">';	
						s5 = '</div>';
						for ( var i in data.vids )
						{												
							s2 = '<span><img src="'+XEMMEX.bUrl+'thumbs/'+data.vids[i]['shash']+'" width=60 height=40 />&nbsp;&nbsp;</span>';
							s3 = '<span>'+data.vids[i]['title']+'</span>';
							s4 = '<input type="hidden" value="'+data.vids[i]['vid_id']+'"/>';							
							s += s1 + s2 + s3 + s4+ s5;	
						}																
						$(".vid_item").each(function(i){
							$(this).remove();
						});							
						$("#vsel_loading").hide();
						$("#vsel_content").append(s);
						$(".vid_item").click(
							function() {								
								vid_id = $(this).find("input").get(0).value;
								vid_title = $(this).find("span").get(1).innerHTML;								
								$.fancybox.close();	
								$('#vid_id').val(vid_id);
								$('#vid_title').val(vid_title);	
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
					return getVids(false);	
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

			$("#vsel_paging > a").click(function(i){		
				return getVids(this.href);
			});
			
			$("#vsel_submit").click(function(){
				return getVids(false);
			});		

			$("#vsel_loading").ajaxStart(function(){
				$(this).show();
			});
			
			$("#vsel_loading").ajaxStop(function(){
				$(this).hide();
			});				
			
		})		
	
	}