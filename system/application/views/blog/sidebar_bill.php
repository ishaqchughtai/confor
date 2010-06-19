</div>

    <!-- /#content #left - left side of main content -->
    <div id="right">
      <h3>Search</h3>
      <h5>Search through all posts</h5>
      <div class="sidebar_item" id="search">
        <form action="<?php echo site_url('blog/search')?>" method="post">
          <input name="search_field" type="text" class="search_field">
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
              <li><a href="#">Actuality</a></li>
              <li><a href="#">Technology</a></li>
              <li><a href="#">Interview</a></li>
              <li><a href="#">Design</a></li>
              <li><a href="#">Mobile</a></li>
              <li><a href="#">Movies</a></li>
            </ul>
            <!-- /.ctabs_content -->
          </li>
          <!-- /#ctabs item -->
          <li>
            <ul class="ctabs_content">
              <li><a href="#">March 2010 (8)</a></li>
              <li><a href="#">February 2010 (3)</a></li>
              <li><a href="#">January 2010 (14)</a></li>
              <li><a href="#">December 2009 (17)</a></li>
              <li><a href="#">November 2009 (22)</a></li>
            </ul>
            <!-- /.ctabs_content -->
          </li>
          <!-- /#ctabs item -->
          <li>
            <ul class="ctabs_content">
              <li><a href="#">Robert Piche?</a></li>
              <li><a href="#">Hubert Reeves</a></li>
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
			