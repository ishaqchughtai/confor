<?php $this->load->view("admin/admin_menu_blog");?>
<?php                              
        foreach($query_comment_entry as $row)
        {
            $id = $row->ID;
            $comment = $row->Comment;                       
            $author = $row->Author;
            $date = $row->Date;
            $email=$row->Email;
            $final_date=date("d-m-Y", strtotime($date));   
        }   
    ?>
<div class="content_item">
<br/>
<h2><p><?php echo __("CF_cm_entry")?></p></h2>
<p><label><?php echo __("CF_your_name")?> : </label><?php echo $author?></p>
<p><label><?php echo __("CF_date")?> : </label><?php echo $final_date?></p>
<p><label><?php echo __("CF_email")?> : </label><?php echo $email?></p>
<p><label><?php echo __("CF_blog_body")?> : </label><?php echo $comment?></p>
</div>