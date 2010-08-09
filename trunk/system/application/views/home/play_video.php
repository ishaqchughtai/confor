<?php $page = 5;?>
<?php require 'SimpleRatings/rSystem.php';  ?>
</style>        
<div class="content_item">
<?php 
    if($video_url->num_rows()>0)
    {
        $row=$video_url->row();
        $vid_id=$row->vid_id;
        $speaker_id = $row->mem_id;
        $video_link=$row->vhash;
        $description=$row->description;
        $category=$row->category;
        $tags=explode(" ",$row->tags);
        $date=$row->date;
        $viewed=$row->viewed;
        $name=$row->username;
        $first_name=$row->first_name;
        $name_name=$row->name;
        $video_title=$row->title;
        $video_image=$row->shash;
		$category_name = $row->category_name;
    }
?>
<h3><?php echo $video_title?></h3>
<h5><?php echo __("CF_by")?>

    <a href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/'.$page?>"><b><?php echo $first_name.' '.$name_name?></b></a> 
    <?php echo __("CF_in")?> 
    <?php for($i=0;$i<count($tags);$i++){?>
        <a href="<?php echo site_url('video/search_paging/'.$tags[$i].'/false')?>"><?php echo $tags[$i]?></a>
        <?php if ($i<count($tags)-1) echo ','?>
        <?php ;}?>
    //
<?php echo mdate("%d-%m-%Y", $date)?></h5>              
<h5><b><?php echo __("CF_cate_name")?>: <a href="<?php echo site_url('category/get_category/').'/'.$category.'/5'?>"><?php echo $category_name?></a></b></h5>
<b><?php echo $viewed?> <?php echo __("CF_views")?></b>
<div style="float: right" align="right"><?php $SimpleRatings->create($vid_id);?></div>                                                                                        
<p><a href="<?php echo base_url()?>videos/<?php echo $video_link?>" style="display:block;width:621px;height:380px;"id="player"></a></p>
<p>&nbsp;</p>                  
<p><?php echo $description?></p>
<p></p>
<a class="prev browse left"></a>

<div class="scrollable"> <!--scrollable -->

    <div class="items"> <!-- items close --->
    
        <div>
            <?php
                $ramdomvideo = get_random_by_speaker($speaker_id);
                $temp_video = count($ramdomvideo);
                $total = (count($ramdomvideo)-1>3)?3:count($ramdomvideo)-1;
                for($i=0; $i<=$total; $i++):?>
                <a href="<?php echo site_url('video/play/'.$ramdomvideo[$i]['vid_id'])?>">
                    <img src="<?php echo base_url().'thumbs/'.$ramdomvideo[$i]['shash']?>" width="81" height="46" alt="flickr">
                </a>                            
                <!-- /.content .top_box_block --->
                <?php endfor;?>
         </div>
         <div>
             <?php 
             $total = (count($ramdomvideo)-1>7)?7:count($ramdomvideo)-1;
                for($i=4; $i<=$total; $i++):?>
                <a href="<?php echo site_url('video/play/'.$ramdomvideo[$i]['vid_id'])?>">
                    <img src="<?php echo base_url().'thumbs/'.$ramdomvideo[$i]['shash']?>" width="81" height="46" alt="flickr">
                </a>                            
                <!-- /.content .top_box_block --->
                <?php endfor;?>
      </div>
    </div> <!-- items close --->   
</div> <!--scrollable close--> 
<a class="next browse right"></a>
<!-- javascript coding -->              
  
                     
</div> 
<?php $this->load->view('home/list_video_by_category',$video_by_cat);?>
<script language="JavaScript">    

// custom easing called "custom"
$.easing.custom = function (x, t, b, c, d) {
    var s = 1.70158; 
    if ((t/=d/2) < 1) return c/2*(t*t*(((s*=(1.525))+1)*t - s)) + b;
    return c/2*((t-=2)*t*(((s*=(1.525))+1)*t + s) + 2) + b;
}



// use the custom easing
$("div.scrollable").scrollable({easing: 'custom', speed: 700, circular: true});
</script>         
<script language="JavaScript">
    flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer.commercial-3.2.2.swf",
    {// product key
        key: '#@7fce71ac6b428079f85' ,

        // logo initially has zero opacity
        logo: {   
            url: 'http://confor.us/flowplayer/logo.png',   
            fullscreenOnly: false,   
            top: 10, 
            left: 10,
            displayTime: 2000   
        },
        clip:{autoPlay: true,autoBuffering: true}
    }        
    );
</script>