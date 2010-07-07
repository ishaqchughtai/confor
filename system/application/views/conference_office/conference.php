<?php require_once 'SimpleRatings/rSystem.php';  ?>
<div id="left">
    <div class="content_item">
        <style type="text/css">

            #flashcontent {
                overflow: hidden;
            }
        </style>			
        <div class="content_item" id="flashcontent">
            <?php 
                if($video_path)
                {
                    if($video_path->num_rows()>0)
                    {
                        $row = $video_path->row();
                        $vid_id=$row->vid_id;
                        $top_view_video = $row->vhash;
                        $speaker_id = $row->mem_id;
                        $tags=explode(" ",$row->tags);
                        $video_image=$row->shash;
                        $date=$row->date;
                        $viewed=$row->viewed;
                        $video_title=$row->title;
                        $name=$row->username;
                        $description=$row->description;
                    }
                }

            ?>
            <?php if($video_path){?>		
                <h3><?php echo $video_title?></h3>
                <h5><?php echo __("CF_by")?>

                    <a href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/'.$page?>"><b><?php echo $name?></b></a> 
                    <?php echo __("CF_in")?> 
                    <?php for($i=0;$i<count($tags);$i++){?>
                        <a href="#"><?php echo $tags[$i]?></a>
                        <?php if ($i<count($tags)-1) echo ','?>
                        <?php ;}?>
                    //
                <?php echo mdate('%F %j%S %Y', $date)?></h5>              
                <h5><b><?php echo $viewed?> <?php echo __("CF_views")?></b></h5>
                <?php }?>
            <p><a href="<?php echo base_url().'videos/'.$top_view_video;?>" style="display:block;width:621px;height:380px;"id="player"></a></p>
            <?php if($video_path){?>
                <div class="rate_balloon"><?php $SimpleRatings->create($vid_id);?>  
                </div>
                <?php }?> 			
            <p><?php echo $video_path?$description:''?></p>		
        </div>


        <!-- /.content_item -->


        <!-- /.content_item -->
        <?php if($conference_list){?>

            <?php foreach($conference_list as $rows):?>
                <div class="content_item">
                    <h3><a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><?php echo $rows['title'];?></a></h3>
                    <h5>By
                        <a href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/'.$page?>"><b><?php echo $name?></b></a> 
                        in 
                        <?php for($i=0;$i<count($tags);$i++){?>
                            <a href="#"><?php echo $tags[$i]?></a>
                            <?php if ($i<count($tags)-1) echo ','?>
                            <?php ;}?>
                        //
                    <?php echo mdate('%F %j%S %Y', $date)?></h5>
                    <div class="rate_balloon"><?php $SimpleRatings->create($rows['vid_id']);?>  
                    </div> 

                    <p>
                        <a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="202" height="90" alt="" class="alignleft" /></a>
                    </p>

                    <p>
                        <?php echo _substr($rows['description'],200);?>
                    </p>

                    <a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>" class="read_more"><?php echo __("CF_view")?></a>

                </div>
                <?php endforeach?>
            <!-- /.content_item -->
            <ul id="pagination">
                <li><?php echo $pagination?></li>
            </ul>
            <!-- /#pagination -->
            <?php }?>
    </div>
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
        top: 255, 
        right: 10,
        displayTime: 2000   
    },
        clip:{autoPlay: false,autoBuffering: true}
    }        
    );
</script>