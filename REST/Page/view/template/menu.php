<?php 
    if($_REQUEST['page'])
        $page = $_REQUEST['page'];
    else
        $page = '';
?>
    <nav class="navMenu" id='navMenu'>
        <ul>
            <li class='iconBar'><a id="menu-bar-icon" class=" nav-link menu-bar-icon" href='javascript:void(0);'><i id ="icon-menu-sider" class="fas fa-bars"></i><span>Hello Admin!</span></a></li>
            <li><a class=" nav-link" href="index.php"><i class="fas fa-home"></i><span>Trang chủ</span></a></li>
            <li><a class=" nav-link <?php echo $page =='catalog' ?  'activemenu' :  '' ?>" href="index.php?page=catalog"><i class="fas fa-align-left"></i><span>Danh mục</span></a></li>
            <li><a class=" nav-link <?php echo $page =='movie'?  'activemenu' :  '' ?>" href="index.php?page=movie"><i class="fas fa-video"></i><span>Phim</span></a></li>
            <li><a class=" nav-link <?php echo $page =='customer'?  'activemenu' :  '' ?>" href="index.php?page=customer"><i class="fas fa-user-cog"></i><span>Người dùng</span></a></li>
            <li><a class=" nav-link <?php echo $page =='country'?  'activemenu' :  '' ?>" href="index.php?page=country"><i class="fas fa-globe-americas"></i><span>Quốc gia</span></a></li>
            <li><a class=" nav-link <?php echo $page =='comment'?  'activemenu' :  '' ?>" href="index.php?page=comment"><i class="fas fa-comment-dots"></i><span>Bình luận</span></a></li>
            <li><a class=" nav-link <?php echo $page =='package'?  'activemenu' :  '' ?>" href="index.php?page=package"><i class="fas fa-cubes"></i><span>Gói phim</span></a></li>
        </ul>
    </nav>