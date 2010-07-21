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


<?php $page = 5;?>          
    <div id="content">
       	<ul class="link_conttrol">
        
        <li><a class="icon_add" href="<?php echo site_url('advertisement/add')?>"><?php echo __("CF_add_new_adv")?></a></li>
    </ul>
    <br />
<script>
var t1=null;
var l1="<p><b><?php echo __("CF_adv_date_begin")?>:</b> <?php echo $date_beginning?><br><b><?php echo __("CF_adv_date_ex")?>:</b> <?php echo $date_expiry?><br><b><?php echo __("CF_advertisement_name")?>:</b> <?php echo $advertiser_name?><br><b><?php echo __("CF_adv_email")?>:</b> <?php echo $advertiser_email?><br><b><?php echo ucwords(strtolower(__("CF_url")))?>:</b> <?php echo $url?><br><b><?php echo ucwords(strtolower(__("CF_text_tips")))?>:</b> <?php echo $text_tips?><br><b><?php echo ucwords(strtolower(__("CF_viewed")))?>:</b> <?php echo $viewed?></p>";
function init()
{
 t1 = new ToolTip("a",true,40);
}
</script>
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
            <script>
var t1=null;
var l1="<p><b><?php echo __("CF_adv_date_begin")?>:</b> <?php echo $date_beginning?><br><b><?php echo __("CF_adv_date_ex")?>:</b> <?php echo $date_expiry?><br><b><?php echo __("CF_advertisement_name")?>:</b> <?php echo $advertiser_name?><br><b><?php echo __("CF_adv_email")?>:</b> <?php echo $advertiser_email?><br><b><?php echo ucwords(strtolower(__("CF_url")))?>:</b> <?php echo $url?><br><b><?php echo ucwords(strtolower(__("CF_text_tips")))?>:</b> <?php echo $text_tips?><br><b><?php echo ucwords(strtolower(__("CF_viewed")))?>:</b> <?php echo $viewed?></p>";
function init()
{
 t1 = new ToolTip("a",true,40);
}
</script>
                <tr>
                
                    <td><img src="<?php echo base_url().'assets/uploads/image/'.$image_link ?>" width="81" height="81" onmouseover=if(t1)t1.Show(event,l1) onmouseout=if(t1)t1.Hide(event) />                    </td>
                    <td><?php echo $date_beginning?></td>
                    <td><?php echo $date_expiry?></td>     
                    <td><?php echo $advertiser_name?></td>
                    <td><a href="mailto:<?php echo $advertiser_email?>"><?php echo $advertiser_email?></a></td>
                    <td><?php echo $viewed?></td>
                    <td width="32"><a href="<?php echo site_url('advertisement/get_advertisement'.'/'.$id)?>"><?php echo mb_strtoupper(__("CF_modify"))?></a></td> 
                  <td width="47"><a href="<?php echo site_url('advertisement/delete'.'/'.$id)?>" onClick="return confirm('<?php echo __("CF_mess_delete")?>');"><?php echo __("CF_del")?></a></td>
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
        <div id="a" style="background-color:ivory;width:300px; height:200px; border: solid 1px gray; text-align: left;">
</div>
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
    <!-- /#content -->
        </div>
        </body>
    
