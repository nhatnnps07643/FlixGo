<?php
  //  Lấy quốc gia
    $user = customer_select_all();
    // mail("nhatnn1996@gmail.com","My subject",'my mật khẩu','FROM: FpolyGO ');
?>
<section class="main-movie">
    <?php require './view/template/admin.php'; ?>
  <div class="container-fluid">
    <div class="row justify-content-center mb-5 mt-5 RootClass RootClass">
        <div class="col-md-8">
            <table class="table font-weight-bold mb-0 p-4 tableContent tableUser">
                <thead class='text-white '>
                <tr p-4>
                    <th scope="col">Mã</th>
                    <th scope="col">Họ tên</th>
                    <th scope="col">Email</th>
                    <th scope="col">Số điện thoại</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Phân Quyền</th>
                    <th scope="col">Mật Khẩu </th>
                    <th scope="col">Tạm khóa</th>
                </tr>
                </thead>
                <tbody>
                    <?php 
                        foreach ($user as $value) {
                            extract($value);
                            $strRole = $role == 1 ? 'Admin' : 'User';
                            echo 
                            " <tr data-id='$id'>
                                <td>$id</td>
                                <td>$name</td>
                                <td>$email</td>
                                <td>$number</td>
                                <td>$date</td>
                                <td>$strRole</td>
                                <td><img class='icons' src='./public/img/edit.png' alt=''></td>
                                <td><img class='icons' src='./public/img/trash.png' alt=''></td>
                            </tr>";
                        }
                    ?>
                </tbody>
            </table>
            <nav class="d-flex bg customElement mt-3  pgtable w-100" aria-label="Page navigation example">
            <div class="mr-auto"></div>
            <!-- NAV của phi m lẽ -->
            <ul class="pagination navPage1 pagination-circle  mb-0 mt-1">
              <li class="page-item"><a class="page-link" aria-label="Previous"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
              <?php  
                $countMovie = 30;
                if($countMovie%10==0){
                  for ($i=1; $i <= $countMovie/10; $i++) {
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }else{
                  for ($i=1; $i <= $countMovie/10 + 1; $i++) { 
                    if($i == 1){
                      echo " <li class='page-item active'><a class='page-link'>$i</a></li>";
                    }else{
                      echo " <li class='page-item '><a class='page-link'>$i</a></li>";
                    }
                  }
                }
              ?>
              <li class="page-item"><a class="page-link " aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                <!-- NAV CỦA PHIM BỘ -->
            </ul>
          </nav>
        </div>
        <div class="col-md-3">
            <div class="card-custom shadow card">
                <div class="bg blue-gradient box-top"></div>
                <div class="box-bottom bg-white">
                    <figure>
                        <div class="box-image">
                            <img class="z-depth-1 rounded-circle  card-image" src="./public/img/admin.png" alt="">
                        </div>
                        <figcaption class="p-3">
                            <h4 class=' card-name'><span>Nguyễn Ngọc Nhất</span></h4>
                            <p class=' card-role'>Vai trò <span>Admin</span></p>
                            <p class=' card-email'> Email: <span>nhatnnps07643@fpt.edu.vn</span></p>
                            <p class=' card-number'> Number: <span>096664251</span></p>
                            <p class=' card-date'> Ngày Tạo: <span> 19/2/2017</span></p>
                        </figcaption>
                    </figure>
                </div>
            </div>
        </div>
    </div>
  </div>
</section>
<script src="public/js/thuvien.js"></script>
<script src="public/js/customer.js"></script>
      

