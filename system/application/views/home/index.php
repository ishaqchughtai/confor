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
                $lg=$row->lang;
                $description=$row->description;
				$category_id=$row->category;
				$category_name = $row->category_name;
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
    <?php echo mdate("%d-%m-%Y", $date)?></h5>              
	<h5><b><?php echo __("CF_cate_name")?>: <a href="<?php echo site_url('category/get_category/').'/'.$category_id.'/5'?>"><?php echo $category_name?></a></b></h5>
    <h5><b><?php echo $viewed?> <?php echo __("CF_views")?></b></h5>
<?php }?>
<?php $linktopvideo=$video_path?base_url().'videos/'.$top_view_video:"";

?>
<p><a href="<?php echo $linktopvideo;?>" style="display:block;width:621px;height:380px;"id="player"></a></p>    

    <div class="rate_balloon"><?php $SimpleRatings->create($video_path?$vid_id:null);?>  
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
            <a href="<?php echo site_url('advertisement/go_to/'.$advs[$i]['ID'])?>" target="<?php 
			if($advs[$i]['Target'] ==1)  echo '_blank';
			else echo '_parent'?>"><img src="<?php echo base_url().'assets/uploads/image/'.$advs[$i]['ImageLink']?>" width="285" height="285" class="icon" alt="<?php echo $advs[$i]['TextTips']?>"></a>
 
            <br /> <br /> <br />

        </div>
        <!-- /.content .top_box_block -->
        <?php endfor;?>
        </div>   
        </body> 
<script language="JavaScript">
    flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer.commercial-3.2.2.swf",
    {// product key
        key: '#@fbc4ccc0d3f30d1d937' ,

        // logo initially has zero opacity
    logo: {   
        url: 'http://confor.us/flowplayer/logo.png',   
        fullscreenOnly: false,   
        top: 10, 
        left: 10,
        displayTime: 2000   
    },
        clip:{autoPlay: false,autoBuffering: true}
    }        
    );
</script>
