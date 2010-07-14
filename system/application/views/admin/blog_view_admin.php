<?php $this->load->view("admin/admin_menu_blog");?>
<br />
<br />  
<!-- /.content_item -->
<div class="content_item">

<div class="sidebar_item" id="search">
    <form action="<?php echo '#'?>" method="post">
        <input name="search_field_blog" type="text" class="search_field">
        <input name="search_field" type="submit" class="search_submit" value="">
    </form>
    <!-- #search form -->
</div>      
<table width="100%" border="1">
    <tr align="left">
        <th width="10%"><?php echo __("CF_your_name")?></th>   
        <th width="30%"><?php echo __("CF_title")?></th>    
        <th width="15%"><?php echo __("CF_date")?></th>
        <th width="10%"><?php echo __("CF_blog_comment")?></th>
        <th width="15%"><?php echo __("CF_action")?></th>
    </tr>
    <?php
        foreach($query as $row){                               
            $id = $row['ID'];
            $link = $row['Link'];
            $title_en = $row['Title'];
            $title_fr = $row['Title_fr'];
            $subject_en = $row['Subject'];
            $subject_fr = $row['Subject_fr'];
            $keywords = $row['Keywords'];
            $key = explode(" ", $keywords);
            $text_en = $row['Text'];
            $text_fr = $row['Text_fr'];
            $CountView = $row['CountView'];                          
            $author = $row['Name'];
            $date = $row['Date'];
            $final_date=date("F jS Y", strtotime($date));
            $countcomment = $row['CountComment'];
            if($lang == 'en')
            {
                $title=$title_en;
                $subject=$subject_en;
                $text=$text_en;
            }elseif($lang == 'fr')
            {
                $title=$title_fr;
                $subject=$subject_fr;
                $text=$text_fr;
            }      
        ?>
        <tr>
            <td><?php echo $author?></td>
            <td><a href="<?php echo site_url('blog_frontend/blog_content_admin/'.$author.'/'.$title); ?>" class="read_more" target="_blank"><?php echo $title?></a></td>
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
        <td colspan="8" valign="center">               
            <ul id="pagination">
                <?php echo $pagination?>
            </ul>
        </td>
    </tr> 
    </table>

    
