            <div id="content">

                <div class="x2">

                    <h3>Profile administrator</h3>
                    <ul>
                        <li><a href="<?php echo site_url('admin/list_admin')?>">Administrator List</a></li>
                        <li><a href="<?php echo site_url('admin/add_new_admin')?>">New administrator</a></li>
                        <li><a href="<?php echo site_url('admin/list_user')?>">User List</a></li>
                        <li><a href="<?php echo site_url('admin/list_video_conference')?>">Video conference List</a></li>
                        <li><a href="<?php echo site_url('admin/new_video_conference')?>">New video conference</a></li>
                    </ul>
                    <p>&nbsp;</p>

                </div>
                <!-- /.x2 - represents a half windows size div -->

                <div class="x2 no_margin">

                    <h3>Speakers Control</h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porta nibh metus. Aliquam eget tellus vulputate nibh feugiat dictum nec nec tellus. Nullam vel turpis sit amet erat cursus hendrerit in ut odio. Quisque aliquam, leo a ultricies pulvinar, mi erat ullamcorper quam, sit amet ornare erat lacus non nisl. Proin facilisis tempor lobortis. Sed magna eros, aliquam euismod fringilla quis, mattis et nisi.</p>

                </div>
                <!-- /.x2 - represents a half windows size div -->

                <!--                  -->

                <!-- END OF .x2 CLASS -->

                <!--                  -->

                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
            <!-- /#content -->

            <div id="content">

                <div class="x2">

                    <h3>Conferences Control</h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porta nibh metus. Aliquam eget tellus vulputate nibh feugiat dictum nec nec tellus. Nullam vel turpis sit amet erat cursus hendrerit in ut odio. Quisque aliquam, leo a ultricies pulvinar, mi erat ullamcorper quam, sit amet ornare erat lacus non nisl. Proin facilisis tempor lobortis. Sed magna eros, aliquam euismod fringilla quis, mattis et nisi.</p>
 
                </div>
                <!-- /.x2 - represents a half windows size div -->

                <div class="x2 no_margin">

                    <h3>Event Control </h3>

                    <div class="x2">

                        <label>Total event : </label>
                        <br /> 
                            <label>Event last :  </label><a href="" target="_blank">Continue Reading  </a>
                        <br />
                            <label></label>
                            <p>


                        <form id="new_event" name="new_event" method="post" action="<?php echo site_url('event/add_event')?>">
                            <label>
                                <input name="btnnew_event" type="submit" id="btnnew_event" value="New Event"  class="submit"/>
                            </label>
                        </form>     
                        <form id="list_event" name="list_event" method="post" action="<?php echo site_url("event/event_list")?>">
                            <label>
                                <input name="btnlist_event" type="submit" id="btnlist_event" value="List Event" class="submit" />
                            </label>
                        </form>
                    </div>

                </div>
                <!-- /.x2 - represents a half windows size div -->

                <!--                  -->

                <!-- END OF .x2 CLASS -->

                <!--                  -->

                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
            <!-- /#content -->

            <div id="content">

                <div class="x2">

                    <h3>Ticket Control</h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porta nibh metus. Aliquam eget tellus vulputate nibh feugiat dictum nec nec tellus. Nullam vel turpis sit amet erat cursus hendrerit in ut odio. Quisque aliquam, leo a ultricies pulvinar, mi erat ullamcorper quam, sit amet ornare erat lacus non nisl. Proin facilisis tempor lobortis. Sed magna eros, aliquam euismod fringilla quis, mattis et nisi.</p>
        
                </div>
                <!-- /.x2 - represents a half windows size div -->

                <div class="x2 no_margin">

                    <h3>Shop Control </h3>

                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer porta nibh metus. Aliquam eget tellus vulputate nibh feugiat dictum nec nec tellus. Nullam vel turpis sit amet erat cursus hendrerit in ut odio. Quisque aliquam, leo a ultricies pulvinar, mi erat ullamcorper quam, sit amet ornare erat lacus non nisl. Proin facilisis tempor lobortis. Sed magna eros, aliquam euismod fringilla quis, mattis et nisi.</p>

                </div>
                <!-- /.x2 - represents a half windows size div -->

                <!--                  -->

                <!-- END OF .x2 CLASS -->

                <!--                  -->

                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
            <!-- /#content -->

            <div id="content">

                <div class="x2">

                    <h3>Blog Control</h3>
             
                    <div class="x2">

                        <label>Total blog : </label>
                        <br /> 
                            <label>Blog last :  </label><a href="" target="_blank">Continue Reading  </a>
                        <br />
                            <label>Most blogs have some comments: </label>
                            <a href="" target="_blank">Continue Reading  </a>
                        <p>


                        <form id="new_blog" name="new_blog" method="post" action="<?php echo site_url('blog/add_blog')?>"  target="_blank">
                            <label>
                                <input name="new_blog" type="submit" id="new_blog" value="New Blog"  class="submit"/>
                            </label>
                        </form>     
                        <form id="list_blog" name="list_blog" method="post" action="<?php echo site_url("blog/blog_list")?>" target="_blank">
                            <label>
                                <input name="list_blog" type="submit" id="list_blog" value="List Blog" class="submit" />
                            </label>
                        </form>
                    </div>
                </div>
                <!-- /.x2 - represents a half windows size div -->

                <div class="x2 no_margin">

                    <h3>Paying advertisements Control </h3>

                    <div class="x2">

                        <label>Total advertisement : </label>
                        <br /> 
                            <label>Advertisement last :  </label>
                            <a href="" target="_blank">Continue Reading  </a>
                        <br />
                            <label></label>
                            <p>


                        <form id="new_advertisement" name="new_advertisement" method="post" action="<?php echo site_url('advertisement/add')?>">
                            <label>
                            <input name="new_advertisement" type="submit" id="new_advertisement" value="New Advertisement"  class="submit"/>
                            </label>
                        </form>     
                        <form id="list_advertisement" name="list_advertisement" method="post" action="<?php echo site_url("advertisement/advertisement_list")?>">
                            <label>
                                <input name="list_advertisement" type="submit" id="list_advertisement" value="List Advertisement" class="submit" />
                            </label>
                        </form>
                  </div>

                </div>
                <!-- /.x2 - represents a half windows size div -->

                <!--                  -->

                <!-- END OF .x2 CLASS -->

                <!--                  -->

                <div class="divider"></div>
                <!-- /.divider -->
                <!-- /.x4 - represents a fourth windows size div -->

            </div>
            <!-- /#content -->
        </div>
      