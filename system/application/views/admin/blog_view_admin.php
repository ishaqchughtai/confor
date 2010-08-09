<script type="text/javascript">
    $(function(){       
        $('#lg').change(function()
        {
            $('#lg :selected').each(function(i, selected){                           
                var lg = $(selected).val();                
                var cate = $('#vid_cate option:selected').val();                
                gogo = XEMMEX.baseUrl + "blog/blog_list/" + lg;    
                window.location = gogo;            
            });    
        });    
    });    
    //-->
</script>
<script type="text/javascript">
function search_click(){
 title = $('#title').val();
 gogo = XEMMEX.baseUrl + "blog/search/<?php echo $lang?>/" + title + "/5";
 window.location = gogo;
 return false;
}
</script>
<?php $page = 5;?> 
<?php $this->load->view("admin/admin_menu_blog");?>
<ul class="link_conttrol">
         <li><a class="icon_profile" href="<?php echo site_url('metadata/get_metadata/blog_list/1')?>"><?php echo __("CF_edit_meta")?></a></li>
    </ul>
<br />
<br />  
<!-- /.content_item -->
<div class="content_item">
<div class="input text">
    <label>Display language</label>        
    <?php choose_your_language($lg);?>
</div>
<div class="sidebar_item" id="search">
    <form action="<?php echo site_url('blog/search/'.$lang)?>" method="post">
        <input name="search_field_blog_admin" type="text" class="short" id="title">
        <input name="search_field" type="submit" class="submit"  value="<?php echo __("CF_search")?>">
    </form>
    <!-- #search form -->
</div>      
<table width="100%" border="1">
    <tr align="left">
        <th width="10%"><?php echo __("CF_your_name")?></th>   
        <th width="50%"><?php echo __("CF_title")?></th>    
        <th width="15%"><?php echo __("CF_date")?></th>
        <th width="10%"><?php echo __("CF_blog_comment")?></th>
        <th width="15%"><?php echo __("CF_action")?></th>
    </tr>
    <?php
        foreach($query as $row){                               
            $id = $row['ID'];
            $link = $row['Link'];
            $title = $row['Title'];
            $subject = $row['Subject'];
            $keywords = $row['Keywords'];
            $key = explode(" ", $keywords);
            $text = $row['Text'];
            $CountView = $row['CountView'];                          
            $author = $row['Name'];
            $author_name = $row['FirstName'];
            $date = $row['Date'];
            $final_date=date("d-m-Y", strtotime($date));
            $countcomment = $row['CountComment'];     
        ?>
        <tr>
            <td><?php echo $author_name?></td>
            <td><a href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$id.'/'.$title); ?>" class="read_more" target="_blank"><?php echo $title?></a></td>
            <td><?php echo $final_date?></td>
            <td><?php echo $countcomment;?></td>
            <td><li style="list-style-type:none">
                    <div align="center"><label><a href="<?php echo site_url('blog/get_blog').'/'.$id?>"><?php echo __("CF_edit")?></a></label></div>
                </li>
                <li style="list-style-type:none">
                    <div align="center"><label><a href="<?php echo site_url('blog/delete_blog').'/'.$id?>"onclick="return confirm('<?php echo __("CF_mess_delete")?>')"><?php echo __("CF_remove")?></a></label></div>
                </li>
            </td> 
        </tr>
        <?php }?>
    <tr>
        <td colspan="8" height="50" valign="midle">               
            <ul id="pagination">
                <?php echo $pagination?>
            </ul>
        </td>
    </tr> 
    </table>

    
