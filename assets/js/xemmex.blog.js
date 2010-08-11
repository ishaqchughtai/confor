XEMMEX.blogDays = 0;

function get_blog_in_month(year,month,isRefresh)
{	
	var ajaxUrl = XEMMEX.baseUrl + 'home/get_blog_in_month/'+year+'/'+month;	
	$.ajax({
		type: "GET",
		url: ajaxUrl,		
		success: function(ed)
		{					
			if (ed==null) {ed=0};						
			XEMMEX.blogDays = eval(ed);					
			if (isRefresh) 
			{
				$('#datepicker_blog').datepicker("refresh");
			}	
			else
			{
				init_blog_date();
			}
		}
	});	
}

function init_blog_date()
{
	$('#datepicker_blog').datepicker({
		inline: true,				
		dateFormat: 'yy-mm-dd',
		monthNames: XEMMEX.monthNames,
		dayNamesMin: XEMMEX.dayNames,
		onSelect: function(dateText, inst) {																				
			gogo = XEMMEX.baseUrl + "blog_frontend/search_blog_by_date/" + dateText+ "/5";			
			window.location = gogo;
		},
		onChangeMonthYear: function(year, month, inst) 
		{
			get_blog_in_month(year,month,true);	
		},					
        beforeShowDay: function (date){
			if (XEMMEX.blogDays==0) return [true, ""];
			
			for (i = 0; i < XEMMEX.blogDays.length; i++) {
				if (date.getDate() == XEMMEX.blogDays[i]) {	
					return [true,"has_event",""]; 
				}
			}
			return [true, ""];
		}           		
	});
}

$(function(){	
	var d = new Date();	
	get_blog_in_month(d.getFullYear(),d.getMonth()+1,false);	    
});