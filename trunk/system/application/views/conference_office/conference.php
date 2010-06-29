
<div id="left">
    <div class="content_item">
        <style type="text/css">

            #flashcontent {
                overflow: hidden;
            }
        </style>			
        <div class="content_item" id="content">
            <?php 
                if($video_path->num_rows()>0)
                {
                    $row = $video_path->row();
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
            ?>		
            <h3><?php echo $video_title?></h3>
              <h5>By
              
              <a href="<?php echo site_url('video/speaker').'/'.$speaker_id.'/'.$page?>"><b><?php echo $name?></b></a> 
			   in 
			  <?php for($i=0;$i<count($tags);$i++){?>
                      <a href="#"><?php echo $tags[$i]?></a>
                      <?php if ($i<count($tags)-1) echo ','?>
                      <?php ;}?>
               //
			  <?php echo mdate('%F %j%S %Y', $date)?></h5>              
              <h5><b><?php echo $viewed?> views</b></h5>
            <script type="text/javascript">			

                var flashvars = {
                    cover: "<?php echo base_url().'thumbs/'.$video_image?>",								// Cover url.
                    source: "<?php echo base_url().'videos/'.$top_view_video?>",								// Source url.
                    autoPlay: false,											// Defines if vPlayer plays the video automatically.
                    scaleMode: "full",											// Defines how the video scale is fit to vPlayer (full, fitToWidthAndHeight, noScale).
                    bufferTime: 3,												// It is the time in seconds that an instance of VPlayer must load a video stream to reproduce.
                    loop: false,												// Defines if vPlayer loops the video.
                    controlsScale: 2,											// Defines the size of vPlayer controls scale. Default value is 2.5, minimum 1, maximun 10.
                    controlsAutoHide: true,										// Defines if controls are automatically hidden.
                    controlsHideDelay: 3,										// Defines the control hide delay.
                    allowFullScreen: true,										// Allows to play the video in full screen mode.
                    fullScreenOnPlay: false,									// Defines if VPlayer shows in full screen mode when user plays the video.
                    glossy: true,												// Determines if control shows a shine effect.
                    tooltipType: "follower",									// Defines how playback time is showed (none, normal, follower).
                    logo: true,													// Allows to visualize a logotype.
                    logoAutoHide: true,											// Defines if the logo hides when controls are hidden.
                    logoURL: "http://conferences-formations.com",		// URL that will be followed when you click on the logo.
                    logoAlign: "topLeft",									// Defines the logotype alignment inside VPlayer.
                    iconsAlign: "topRight",										// Defines the icons alignment inside VPlayer (topLeft, topRight, bottomLeft, bottomRight).
                    grid: false,												// Defines if a dot pattern over the video is showed.
                    gridPresset: 1,												// Defines the dot pattern that will be used from 0 to 9.
                    color: 0xffffff,											// Defines VPlayer primary color.
                    backgroundColor: 0xffffff,									// Defines background color.
                    backgroundAlpha: 1											// Defines background transparency level.
                };

                var params = {allowFullScreen:"true", allowscriptaccess:"always", menu:"true", scale:"noscale", salign:"tl"};
                var attributes = {id:"vPlayerPlugin"};

                swfobject.embedSWF("<?php echo base_url();?>vPlayer/vPlayerPlugin.swf", "flashmovie", 621, 344, "10.0.0", "<?php echo base_url();?>vPlayer/flashdetect/expressInstall.swf", flashvars, params, attributes);
            </script>
            <div id="flashmovie">
                <strong>Please update your flash player <a href="http://www.adobe.com/go/getflashplayer/">here.</a></strong>
            </div>
            <script type="text/javascript">
                scale = new FlashScaler("flashcontent", 640, 360);
            </script>			
            <p><?php echo $description?></p>		
        </div>


        <!-- /.content_item -->


        <!-- /.content_item -->
        <?php foreach($conference_list as $rows):?>
        <p>&nbsp</p>
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


        <p>
            <a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>"><img src="<?php echo base_url().'thumbs/'.$rows['shash']?>" width="202" height="90" alt="" class="alignleft" /></a>
        </p>

        <p>
            <?php echo _substr($rows['description'],200);?>
        </p>

        <a href="<?php echo site_url('home/play').'/'.$rows['vid_id']?>" class="read_more">View</a>

        </div>
            <?php endforeach?>
        <!-- /.content_item -->
        <ul id="pagination">
        <li><?php echo $pagination?></li>
      </ul>
        <!-- /#pagination -->

    </div>
</div>