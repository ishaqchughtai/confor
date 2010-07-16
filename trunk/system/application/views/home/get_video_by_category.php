<?php $page = 5;?>
<?php require 'SimpleRatings/rSystem.php';  ?> 
<?php foreach($video_cate as $rows):?>			  
    <?php $keyword = explode(" ", $rows['tags']);?>
    <div class="content_item">

        <h3><a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>

        <h5><?php echo __("CF_by")?> 
            <a href="<?php echo site_url('video/speaker').'/'.$rows['mem_id'].'/'.$page?>"><b><?php echo $rows['username']?></b></a> 
            <?php echo __("CF_in")?> : 
            <?php for($i=0;$i<count($keyword);$i++){?>
                <a href="#"><?php echo $keyword[$i]?></a>
                <?php if ($i<count($keyword)-1) echo ','?>
                <?php ;}?>

            // <?php echo mdate('%F %j%S %Y', $rows['date'])?></h5>                     
        <div class="rate_balloon"><?php $SimpleRatings->create($rows['vid_id']);?>  
        </div>					
    <p>
        <a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="202" height="90" alt="" class="alignleft" /></a>
    </p>

    <p>
        <?php echo _substr($rows['description'],200);?>
    </p>

    <a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>" class="read_more"><?php echo __("CF_view")?></a>

    </div>		  

    <?php endforeach?>


<ul id="pagination">

    <?php echo $pagination?>		

				</ul>				