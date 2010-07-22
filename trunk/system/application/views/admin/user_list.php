<script language="javascript" type="text/javascript">
function ToolTip(id,isAnimated,aniSpeed)
{ var isInit = -1;
  var div,divWidth,divHeight;
  var xincr=10,yincr=10;
  var animateToolTip =false;
  var html;
  
  function Init(id)
  {
   div = document.getElementById(id);
   if(div==null) return;
   
   if((div.style.width=="" || div.style.height==""))
   {alert("Both width and height must be set");
   return;}
   
   divWidth = parseInt(div.style.width);
   divHeight= parseInt(div.style.height);
   if(div.style.overflow!="hidden")div.style.overflow="hidden";
   if(div.style.display!="none")div.style.display="none";
   if(div.style.position!="absolute")div.style.position="absolute";
   
   if(isAnimated && aniSpeed>0)
   {xincr = parseInt(divWidth/aniSpeed);
    yincr = parseInt(divHeight/aniSpeed);
    animateToolTip = true;
    }
        
   isInit++; 
   
  }
  
    
  this.Show =  function(e,strHTML)
  {
    if(isInit<0) return;
    
    var newPosx,newPosy,height,width;
    if(typeof( document.documentElement.clientWidth ) == 'number' ){
    width = document.body.clientWidth;
    height = document.body.clientHeight;}
    else
    {
    width = parseInt(window.innerWidth);
    height = parseInt(window.innerHeight);
    
    }
    var curPosx = (e.x)?parseInt(e.x):parseInt(e.clientX);
    var curPosy = (e.y)?parseInt(e.y):parseInt(e.clientY);
    
    if(strHTML!=null)
    {html = strHTML;
     div.innerHTML=html;}
    
    if((curPosx+divWidth+10)< width)
    newPosx= curPosx+10;
    else
    newPosx = curPosx-divWidth;

    if((curPosy+divHeight)< height)
    newPosy= curPosy;
    else
    newPosy = curPosy-divHeight-10;

   if(window.pageYOffset)
   { newPosy= newPosy+ window.pageYOffset-200;
     newPosx = newPosx + window.pageXOffset-200;}
   else
   { newPosy= newPosy+ document.body.scrollTop;
     newPosx = newPosx + document.body.scrollLeft;}

    div.style.display='block';
    //debugger;
    //alert(document.body.scrollTop);
    div.style.top= newPosy + "px";
    div.style.left= newPosx+ "px";

    div.focus();
    if(animateToolTip){
    div.style.height= "0px";
    div.style.width= "0px";
    ToolTip.animate(div.id,divHeight,divWidth);}
      
    
    }

    

   this.Hide= function(e)
    {div.style.display='none';
    if(!animateToolTip)return;
    div.style.height= "0px";
    div.style.width= "0px";}
    
   this.SetHTML = function(strHTML)
   {html = strHTML;
    div.innerHTML=html;} 
    
    ToolTip.animate = function(a,iHeight,iWidth)
  { a = document.getElementById(a);
         
   var i = parseInt(a.style.width)+xincr ;
   var j = parseInt(a.style.height)+yincr;  
   
   if(i <= iWidth)
   {a.style.width = i+"px";}
   else
   {a.style.width = iWidth+"px";}
   
   if(j <= iHeight)
   {a.style.height = j+"px";}
   else
   {a.style.height = iHeight+"px";}
   
   if(!((i > iWidth) && (j > iHeight)))      
   setTimeout( "ToolTip.animate('"+a.id+"',"+iHeight+","+iWidth+")",1);
    }
    
   Init(id);
}
</script>
<body onload=init()>
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
            <script>
var t1=null;
var l1="<p><b><?php echo __("CF_company")?>:</b> <?php echo $row['company_name']?><br><b><?php echo __("CF_country")?>:</b> <?php echo $row['name']?><br><b><?php echo __("CF_des")?>:</b> <?php echo  $row['description']?>";
function init()
{
 t1 = new ToolTip("a",true,40);
}
</script>
                <tr>
                    <td><?php echo $row['username']?></td>
                    <td><?php echo $row['email']?></td>
                    <td><?php if((int)$row['status']=='0'){echo 'suspended';}else{echo 'activate';} ?></td>
                    <td><a href="#" onmouseover=if(t1)t1.Show(event,l1) onmouseout=if(t1)t1.Hide(event)><?php echo __("CF_view_details")?></a>
                    </td>
                    <td>
                        <ul>
                            <li><a href="<?php echo site_url("admin/modify_user/".$row['id'])?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></li>
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
        <div id="a" style="background-color:ivory;width:300px; height:200px; border: solid 1px gray; text-align: left;">
</div>
    </div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
        </body>
   