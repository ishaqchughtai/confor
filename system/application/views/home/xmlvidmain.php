<?php
echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
?>
<config>
    <watermark resource="<?php echo base_url()?>resources/images/<?php echo $watermark_resource?>" align="<?php echo $watermark_align_top;echo ',';echo $watermark_align_rl?>" alpha="0.9"/>
    <controls 
    hd="<?php echo $controls_hd?>"
    show="<?php echo $controls_show?>"/>
    <fullscreen resizable="<?php echo $fullscreen_resizable?>" hideCursor="<?php echo $fullscreen_hideCursor?>" />
    <style global="<?php echo $style_global?>">
        <text><![CDATA[
        title {
        color: #008EB0;
        font-family: Sapir Sans;
        font-size: 18px;
        text-align: center;
        }
        description {
        color: #666666;
        font-family: Sapir Sans;
        font-size: 13px;
        text-align: left;
        }
        index {
        color: #FFD209;
        font-family: Sapir Sans;
        font-size: 10px;
        font-weight: bold;
        text-align: center;
        }
        share {
        color: #FFFFFF;
        font-family: Sapir Sans;
        font-size: 13px;
        text-align: center;
        }
        label {
        color: #CCCCCC;
        font-family: Sapir Sans;
        font-size: 15px;
        text-align: center;
        }
        ]]></text>
    </style>
    
    <share>
        <!-- hide embed code -->
        <embed show="<?php echo $embed?>" />
        <!-- 
            ******** IMPORTANT ********
            
            before enabling embed code features, you'll have to make all paths
            absolute, please refer to help file
        -->
        
        <!-- global default sharing options -->
        <settings
            embedSwf="true"
            url=""
            swfurl=""
            width=""
            height=""
            title=""
            description=""
            screenshot=""
            icons="<?php echo base_url()?>resources/addThis"
        >
            
        <label><![CDATA[
            Partagez cette vidéo <br>(Sélectionnez un réseau social)<br><br>
        ]]></label>
                    
        </settings>
            <!-- for each item, you can set custom sharing options -->
            <item type="facebook" embedSwf="true" title="Playlist player" description="here comes a customizable description text" screenshot="<?php echo base_url()?>resources/images/watermark.png" width="320" height="240"/>
            <item type="twitter"/>
            <item type="digg"/>
            <item type="myspace"/>
            <item type="delicious"/>
            <item type="tumblr"/>
            <item type="blogger"/>
            <item type="technorati"/>
            <item type="email"/>
            <item type="bebo"/>
            <item type="linkedin"/>
            <item type="netvibes"/>
            <item type="reddit"/>
            <item type="virb"/>
            <item type="wordpress"/>
            <item type="more"/>
    </share>
    

    <start resource="<?php echo base_url()?>videos/<?php echo $top_view_video?>" cover="<?php echo base_url()?>thumbs/<?php echo $video_image?>">
        <caption><![CDATA[
                  <title><a href="<?php base_url()?>index.php/video/play/<?php echo $vid_id?>"><?php echo $video_title?></a></title>
                  <description><?php echo $description?></description>
            ]]></caption>
    </start>

</config>