<?php
    if(isset($_POST['addnew'])){
        if($_POST['addnew']){
            $location=$_POST['location'];
            $name_cata=$_POST['name_cata'];
              catalog_insert($location,$name_cata);
          }
      }
      if(isset($_POST['update'])){
        $location=$_POST['location'];
        $name_cata=$_POST['name_cata'];
        $id=$_POST['id'];
        catalog_update($id, $location,$name_cata);
      }
      if(isset($_GET['id'])&&isset($_GET['delete'])){
          $id=$_GET['id'];
          catalog_delete($id);
      }

      $allCata = catalog_select_all();
  ?>

  <section class="main-movie">
      <?php require './view/template/admin.php'; ?>
    <div class="container-fluid">
      <div class="row no-gutters">
        <div class="mr-auto "></div>
        <button class="btn blue-gradient mt-4" id='insertCatalog' data-toggle="modal" data-target="#centralModal-lg" title="Thêm danh mục mới"><i class="fas fa-plus"></i></button>
      </div>
      <div class="row  mb-5 rootClassCatalog">
        <?php
          foreach ($allCata as $item) {
              extract($item);
              echo
              "
                <div class='col-md-3 mb-4'>
                  <div class='card-showCata'>
                    <div class='content-allmovie'>
                      <p>Tổng phim</p>
                      <h2>$count</h2>
                    </div>
                    <div class='content-cata'> 
                      <h5>$name_cata</h5>
                    </div>
                    <div class='card-upde'>
                      <button class=' update-Cata' data-id='$id' data-toggle='modal' data-target='#centralModal-lg'><i class='fas fa-edit'></i></button>
                      <button class='itemdelete' data-id='$id' data-toggle='modal' data-target='#notification'><i class='fas fa-trash-alt'></i></button>
                    </div>
                  </div>
                </div>
              ";
          }

        ?>
      </div>
    </div>
  <!-- MODAL INSERT  -->
  <div class="modal fade modalCustom" id="centralModal-lg" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="false">
        <div class="modal-dialog  modal-lg" role="form">
          <form method="post" action="index.php?page=catalog">
            <div class="modal-content">
              <div class="modal-header">
                <h3>Thêm danh mục</h3>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
              </div>
              <div class="modal-body" id="content-insert">
                <div class="container">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="formGroupExampleInput">Vị trí</label>
                        <input class="form-control" id="formGroupExampleInput" type="number" name="location" placeholder="">
                      </div>
                      <div class="form-group">
                        <label for="formGroupExampleInput">Tên danh mục</label>
                        <input class="form-control" id="formGroupExampleInput" type="text" name="name_cata" placeholder="">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="modal-footer">
                <button class="btn btn-secondary btn-sm" type="button" data-dismiss="modal">Close</button>
                <button class="btn btn-warning btn-sm" type="reset">Reset</button>
                <input class="btn btn-primary btn-sm" type="" value="Insert" name="addnew" data-dismiss="modal"  id='btnInsert'>
                <input class="btn btn-primary btn-sm d-none" type="" value="Update" name="update" data-dismiss="modal"  id='btnUpdate'>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
</section>
<!-- MODAL THÔNG BÁO  -->
<div class="modal bounceInRight animated p-1 notification " id="notification" tabindex="1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md" >
      <div class="modal-content shadow">
          <div class="modal-body">
              <p class='text-center m-0 h4 '>Bạn có muốn xóa ? </p>
          </div>
          <div class="d-flex flex-wrap modal-footer p-0">
              <button class="btn btn-info btn-sm " type="button" data-dismiss="modal">Đóng</button>
              <button class="btn closebtn btn-success btn-sm" type="button" data-dismiss="modal">Có</button>
          </div>
      </div>  
    </div>
  </div>
<script src="public/js/thuvien.js"></script>
<script src="public/js/catalog.js"></script>
      

