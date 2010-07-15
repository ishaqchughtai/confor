<?php require 'SimpleRatings/rSystem.php';  ?>
<?php 
        if($video_path){
            if($video_path->num_rows()>0)
            {
                $row = $video_path->row();
                $vid_id=$row->vid_id;
                $top_view_video = $row->vhash;
                $speaker_id = $row->mem_id;
                $video_image=$row->shash;
                $video_title=$row->title;
                $speaker=$row->username;
                $tags=explode(" ",$row->tags);
                $date=$row->date;
                $name=$row->username;
                $viewed=$row->viewed;
                $description=$row->description;
            }
        }
    ?>        
                
<div class="content_item" >
<?php if($video_path){?>
    <h3><?php echo $video_title?></h3>
    <h5>
        <?php echo __("CF_by")?>

        <a href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/'.$page?>"><b><?php echo $name?></b></a> 
        <?php echo __("CF_in")?> 
        <?php for($i=0;$i<count($tags);$i++){?>
            <a href="<?php echo site_url('home/search_paging/'.$tags[$i].'/false')?>"><?php echo $tags[$i]?></a>
            <?php if ($i<count($tags)-1) echo ','?>
            <?php ;}?>
        //
    <?php echo mdate('%F %j%S %Y', $date)?></h5>              
    <h5><b><?php echo $viewed?> <?php echo __("CF_views")?></b></h5>
<?php }?>
<p><a href="<?php echo base_url().'videos/'.$top_view_video;?>" style="display:block;width:621px;height:380px;"id="player"></a></p>    

    <div class="rate_balloon"><?php $SimpleRatings->create($vid_id);?>  
    </div>                   
</div>                    
<p><?php echo $video_path?$description:''?></p>                                        
<!-- /.content_item -->

<?php 
    $advs = get_random_top_adv($category,4);
    //print_r($ar);
    $attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
?>
<div class="x3_2">            
    <?php for($i=0; $i<count($advs); $i++):?>                            
        <div class="x3<?php if(($i+1)%2==0) echo ' no_margin_r';?>" style="border-color:#FFF; border:thick;">
            <a href="<?php echo $advs[$i]['URL']?>" target="_blank"><img src="<?php echo base_url().'assets/uploads/image/'.$advs[$i]['ImageLink']?>" width="285" height="285" class="icon"></a> 
            <p><?php echo $advs[$i]['TextTips']?></p>
        </div>
        <!-- /.content .top_box_block -->
        <?php endfor;?>
        </div>    
<script language="JavaScript">
    flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer.commercial-3.2.2.swf",
    {// product key
        key: '#$7163ea352c072a8b4f2' ,

        // logo initially has zero opacity
    logo: {   
        url: 'http://conferences-formations.com/flowplayer/logo.png',   
        fullscreenOnly: false,   
        top: 10, 
        left: 10,
        displayTime: 2000   
    },
        clip:{autoPlay: false,autoBuffering: true}
    }        
    );
</script>