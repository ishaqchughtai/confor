jQuery.noConflict();
(function($) { 
$(function() {
//jQuery
$(document).ready(function(){
	//Used to store average rating
	var storeAR;
	
	//Hide Average
	$(".ratingBox input").mouseover(function() {
		var ratingBoxTag = $(this).parent().parent();
		$(ratingBoxTag).find(".rAverage").hide();
		//Show curent star rating
		var rNum = $(this).val();
		storeAR = $(ratingBoxTag).find(".rtxtR").html();
		$(ratingBoxTag).find(".rtxtR").html("("+rNum+")");
	});
	//Show Average
	$(".ratingBox input").mouseout(function() {
		var ratingBoxTag = $(this).parent().parent();
		$(ratingBoxTag).find(".rAverage").show();
		//Return original average rating
		$(ratingBoxTag).find(".rtxtR").html(storeAR);
	});
	//Update selected rating to hidden input
	$(".ratingBox input").click(function() {
		var ratingBoxTag = $(this).parent().parent();					 
		$(ratingBoxTag).find("input[name='ratedJS']").val($(this).val());
	});

	//Process Rating
	$(".ratingBox form").submit(function(formSubmit) {
		//Disable form submit
		formSubmit.preventDefault();
		//Parent Tag
		var ratingBoxTag = $(this).parent();
		//Get form data
		var rData = $(this).serialize();
		$(ratingBoxTag).find("input[name='ratedJS']").val("0");
		//Get rSubmit.php location
		var rURL = $(this).attr("action");
		
		//Loading...
		$(this).css("background","none");
		$(this).html("<div class='rLoad'></div>");
		$(ratingBoxTag).find(".rtxtL").html("Loading...");
		$(ratingBoxTag).find(".rtxtR").html("");
		
		//Submit
		$.ajax({
			type: "POST", url: rURL, data: rData,
			success: function(html){
				//Update html
				$(ratingBoxTag).html(html);
				//Animations
				$(ratingBoxTag).fadeTo(0,0);
				var avgRate = $(ratingBoxTag).find(".rAverage").width();
				$(ratingBoxTag).find(".rAverage").width(0);
				$(ratingBoxTag).fadeTo(800,1);
				//Animate average rating
				$(ratingBoxTag).find(".rAverage").animate({width: avgRate}, 2000, function(){
					//Internet Explorer 8 Opacity Fix
					$(ratingBoxTag).removeAttr("style");
				});//End Animate average
			}//End success
	   });//End Submit
		
	});//End Process Rating
});//End jQuery
});
})(jQuery);
