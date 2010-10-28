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
            $first_name=$row->first_name;
            $name_name=$row->name;
            $viewed=$row->viewed;
            $lg=$row->lang;
            $description=$row->description;
            $category_id=$row->category;
            $category_name = $row->category_name;
        }
    }
?>  
<?php if($lang=='fr'){
        $playlistPlayer='playlistPlayer.swf';    
    }else{
        $playlistPlayer='playlistPlayer_en.swf';    
    }
?>
<script type="text/javascript">
    swfobject.embedSWF("<?php echo base_url().$playlistPlayer?>", "showItem", "620", "380", "9.0.0","",{
        // flash vars
        "player.xml":"<?php echo site_url('home/xmlvid/'.$vid_id)?>.xml"
    },{
        // params
        bgcolor:"#ffffff",
        allowfullscreen:"true"
    });
</script>          
<body>
    <div class="content_item" >
        <?php if($video_path){?>
            <h3><?php echo $video_title?></h3>
            <div class="mouseWheelFix">
                <div id="showItem"></div>
            </div>   	
            <b><?php echo $viewed?> <?php echo __("CF_views")?></b>
            <div style="float: right"><?php $SimpleRatings->create($video_path?$vid_id:null);?></div>      
            <?php $linktopvideo=$video_path?base_url().'videos/'.$top_view_video:"";?>

        </div>
        <h5>
            <?php echo __("CF_by")?>

            <a alt="<?php echo $first_name.' '.$name_name?>" title="<?php echo $first_name.' '.$name_name?>" href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/5'?>"><b><?php echo $first_name.' '.$name_name?></b></a> 
            <?php echo __("CF_in")?> 
            <?php for($i=0;$i<count($tags);$i++){?>
                <a alt="<?php echo $tags[$i]?>" title="<?php echo $tags[$i]?>" href="<?php echo site_url('video/search_tag/'.$tags[$i])?>"><?php echo $tags[$i]?></a>
                <?php if ($i<count($tags)-1) echo ','?>
                <?php ;}?>
            //
        <?php echo mdate("%d-%m-%Y", $date)?></h5>              
        <h5><b><?php echo __("CF_cate_name")?>: <a alt="<?php echo $category_name?>" title="<?php echo $category_name?>" href="<?php echo site_url('category/get_category/').'/'.$category_id.'/5'?>"><?php echo $category_name?></a></b></h5>
        <?php }?>



    <p><?php echo $video_path?$description:''?></p>                                        
    <!-- /.content_item -->

    <?php 
        $advs = get_random_top_adv();
        //print_r($ar);
        $attr = array('width'=>'89', 'height'=>'75', 'class'=>'icon');
    ?>
    <div class="x3_2">            
        <?php for($i=1; $i<=count($advs); $i++):?>

            <div class="x3<?php if(($i+1)%2==0) echo ' no_margin_r';?>" style="border-color:#FFF; border:thick;">
                <a alt="<?php echo $advs[$i]['TextTips']?>" title="<?php echo $advs[$i]['TextTips']?>" href="<?php echo site_url('advertisement/go_to/'.$advs[$i]['ID'])?>" target="<?php 
                        if($advs[$i]['Target'] ==1)  echo '_blank';
                        else echo '_parent'?>">
                        <img src="<?php echo base_url().'assets/uploads/image/'.$advs[$i]['ImageLink']?>" width="285" height="285" class="icon" alt="<?php echo $advs[$i]['TextTips']?>"></a>

                <br /><br />

            </div>
            <!-- /.content .top_box_block -->
            <?php endfor;?>
    </div>
    <?php $advs_text=get_random_text_adv();
        $attr=array('width'=>'89', 'height'=>'75', 'class'=>'icon');
    ?>
    <div class="x3_2">
        <?php foreach($advs_text as $item_text){?>
        <div class="x3">
            <label><?php echo $item_text['Title']?>:</label>  
            <br/>          
            <a href="<?php echo $item_text['URL']?>" target="_blank"><?php echo $item_text['Body']?></a>
            <p></p>
        </div>
        <?php };?>
    </div>   
        </body>           
