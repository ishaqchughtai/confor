<?php require 'SimpleRatings/rSystem.php';  ?>
<div class="content_item">
    <h3><?php echo __("CF_search_video")?>: "<?php echo $keyword?>" </h3>
</div>
<?php foreach($search_results as $rows):?>			  
    <?php $keyword = explode(" ", $rows['tags']);?>

    <div class="content_item">

        <h3><a alt="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" title="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>

        <h5><?php echo __("CF_by")?> <a alt="<?php echo $rows['first_name'].' '.$rows['name']?>" title="<?php echo $rows['first_name'].' '.$rows['name']?>" href="<?php echo site_url('video/speaker').'/'.$rows['mem_id'].'/5'?>"><b><?php echo $rows['first_name'].' '.$rows['name']?></b></a> <?php echo __("CF_in")?> : 

            <?php for($i=0;$i<count($keyword);$i++){?>
            <a title="<?php echo $keyword[$i]?>" alt="<?php echo $keyword[$i]?>" href="<?php echo site_url('video/search_tag/'.$keyword[$i].'/')?>"><?php echo $keyword[$i]?></a>
                <?php if ($i<count($keyword)-1) echo ','?>
                <?php ;}?>

            // <?php echo mdate("%d-%m-%Y", $rows['date'])?></h5>
        <p>
            <a href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>"><img alt="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" title="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="160" height="90" alt="" class="alignleft" /></a>
        </p>

        <p>
            <?php echo $rows['description'];?>
        </p>

        <a alt="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" title="<?php echo $rows['title'].' - '.$rows['first_name'].' '.$rows['name']?>" href="<?php echo site_url('video/play').'/'.$rows['vid_id']?>" class="read_more"><?php echo __("CF_view")?></a>

    </div>		  

    <?php endforeach?>


<ul id="pagination">

    <?php echo $link_html?>		

				</ul>				