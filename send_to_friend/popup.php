<?php

/**
 * Send to a Friend.
 * Version 1.01
 * Author: XemmeX
 */


/***************************/
/***** POPUP SETTINGS ******/
/***************************/
$email_address = 'info@confor.tv'; // enter your email address here.
$website_name = 'www.confor.tv'; // enter your website name here.
$allow_images = true; // allows the user to select if images are found on the page
$allow_changes = true; // allows the user to click and change the description/page title.
$allow_comment = true; // allow a comment from the user.
$send_bcc = true; // change this to true if you would like to receive a BCC of every email that gets sent.
$email_subject = 'Your friend sent you a page';
$restrict_domain = true; // restrict usage to urls under this domain
$popup_width = 810;
$popup_height = 550;
/***************************/


require_once("sendfiles/phpcode.php");
// html design is below, feel free to change.
?>

<html>
<head>
<title>Send this page to a friend</title>
<link rel="stylesheet" href="sendfiles/send.css" type="text/css">
<!--[if IE]>
<style type="text/css"> 
h1 {height:50px; width:745px;}
ul#images{ position:absolute; margin-left:-34px; }
ul#images li{margin-left:-55px;}
</style>
<![endif]-->

<script src="http://www.google.com/jsapi"></script>
<script language="javascript" type="text/javascript">
var allow_changes = <?php echo ($allow_changes) ? 'true' : 'false'; ?>;
<?php if(!isset($_REQUEST['lb'])){ ?>
top.resizeTo(<?php echo $popup_width;?>,<?php echo $popup_height+30;?>);
<?php } ?>
</script>
<script type="text/javascript" language="javascript" src="sendfiles/javascript.js"></script>
</head>
<body>
<div id="wrapper">
<div id="content">

<?php if($display_thankyou){ ?>

	<!-- start the thankyou page -->
		<h1>Thank you</h1>
		<div id="inner">
		<div style="padding:20px;">You page has been successfully sent.</div>
		<div id="share" class="sep">
			<h2>Would you like to share this page with others?</h2>
			<table width="80%" align="center">
				<tr>
					<td width="40%" align="right">
						<img src="sendfiles/share_facebook.png">
					</td>
					<td align="left">
						<a href="http://www.facebook.com/sharer.php?u=<?php echo urlencode($url);?>&t=<?php echo urlencode($title);?>" target="_blank">Share on Facebook</a>
					</td>
				</tr>
				<tr>
					<td align="right">
						<img src="sendfiles/share_twitter.png">
					</td>
					<td align="left">
						<a href="http://twitter.com/home?status=Check+out+<?php echo urlencode($url);?>" target="_blank">Share on Twitter</a>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="close" class="sep" style="text-align:center; padding:20px;">
			<input type="button" name="close" onClick="if(typeof window.parent != 'undefined' && typeof window.parent.GB_hide != 'undefined')window.parent.GB_hide(); else window.close();" value="Close Window">
		</div>
		</div>
		<div id="footer"></div>
<!-- end thankyou page -->

<?php }else{ ?>

	<form action="?post" method="post" onSubmit="return validate_form();">
	<input type="hidden" name="send" value="true">
	<?php if(isset($_REQUEST['lb'])){ ?><input type="hidden" name="lb" value="true"> <?php } ?>
		
		
		<!-- start the main banner --> 
		<h1><img src="sendfiles/title_send_to_friend.png" alt="Send this page to a friend"></h1>
		<!-- end the main banner -->
		
		<div id="inner">
		
			<!-- start errors -->
			<?php if(count($errors)){ ?>
			<div class="errors">
				<ul><?php foreach($errors as $error){ ?>
				<li><?php echo $error;?></li>
				<?php } ?></ul>
			</div>
			<?php } ?>
			
			<!-- start the image/description block -->
				<table cellpadding="3" width="70%" id="image_description" align="center">
					<tr>
						<?php 
						// the left/right image selector, only appears if images are found.
						require_once("sendfiles/image_selector.php");
						?>
						<td valign="top" align="left">
						
							<div id="edit_title" class="editable_container">
							<a href="#"><?php echo htmlspecialchars($title);?></a>
							<input type="text" class="editable input_box" name="title" value="<?php echo htmlspecialchars($title);?>">
							</div>
							
							<div id="edit_url">
							<span><?php echo htmlspecialchars($url);?></span>
							<input type="text" class="editable input_box" name="url" value="<?php echo htmlspecialchars($url);?>">
							</div>
							
							<div id="edit_description" class="editable_container">
							<a href="#"><?php echo htmlspecialchars($description);?></a>
							<textarea name="description" class="editable input_box"><?php echo htmlspecialchars($description);?></textarea>
							</div>
							
						</td>
					</tr>
				</table>
			<!-- end the image/description box -->
			
			<div class="sep"></div>
			<!-- start the your message box -->
			
				<table cellpadding="4" width="95%" align="center">
					<tr>
						<td valign="top" width="50%" rowspan="2">
						
							<img src="sendfiles/title_message.gif" alt="Your Message" />
							<br><br>
							<table cellpadding="3" width="100%">
								<tr>
									<th width="100">Your Name:</th>
									<td><input type="text" name="your_name" class="input_box" tabindex="3"></td>
								</tr>
								<tr>
									<th>Your Email: <span class="required">*</span></th>
									<td><input type="text" name="your_email" id="your_email" class="input_box" tabindex="4"></td>
								</tr>
								<?php if($allow_comment){ ?>
								<tr>
									<th valign="top" style="padding-top:11px;">Your Comment:</th>
									<td><textarea name="your_comment" class="input_box" id="your_comment" tabindex="5"></textarea></td>
								</tr>
								<?php } ?>
							</table>
							
						</td>
						<td valign="top" width="50%">
						
							<img src="sendfiles/title_friend.gif" alt="Your Friends" />
							<br><br>
							<table cellpadding="3" width="100%" id="friends_link">
								<tbody class="dynamic_block">
									<tr>
										<th width="98">Email Address: <span class="required">*</span></th>
										<td><input type="text" name="their_email[]" class="friend_email input_box" tabindex="6"></td>
										<td width="53">
											<a href="#" onClick="return selrem(this,'friends_link');" class="remove_addit"><img src="sendfiles/button_remove.gif" border="0" alt="Remove"></a>
											<a href="#" onClick="return seladd(this,'friends_link');" class="add_addit"><img src="sendfiles/button_add.gif" border="0" alt="Add"></a>
										</td>
									</tr>
								</tbody>
							</table>
							<script language="javascript">
							set_add_del('friends_link');
							</script>
							
						</td>
					</tr>
					<tr>
						<td valign="bottom" align="right">
							<input type="image" name="send_page" value="Send Page!" src="sendfiles/button_send_page.jpg" tabindex="7">
						</td>
					</tr>
				</table>
				
			<!-- end the your message box -->
			
			
		</div>
		<div id="footer"></div>
		<!-- start privacy -->
		<div id="privacy">
			<p>Your data are safe!<br />Confor.tv assure you that your data will not be sold or shared with third parties, in whole or in part.</p>
		</div>
		<!-- end privacy -->
	</form>
<?php } ?>
</div>
</div>
</body>
</html>

