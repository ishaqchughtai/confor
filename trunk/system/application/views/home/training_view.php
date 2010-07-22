<script type="text/javascript" src="<?php echo base_url().'assets/js/'?>expand.js"></script>
<script type="text/javascript">
    <!--//--><![CDATA[//><!--
    $(function() {
        // --- Using the default options:
        //$("p.expand").toggler();
        // --- Other options:
        //$("p.expand").toggler({method: "toggle", speed: 0});
        $("p.expand").toggler({method: "toggle"});
        //$("p.expand").toggler_temp({method: "toggler"});
        //$("p.expand").toggler({speed: "fast"});
        //$("p.expand").toggler({method: "fadeToggle"});
        //$("p.expand").toggler({method: "slideFadeToggle"});    
        $("#content").expandAll({trigger: "p.expand", ref: "div.demo", localLinks: "p.top a"});
    });
    //--><!]]>
</script>
<style type="text/css">
    /* --------
    The CSS rules offered here are just an example, you may use them as a base. 
    Shape your 'expand/collapse' content so that it meets the style of your site. 
    --------- */
    /* {margin:0; padding:0}
    /* --- Page Structure  --- */

    .collapse p {padding:0 10px 1em}
    .top{font-size:.9em; text-align:right}
    #switch, .switch {margin-bottom:5px; text-align:right}

    /* --- Headings  --- */

    .expand{padding-bottom:.75em}

    /* --- Links  --- */

    .expand a:hover, .expand a:active, .expand a:focus {
        text-decoration:underline
    }
</style>
<?php
    foreach ($query as $row)
    {
        $id          = $row['ID'];
        $date        =$row['Date'];
        $final_date  =date("F jS Y", strtotime($date));
        $title       =$row['Title'];
        $content     =$row['Content'];
    ?>

    <div class = "content_item" id="content">
        <div class="demo">
            <h3><a href = "<?php echo site_url('training_frontend/training_content').'/'.$title?>"><?php echo $title ?></a></h3>
            <h5> <?php echo $final_date ?></h5> 
            <?php echo word_limiter(strip_tags($content), 100); ?>
            <p class="expand" style="font-size: 14px;"><b><?php echo __("CF_continue") ?></b></p>
            <div class="collapse">
                <?php echo $content; ?>
                <p class="top"><a href="#content">Top of page</a></p>
            </div>        
        </div>
    </div>
    <?php
    }
?>
<!-- /.content_item -->

<ul id = "pagination">
    <li><?php echo $pagination ?></li>
</ul>
<!-- /#pagination -->
