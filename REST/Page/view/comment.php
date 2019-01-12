
<?php
   //  Lấy bình luận
     $comment = comment_select_all();
?>
 
 <section class="main-movie">
     <?php require './view/template/admin.php'; ?>
   <div class="container-fluid">
     <div class="row  mb-5 mt-5 RootClass RootClass justify-content-center">
         <div class="col-md-8">
             <table class="table table-striped bg-white font-weight-bold mb-0 p-4 tableComment">
                 <thead class='text-white '>
                 <tr p-4>
                     <th scope="col">Mã</th>
                     <th scope="col">Nội dung</th>
                     <th scope="col">Người bình luận</th>
                     <th scope="col">Ngày tạo</th>
                     <th scope="col">Phim</th>
                     <th scope="col"><img src="./public/img/like.png" alt=""></th>
                     <th scope="col"><img src="./public/img/dislike.png" alt=""></th>
                     <th scope="col">Xóa</th>
                 </tr>
                 </thead>
                 <tbody>
                     <?php 
                         foreach ($comment as $comment) {
                             extract($comment);
                             echo 
                             " <tr data-id='$id'>
                                 <td>$id</td>
                                 <td class='content-comment'>$content</td>
                                 <td>$id_customer</td>
                                 <td>$date</td>
                                 <td>$id_movie</td>
                                 <td>$likes</td>
                                 <td>$unlikes</td>
                                 <td><img class='icons delete' src='./public/img/trash.png' alt=''></td>
                             </tr>";
                         }
                     ?>
                 </tbody>
             </table>
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
                             <p class=' card-movie'>Phim: <span>Hận bà chủ</span></p>
                             <p class=' card-content'> Nội dung: <span>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Dolor error eius, molestias ex aliquid distinctio cumque quia mollitia et minima hic repellat, aut ducimus architecto inventore laboriosam ad harum veritatis.</span></p>
                         </figcaption>
                     </figure>
                 </div>
             </div>
         </div>
     </div>
   </div>
 </section>
 
 <script src="public/js/thuvien.js"></script>
 <script src="public/js/comment.js"></script>
       
 
 