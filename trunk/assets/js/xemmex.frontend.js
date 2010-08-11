XEMMEX.eventDays = 0;

function get_event_in_month(year,month,isRefresh)
{	
	var ajaxUrl = XEMMEX.baseUrl + 'home/get_event_in_month/'+year+'/'+month;
	//alert(ajaxUrl);
	$.ajax({
		type: "GET",
		url: ajaxUrl,
		//dataType: "json",
		success: function(ed)
		{					
			if (ed==null) {ed=0};			
			//alert(ed);
			XEMMEX.eventDays = eval(ed);					
			if (isRefresh) 
			{
				$('#datepicker').datepicker("refresh");
			}	
			else
			{
				init_event_date();
			}
		}
	});	
}

function init_event_date()
{
	$('#datepicker').datepicker({
		inline: true,				
		dateFormat: 'yy-mm-dd',
		monthNames: XEMMEX.monthNames,
		dayNamesMin: XEMMEX.dayNames,
		onSelect: function(dateText, inst) {																				
			gogo = XEMMEX.baseUrl + "event_frontend/show_event/" + dateText + "/5";
			//alert(gogo);
			window.location = gogo;
		},
		onChangeMonthYear: function(year, month, inst) 
		{
			get_event_in_month(year,month,true);
			// $.ajax({
				// url: XEMMEX.baseUrl + 'home/get_event_in_month/'+year+'/'+month,
				// dataType: "json",
				// success: function(ed)
				// {					
					// XEMMEX.eventDays = ed;								
					// $('#datepicker').datepicker("refresh");
				// }
			// });			
		},					
        beforeShowDay: function (date){
			if (XEMMEX.eventDays==0) return [true, ""];
			
			for (i = 0; i < XEMMEX.eventDays.length; i++) {
				if (date.getDate() == XEMMEX.eventDays[i]) {			
					return [true,"has_event",""]; 
				}
			}
			return [true, ""];
		}           		
	});
}

$(function(){
	// var t = new Date().getTime();
	 var d = new Date();
	// alert(d.getMonth());
	get_event_in_month(d.getFullYear(),d.getMonth()+1,false);	
    
	// $('#datepicker_blog').datepicker({
        // inline: true,                
        // dateFormat: 'yy-mm-dd',
        // monthNames: XEMMEX.monthNames,
		// dayNamesMin: XEMMEX.dayNames,
        // onSelect: function(dateText, inst) {                                                                                
            // gogo = XEMMEX.baseUrl + "blog_frontend/search_blog_by_date/" + dateText+ "/5";            
            // window.location = gogo;
        // }
    // });	
	$("#login_link a").click(function () { 
		$('#message_holder').empty();
	});

});

function loginSubmit() {
	var username = $('#login_username').val();
	var password = $('#login_password').val();		
	var is_cookie = $('#is_cookie').attr('checked');
	var param = {'username':username, 'password':password, 'is_cookie':is_cookie};
	is_cookie = (is_cookie==true)?1:0;
	//alert(is_cookie);
	$.post(XEMMEX.baseUrl + "speaker/do_login", param, function(data){
		if(data.error) {
			msg = '<p class="not_error"><span class="img"></span>'+data.error+'<span class="close"></span></p>';
			$('#message_holder').html(msg);
		} else {
			alert('You logged in as '+data.name);
			window.location = XEMMEX.baseUrl + "speaker";
		}
	}, "json");	
	return false;
}
