<h3><?php echo $row->title?></h3>
<p><a href="<?php echo base_url()?>payvids/<?php echo $row->vhash?>" style="display:block;width:621px;height:380px;"id="player"></a></p>
<?php echo $row->description?>

<script language="JavaScript">
    flowplayer("player", 
    "<?php echo base_url();?>flowplayer/flowplayer.commercial-3.2.2.swf",
    {// product key
        key: '#$7163ea352c072a8b4f2' ,
        // logo initially has zero opacity
        logo: {   
            url: '<?php echo base_url()?>/flowplayer/logo.png',   
            fullscreenOnly: false,   
            top: 10, 
            left: 10,
            displayTime: 2000   
        },
        clip:{autoPlay: true,autoBuffering: true}
    }        
    );
</script>