<div id="content">

    <div class="">
        <h3>User List</h3>
        <table border="1" width="1000">
            <tr align="left">
                <th width="88">First Name</th>
                <th width="121">Company</th>
                <th width="205">Email</th>
                <th width="109">Country</th>
                <th width="124">Description</th>
                <th width="96">Subscription</th>
                <th width="111">Account status </th>
                <th width="44">Action</th>
            </tr>
            <tr>
                <ul id="pagination">
                    <li><?php echo $pagination?></li>
                </ul>
            </tr>
            <?php foreach($query as $row):?>
                <tr>
                    <td><?php echo $row['username']?></td>
                    <td><?php echo $row['company_name']?></td>
                    <td><?php echo $row['email']?></td>
                    <td><?php echo $row['country']?></td>
                    <td><?php echo $row['description']?></td>
                    <td><?php echo $row['userlevel']?></td>
                    <td><?php if((int)$row['status']=='0'){echo 'suspended';}else{echo 'activate';} ?></td>
                    <td><a href="<?php echo site_url("admin/modify_user/".$row['id'])?>">Modify</a></td>
                    <td width="45"><a href="<?php echo site_url("/admin/delete_user/".$row['id'])?>" onclick="return confirm('Are you sure want to delete?');">Delete</a></td>
                </tr>
                <?php endforeach;?>
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
   