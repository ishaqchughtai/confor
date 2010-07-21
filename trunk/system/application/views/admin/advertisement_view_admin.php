<style type="text/css">#dhtmltooltip{
position: absolute;
width: 150px;
border: 2px solid black;
padding: 2px;
background-color: lightyellow;
visibility: hidden;
z-index: 100;
/*Remove below line to remove shadow. Below line should always appear last within this CSS*/
filter: progid:DXImageTransform.Microsoft.Shadow(color=gray,direction=135);
}</style>
<div id="dhtmltooltip"></div>
<script type="text/javascript">
var offsetxpoint=-60 //Customize x offset of tooltip
var offsetypoint=20 //Customize y offset of tooltip
var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thecolor, thewidth){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var rightedge=ie&&!window.opera? ietruebody().clientWidth-event.clientX-offsetxpoint : window.innerWidth-e.clientX-offsetxpoint-20
var bottomedge=ie&&!window.opera? ietruebody().clientHeight-event.clientY-offsetypoint : window.innerHeight-e.clientY-offsetypoint-20

var leftedge=(offsetxpoint<0)? offsetxpoint*(-1) : -1000

//if the horizontal distance isn't enough to accomodate the width of the context menu
if (rightedge<tipobj.offsetWidth)
//move the horizontal position of the menu to the left by it's width
tipobj.style.left=ie? ietruebody().scrollLeft+event.clientX-tipobj.offsetWidth+"px" : window.pageXOffset+e.clientX-tipobj.offsetWidth+"px"
else if (curX<leftedge)
tipobj.style.left="5px"
else
//position the horizontal position of the menu where the mouse is positioned
tipobj.style.left=curX+offsetxpoint+"px"

//same concept with the vertical position
if (bottomedge<tipobj.offsetHeight)
tipobj.style.top=ie? ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint+"px" : window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint+"px"
else
tipobj.style.top=curY+offsetypoint+"px"
tipobj.style.visibility="visible"
}
}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip

</script>

<?php $page = 5;?>          
    <div id="content">
       	<ul class="link_conttrol">
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_add_new_adv")?></a></li>
    </ul>
    <br />
        <h3><?php echo __("CF_list_event")?></h3><br />
        <table border="1" width="100%">
            <tr align="left">
                <th width="84"><?php echo __("CF_pre")?></th>
                <th width="100"><?php echo mb_strtoupper(__("CF_adv_date_begin"))?></th>
                <th width="100"><?php echo mb_strtoupper(__("CF_adv_date_ex"))?></th>
                <th width="240"><?php echo mb_strtoupper(__("CF_advertisement_name"))?></th>
                <th width="240"><?php echo mb_strtoupper(__("CF_advertisement_email"))?></th>
                <th width="32"><?php echo __("CF_viewed")?></th>
                <th width="32" align="center"><?php echo mb_strtoupper(__("CF_action"))?></th>
            </tr>
            
            <?php foreach($query as $row):?>
            <?php 					
						$id = $row['ID'];
						$date_beginning = date("M jS Y", strtotime($row['DateBeginning']));
						$date_expiry = date("M jS Y", strtotime($row['DateExpiry']));
						$advertiser_name = $row['AdvertiserName'];
						$advertiser_email = $row['AdvertiserEmail'];
						$url = $row['URL'];
						$text_tips = $row['TextTips'];                           
						$image_link = $row['ImageLink'];
						$viewed = $row['Viewed']; 					
			?>
                <tr>
                    <td><img src="<?php echo base_url().'assets/uploads/image/'.$image_link ?>" width="81" height="81" onMouseover="ddrivetip(
                    '<p><b><?php echo __("CF_adv_date_begin")?>:</b> <?php echo $date_beginning?><br><b><?php echo __("CF_adv_date_ex")?>:</b> <?php echo $date_expiry?><br><b><?php echo __("CF_advertisement_name")?>:</b> <?php echo $advertiser_name?><br><b><?php echo __("CF_adv_email")?>:</b> <?php echo $advertiser_email?><br><b><?php echo ucwords(strtolower(__("CF_url")))?>:</b> <?php echo $url?><br><b><?php echo ucwords(strtolower(__("CF_text_tips")))?>:</b> <?php echo $text_tips?><br><b><?php echo ucwords(strtolower(__("CF_viewed")))?>:</b> <?php echo $viewed?></p>',
                    'white', 300)"; onMouseout="hideddrivetip()" />                    </td>
                    <td><?php echo $date_beginning?></td>
                    <td><?php echo $date_expiry?></td>     
                    <td><?php echo $advertiser_name?></td>
                    <td><a href="mailto:<?php echo $advertiser_email?>"><?php echo $advertiser_email?></a></td>
                    <td><?php echo $viewed?></td>
                    <td width="32"><a href="<?php echo site_url('advertisement/get_advertisement'.'/'.$id)?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td> 
                  <td width="47"><a href="<?php echo site_url('advertisement/delete'.'/'.$id)?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
                </tr>
                <?php endforeach;?>
        </table>
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->
        <div>
            <ul id="pagination">
                    <li><?php echo $pagination?></li>
                </ul>
        </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
    
