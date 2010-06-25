</div>   
    <!-- /#content #left - left side of main content -->
    <div id="right">
      <h3>Search</h3>
      <h5>Search through all posts</h5>
      <div class="sidebar_item" id="search">
        <form action="<?php echo site_url('blog/search')?>" method="post">
          <input name="search_field_blog" type="text" class="search_field">
          <input name="search_field" type="submit" class="search_submit" value="">
        </form>
        <!-- #search form -->
      </div>
      <!-- /.sidebar_item #search -->
      <div class="sidebar_item">
        <div id="datepicker"></div>
      </div>
      <div class="sidebar_item">
        <ul id="tabs">
          <li>Categories</li>
          <li>Archives</li>
          <li>Speakers</li>
        </ul>
        <!-- /#tabs -->
          <ul id="ctabs">
                    <li>
                      <ul class="ctabs_content">
                      <?php foreach($categories as $row):?>
                        <li><a href="<?php echo site_url('category/get_category/'.$row['ID']).'/'.$page?>"><?php echo $row['Name']?></a></li>
                        <?php endforeach?>
                      </ul>
                      <!-- /.ctabs_content -->
                    </li>
                    <!-- /#ctabs item -->
                    <li>
                      <ul class="ctabs_content">
                      <?php foreach($dates as $row):?>
                        <li>
                        <a href="<?php echo site_url('video/archives/'.date("m", mdate($row['month_yy'])).'/'.date("Y", mdate($row['month_yy'])).'/'.$page)?>"><?php echo mdate('%F %Y',$row['month_yy']);?>
                        
                        </a>
                        </li>
                      <?php endforeach?>
                      </ul>
                      <!-- /.ctabs_content -->
                    </li>
                    <!-- /#ctabs item -->
                    <li>
                      <ul class="ctabs_content">
                      <?php foreach($top_speaker as $row):?>
                        <li><a href="<?php echo site_url('video/speaker').'/'.$row['mem_id'].'/'.$page?>"><?php echo $row['first_name'].' '.$row['name']?></a></li>
                      <?php endforeach?>
                      </ul>
                      <!-- /.ctabs_content -->
                    </li>
                    <!-- /#ctabs item -->
                  </ul>
        <!-- /#ctabs -->
      </div>
      <!-- /.sidebar_item tabbed content -->
      <div class="sidebar_item">
        <h3>Billets Populaires</h3>
        <?php $this->load->view('blog/billets_populaires',$side_bar);?>		 
        <!-- /#popular_posts -->
        <ul id="pop_nav">
          <li id="prev_pop"></li>
          <!-- /#prev_pop -->
          <li id="next_pop"></li>
          <!-- /#next_pop -->
        </ul>
        <!-- /#pop_nav -->
      </div>
    </div>
    <!-- /#content #right - right side of main content or sidebar -->

		</div>
		<!-- /#content -->
		
	</div>
	<!-- /#top-box -->
</div>
<!-- /#wrapper -->	
			