    
	<?php if(!$adv):?>
      <p class="not_warning "><span class="img"></span>There are no results for your search.<span class="close"></span></p>
      <?php else:?>
	<?php foreach($adv as $row) {
                                $id = $row['ID'];
                                $date_beginning = date("F jS Y", strtotime($row['DateBeginning']));
                                $date_expiry = date("F jS Y", strtotime($row['DateExpiry']));
                                $advertiser_name = $row['AdvertiserName'];
                                $advertiser_email = $row['AdvertiserEmail'];
                                $url = $row['URL'];
                                $text_tips = $row['TextTips'];                           
                                $image_link = $row['ImageLink']; 
	?>
	<div class="content_item">
    <h5>Date Beginning: <?php echo $date_beginning?> \ Date Expiry: <?php echo $date_expiry?></h5>
    <h5>Advertisement Name: <?php echo $advertiser_name?></h5>
    <h5>Advertisement Email: <?php echo $advertiser_email?></h5>
    <p><a href="<?php echo $url;?>"><img src="<?php echo base_url().'assets/uploads/adv/'.$image_link ?>" width="200" height="200" /></a><?php echo $text_tips?></p>
    <p>
    <form id="contactform" action="<?php echo site_url('advertisement/get_advertisement'.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
      <input name="btnedit" type="submit" class="submit" value="Edit" />
    </form>
    <form id="contactform" action="<?php echo site_url('advertisement/delete'.'/'.$id)?>" method="post" enctype="multipart/form-data" class="global">
    <input name="btndelete" type="submit" class="submit" value="Delete" onclick="return confirm('Do you really wish to delete?')" />
	</form>
    </p>
    </div>
    <?php }?>
	<?php endif?>
	<ul id="pagination">
    	<?php echo $pagination?>      
    </ul>    	
   