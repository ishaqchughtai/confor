var your_comment_val = 'Type a message to your friend here...';
	var current_image_id = 1;
	var number_of_images = 0;
	var old_image_url = '';
	
	function page_loaded(){
		if($('#your_email').length >= 1 && $('#your_email').val() == '')$('#your_email')[0].focus();
		$('#your_comment').css('color','#CCCCCC');
		$('#your_comment').val(your_comment_val);
		$('#your_comment').focus(function(){
			$('#your_comment').css('color','');
			if($('#your_comment').val() == your_comment_val){
				$('#your_comment').val('');
			}
		});
		number_of_images = $('ul#images li').size();
		$('#image_nav_right').click(function(){return images_nav_go(1);});
		$('#image_nav_left').click(function(){return images_nav_go(-1);});
		$('#images_nav').show();
		$('#images_none').show();
		$('#no_image').change(function(){no_image_change();}).focus(function(){no_image_change();});
		no_image_change();
		if(allow_changes){
			$('.editable_container a').click(function(){
				$(this).hide();
				$('input',$(this).parent()).show();
				$('textarea',$(this).parent()).show();
				return false;
			});
		}
	}
	function no_image_change(){
		if($('#no_image').length < 1)return;
		if($('#no_image')[0].checked){
			// hide image block, and remove image url.
			old_image_url = $('#image_url').val();
			$('#image_url').val('');
			$('#images').hide();
			$('#image_nav_left').hide();
			$('#image_nav_right').hide();
		}else{
			if(old_image_url!='')$('#image_url').val(old_image_url);
			$('#images').show();
			$('#image_nav_left').show();
			$('#image_nav_right').show();
		}
	}
	function images_nav_go(dir){
		current_image_id += dir;
		if(current_image_id<1){
			current_image_id = number_of_images;
		}else if(current_image_id>number_of_images){
			current_image_id = 1;
		}
		$('ul#images li').hide();
		$('ul#images li:nth-child('+current_image_id+')').show();
		$('#image_url').val($('ul#images li:nth-child('+current_image_id+') img').attr('src'));
		return false;
	}
	function validate_form(){
		var email=$('#your_email').val();
		if(email == '' || !email.match('@')){
			$('#your_email')[0].focus();
			alert('Please enter your email address');
			return false;
		}
		var friend=false;
		$('.friend_email').each(function(){
			var email = $(this).val();
			if(email != '' && email.match('@')){
				friend=true;
			}
		});
		if(!friend){
			$('.friend_email')[0].focus();
			alert('Please enter at least 1 friends email address');
			return false;
		}
		return true;
	}
	function set_add_del(id){
		$("#"+id+' .remove_addit').show();
		$("#"+id+' .add_addit').hide();
		$("#"+id+' .add_addit:last').show();
		$("#"+id+" .dynamic_block:only-child > .remove_addit").hide();
	}
	function selrem(clickety,id){
		$(clickety).parents('.dynamic_block').remove(); 
		set_add_del(id); 
		return false;
	}
	function seladd(clickety,id){
		var box = $('#'+id+' .dynamic_block:last').clone(true);
		$('input',box).val('');
		$('#'+id+' .dynamic_block:last').after(
	       box); 
		set_add_del(id); 
		return false;
	}
	google.load("jquery", "1");
	google.setOnLoadCallback(page_loaded);