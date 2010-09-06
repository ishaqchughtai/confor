<script type="text/javascript" src="<?php echo base_url()?>resources/js/swfobject.js"></script>
<script type="text/javascript" src="<?php echo base_url()?>resources/js/fixMouseWheel.min.js"></script>
        <style>
            .mouseWheelFix {
                width: 100%;
                height: 380px;
                margin-left: auto;
                margin-right: auto;
            }
        </style>

<?php $page = 5;?>
<?php require 'SimpleRatings/rSystem.php';  ?>
</style>
<body>
<div >
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
<script type="text/javascript">
            swfobject.embedSWF("<?php echo base_url()?>playlistPlayer.swf", "showItem", "620", "380", "9.0.0","",{
                // flash vars
                "player.xml":"<?php echo site_url('video/xmlvid/'.$vid_id)?>.xml"
            },{
                // params
                bgcolor:"#ffffff",
                allowfullscreen:"true"
                
            });
        </script>
<h3><?php echo $video_title?></h3>
<div class="mouseWheelFix">
    <div id="showItem"></div>
</div>   
<b><?php echo $viewed?> <?php echo __("CF_views")?></b>
<div style="float: right" align="right"><?php $SimpleRatings->create($vid_id);?></div>                                                                                       

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
             
<p><?php echo $description?></p>
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
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
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
</body> 

