
$(function(){
	$('#datepicker').datepicker({
		inline: true,				
		dateFormat: 'yy-mm-dd',
		onSelect: function(dateText, inst) {																				
			gogo = XEMMEX.baseUrl + "event/show_event/" + dateText;
			//alert(gogo);
			window.location = gogo;
		}
	});	
		
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