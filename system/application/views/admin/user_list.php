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
    }
</style>
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
<div id="content">

    <div class="">
        <h3><?php echo __("CF_user_list")?></h3>
        <table border="1" width="100%">
            <tr align="left">
                <th width="20%"><?php echo __("CF_name")?></th>
                <th width="30%"><?php echo __("CF_email")?></th>
                <th width="10%"><?php echo __("CF_status_acc")?> </th>
                <th width="30%"><?php echo __("CF_details")?> </th>
                <th width="10%"><?php echo __("CF_action")?></th>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['username']?></td>
                    <td><?php echo $row['email']?></td>
                    <td><?php if((int)$row['status']=='0'){echo 'suspended';}else{echo 'activate';} ?></td>
                    <td><a href="#"onMouseover="ddrivetip(
                        '<p><b><?php echo __("CF_company")?>:</b> <?php echo $row['company_name']?><br><b><?php echo __("CF_country")?>:</b> <?php echo $row['name']?><br><b><?php echo __("CF_des")?>:</b> <?php echo  $row['description']?>',
                        'white', 300)"; onMouseout="hideddrivetip()"><?php echo __("CF_view_details")?></a>
                    </td>
                    <td>
                        <ul>
                            <li><a href="<?php echo site_url("admin/modify_user/".$row['id'])?>"><?php echo __("CF_modify")?></a></li>
                            <li><a href="<?php echo site_url("/admin/delete_user/".$row['id'])?>" onclick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></li>
                        </ul>
                    </td>
                </tr>
                <?php endforeach;?>
            <tr>
                <td colspan="8" height="50" valign="midle">               
                    <ul id="pagination">
                        <?php echo $pagination?>
                    </ul>
                </td>
            </tr>
        </table>
        <!-- /.x2 - represents a half windows size div -->
        <!-- /.x2 - represents a half windows size div -->
        <!--                  -->
        <!-- END OF .x2 CLASS -->
        <!--                  -->
        <div class="divider"></div>
        <!-- /.divider -->
        <!-- /.x4 - represents a fourth windows size div -->

    </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
   