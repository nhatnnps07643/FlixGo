
// Copyright 2014-2017 The Bootstrap Authors
// Copyright 2014-2017 Twitter, Inc.
if (navigator.userAgent.match(/IEMobile\/10\.0/)) {
    var msViewportStyle = document.createElement('style');
    msViewportStyle.appendChild(document.createTextNode('@-ms-viewport{width:auto!important}'));
    document.head.appendChild(msViewportStyle);
}

$(function () {
    var nua = navigator.userAgent;
    var isAndroid = nua.indexOf('Mozilla/5.0') > -1 && nua.indexOf('Android ') > -1 && nua.indexOf('AppleWebKit') > -1 && nua.indexOf('Chrome') === -1;
    if (isAndroid) {
        $('select.form-control').removeClass('form-control').css('width', '100%');
    }
});


$('.fileCustom').on('change', function (e) {
    $('.boxImageLoad').html('');
    var listFile = Array.from(e.target.files);
    [].forEach.call(listFile, function (element) {
        var fileReader = new FileReader();
        fileReader.readAsDataURL(element);
        fileReader.onload = function (e) {
            var src = e.target.result;
            var imagenew = new Image();
            $(imagenew).addClass('');
            imagenew.src = src;
            $(imagenew).addClass('image-thumbnail border shadow ');
            let boxImage = document.createElement('div')
            $(boxImage).addClass('col-md-3 mt-3 p-2 box-image-movie')
            boxImage.append(imagenew)
            $('.boxImageLoad').append(boxImage);
        };
    })
});


// cài đặt màu nền khi mới load trang 
// $(window).ready(function(){
//     $('.backgroundTotal').attr('src',$('#modal-movie-img').attr('src'));
// })


// have erro when turn on modal ---- fixed

// Handle alert
$('.alertCustom').on('click', function () {
    // $(this).hide('fast');
    $(this).removeClass('showAlert');
});
$('body').on('click', function () {
    $('.alertCustom').hide('fast');
});

$(window).ready(function(){
    var text = $('.alertCustom').text();
    if(text !== '' ){
      $('.alertCustom').addClass('showAlert')
    }
})
// ----------------------------------------

$('#centralModal-lg').on('shown.bs.modal', function () {
    $(document).off('focusin.modal');
});


$('.update-cata-modal').on('click', function(){
    let id = $(this).attr('data-id');
    $.ajax({
        url: "http://localhost/reST/API/catalog.php/GetCatalogById?id_cata="+id,
        context: document.body
      }).done(function(data) {
        $('.modal-id-hidden').val(id);
        $('#modal-cata-rank').val(data.location);
        $('#modal-cata-name').val(data.name_cata);
      });
    
})


// UPDATE 
function LoaddataMovie(){
    $('.modal-update-movie').on('click', function(){
        
        let id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/reST/API/movie.php/GetMovieById2?id_movie="+id,
            context: document.body
          }).done(function(data) {
            $('#idUpdate').val(data.id);   
            $('#imageOld').val(data.image);
            $('#evaluate').val(data.evaluate);
            $('#nameUpdateMovie').val(data.movie);
            $('#link').val(data.link);
            $('#trailer').val(data.trailer);
            $('#yearUpdateMovie').val(data.release_year);
            $('#timeUpdateMovie').val(data.running_time);
            $('#ageUpdateMovie').val(data.age);
            $('#imageUpdateMovie img').attr({src : './public/img/' + data.image});     
            $('#s_descriptionUpdateMovies').val(data.short_description);
            CKEDITOR.instances['editor1'].setData(data.description);
            console.log('load again');
          });
        //   Thay đổi nút bấm
          $('#btnInsert').addClass('d-none');
          $('#btnUpdate').removeClass('d-none');
          //Thực hiện hành động update
          
    })
}

// --------------------------------------------------

//GET MOVIE
function ChangeCard(){
    $('tbody tr').on('click', function(){  
        let id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/reST/API/movie.php/GetMovieById2?id_movie="+id,
            context: document.body
          }).done(function(data) {
            $('#modal-movie-img').attr('src', 'public/img/'+ data.image);
            $('#modal-movie-name').text(data.movie);
            $('#modal-movie-short_description').text(data.short_description);
            $('#modal-movie-age').text(data.age+ '+');
            $('#modal-movie-name-cata').text(data.catalog);
            $('#modal-movie-release_year').text(data.release_year);
            $('#modal-movie-country').text(data.country);
            $('#modal-movie-resolution').text(data.resolution);
            $('#modal-movie-time').text(data.running_time + "'");
            $('#catalogUpdateMovie').val(data.id_cata);
            $('#countryUpdateMovie').val(data.id_country);
            $('.resolution[value="'+data.resolution+'"]').prop('checked',true)
            // rename button insert or update
            $('.backgroundTotal').attr('src','./public/img/' + data.image)
          });
    })
}
// ---------------------------------------------------------------------------

$("body").on("click", ".box-image-movie", function(e) {
    $(this).find('input').prop("checked", true);
  });

// handle select more image
function DeleteImage(){
    $('.button-delete-image' ).on('click', function(){
        let ListID = []
        let listImage = $(".list-check-image[type='checkbox']:checked")
        for (let index = 0; index < listImage.length; index++) {
            const element = listImage[index];
            ListID.push($(element).attr('data-id'))
        }
        $.ajax({
            url: "http://localhost/reST/API/movie.php/DeleteImage?id=" +ListID,
          }).done(function(data) {
            $(".list-check-image[type='checkbox']:checked").parent().remove()
          });
    })
}
function clearFormMovie(){
    $('#centralModal-lg').find('input').not("input[type='radio']").val('');
    $('#centralModal-lg').find('#s_descriptionUpdateMovies').val('')
    CKEDITOR.instances['editor1'].setData('')
}

// Load image When change Image
function LoadImageByIdMovie(id){
    $('.list-Image').html('')
    $.ajax({
        url: "http://localhost/reST/API/movie.php/GetImgByIdMovie?movie="+id,
        context: document.body
        }).done(function(data) {
            data.forEach(element => {
            // create Image
            let newImg = new Image
            newImg.src= 'public/img/'+ element.link
            $(newImg).addClass('image-thumbnail shadow border ')

            // create div has image
            let boxImage = document.createElement('div')
            $(boxImage).addClass('box-image-movie p-2')
            let inputImage = document.createElement('input')
            inputImage.type = 'checkbox'
            $(inputImage).attr({'data-id': element.id, 'class':'list-check-image' } )

            // Add image into box
            boxImage.append(inputImage);
            boxImage.append(newImg);
            $('.list-Image').append(boxImage)
        });
    });
}


// Handle click image
// function 
function insertImage(){
    $('.modal-edit-image').on('click', function(){
        // change null for form image
        $('#form-file-image').val('')
        // get ID of movie
        let id = $(this).attr('data-id');
        // Load image
        LoadImageByIdMovie(id)
        // handle change file
        $('#form-file-image').on('change', function(event){
            // delete event post data tosever
            $(".btn-image-insert").prop("onclick", null).off("click");
            // create form data to post sever
            let file = event.target.files
            let formData = new FormData()
            for (let index = 0; index < file.length; index++) {
                let element = file[index];
                formData.append('fileImage[]',element)
            }
            formData.append('id_movie',id)
            // handle event submid image to serve
            $('.btn-image-insert' ).on('click', function(){
                $.ajax({
                    url: "http://localhost/reST/API/movie.php/InsertPhoto",
                    type: 'POST',
                    processData: false,
                    contentType: false,
                    data: formData,
                  }).done(function(data) {
                    LoadImageByIdMovie(id)
                    $('.boxImageLoad').html('')
                    $('#form-file-image').val('')
                    $('input[type="checkbox"]').prop('checked',false)
                  });
            })
        })  
    })
}

//XỬ LÍ HÌNH ẢNH KHI CHỌN
$('.fileCustom').on('change', function (e) {
    var listFile = Array.from(e.target.files);
    [].forEach.call(listFile, function (element) {
        var fileReader = new FileReader();
        fileReader.readAsDataURL(element);
        fileReader.onload = function (e) {
            var src = e.target.result;
            var imagenew = new Image();
            imagenew.src = src;
            $(imagenew).addClass('w-100 m-1 shadow border');
            $('.boximg ').html('')
            $('.boximg ').append(imagenew);
        };
    });
});

//Load NỘI DUNG TABLE LÊN VÀ XỬ LÍ  NÚT CHUYỂN TRANG

$('table').ready(function(){
    GetMoviePage(1,1);
    updateMovie();
})
$('#typeMovieSelect').on('change',function(){
    var selectType = $('#typeMovieSelect').val();
    GetMoviePage(1,selectType);
    // nếu select = 1 thì hiển thị navpagi 1 ngược lại hiển thị navPagi2
    if($('#typeMovieSelect').val() == 1){
        $('.navPage1').removeClass('d-none')
        $('.navPage2').addClass('d-none')
        // $('.addmovie').addClass('d-none');
        // $('.addmovies').addClass('d-none');
    }else{
        // $('.addmovie').removeClass('d-none');
        // $('.addmovies').removeClass('d-none');
        $('.navPage2').removeClass('d-none')
        $('.navPage1').addClass('d-none')
    }
})
$('.page-link').on('click',function(){
    $('.page-link').parent().removeClass('active')
    $(this).parent().addClass('active')
    GetMoviePage($(this).text() , $('#typeMovieSelect').val());
})
$(window).ready(function(){
    insertMovie();
    // $('.addmovie').addClass('d-none');
    // $('.addMovieChild').addClass('d-none');
    // console.log($('.addmovie'));
    // console.log($('td.addMovieChild'));
})


// XỬ LÍ PHIM HIỆN LÊN
function GetMoviePage(page,type){
    $.ajax({
        url: "http://localhost/reST/API/movie.php/showMovieTemplate?type="+type+"&page="+page,
      }).done(function(data) {
        var htmlTbody = '';
        
        data.forEach(element => {
            htmlTbody += "<tr data-id='"+ element.id +"'>"
            htmlTbody += " <td class='font-weight-light h6'>"+ element.id +"</td>"
            htmlTbody += " <td class='font-weight-light h6 tableNameMovie'>"+ element.name_movie +"</td>"
            htmlTbody += " <td class='font-weight-light h6'>"+ element.evaluate +"</td>"
            htmlTbody += " <td class='font-weight-light h6 helo'><a class='show-movie-by-id modal-edit-image' data-id='"+ element.id +"' data-toggle='modal' data-target='#EditImage' title='Hình' href='javascript:void()'><img src='./public/img/image.png' alt=''></a> </td>"
            htmlTbody += " <td class='addMovieChild'><a href='index.php?page=movie-series&id="+ element.id +"'><img src='./public/img/add.png' alt=''/></a></td>"
            htmlTbody += " <td><i class='deleteMovie' data-id='"+element.id+"' data-toggle='modal' data-target='#notification'><img src='./public/img/trash.png' alt=''></i></td>"
            htmlTbody += " <td> <a data-toggle='modal' class='modal-update-movie' data-id='"+ element.id +"' data-target='#centralModal-lg' title='Update movie' href='javascript:void()'><img src='./public/img/edit.png' alt=''></a></td>"
            htmlTbody += "</tr>"
        });
       $('.tableContent tbody').html(htmlTbody);
    //    XỬ LÍ SỰ KIỆN KHI CLICK CHUỘT THÌ THAY ĐỔI BACKGROUD VÀ LOAD DỮ LIỆU LÊN CARD
        ChangeCard()
    //    XỬ LÍ NHẬN SỰ KIỆN SAU KHI LOAD XONG
        insertImage()
    // XỬ LÍ UPDATE PHIM
        LoaddataMovie()
    // DELETE MOVIE 
        DeleteMovie();
    //DeleteImage
        DeleteImage();
      });
}


$('.btn-insert').on('click',function(){
    clearFormMovie();
    $('#btnInsert').removeClass('d-none');
    $('#btnUpdate').addClass('d-none');
})

// HÀM XỬ LÍ XÓA PHIM
function DeleteMovie() { 
    $('.deleteMovie').on('click', function(){ 
        let id =  $(this).attr('data-id');
        $('.closebtn').click(function(){
            $.ajax({
                url: "http://localhost/reST/API/movie.php/delete?id=" +id,
            }).done(function(data){
                if(data['result'] == true){
                    GetMoviePage(1,$('#typeMovieSelect').val());
                }   
                
            });
        })  
    })
}



var imageChang = null
$('#form-file').on('change',function(e){
    imageChang = e
})
// THỰC HIỆN INSERT 
function insertMovie(){
   
    // $('input[name="insert"]').unbind();
    $('#btnInsert').on('click',function(){
        
        let formData = new FormData();
        formData.append('name',$('#nameUpdateMovie').val());
        formData.append('link',$('#link').val());
        formData.append('trailer',$('#trailer').val());
        formData.append('year',$('#yearUpdateMovie').val());
        formData.append('time',$('#timeUpdateMovie').val());
        formData.append('age',$('#ageUpdateMovie').val());
        formData.append('file',$('#form-file')[0].files[0]);
        formData.append('short_des',$('#s_descriptionUpdateMovies').val());
        formData.append('des',CKEDITOR.instances['editor1'].getData());
        formData.append('id_cata',$('#catalogUpdateMovie').val());
        formData.append('id_country',$('#countryUpdateMovie').val());
        formData.append('evaluate',$('#evaluate').val());
        formData.append('type',$('#typeUpdateMovie').val());
        formData.append('resolution',$('input[name="resolution"]:checked').val());
        $.ajax({
            url: 'http://localhost/reST/API/movie.php/Insert',
            method: 'POST',
            data: formData,
            contentType: false,
            processData: false
        }).done(function(data){
            if(data['result'] == true){
                let type = $('#typeMovieSelect').val();
                GetMoviePage(1,type);
                clearFormMovie();
            }
        })
        
    })
}
function updateMovie(){
    $('#btnUpdate').on('click',function(){
    let formData = new FormData();
    formData.append('id',$('#idUpdate').val());
    formData.append('imageOld',$('#imageOld').val());
    formData.append('name',$('#nameUpdateMovie').val());
    formData.append('link',$('#link').val());
    formData.append('trailer',$('#trailer').val());
    formData.append('year',$('#yearUpdateMovie').val());
    formData.append('time',$('#timeUpdateMovie').val());
    formData.append('age',$('#ageUpdateMovie').val());
    formData.append('file',$('#form-file')[0].files[0]);
    formData.append('short_des',$('#s_descriptionUpdateMovies').val());
    formData.append('des',CKEDITOR.instances['editor1'].getData());
    formData.append('id_cata',$('#catalogUpdateMovie').val());
    formData.append('id_country',$('#countryUpdateMovie').val());
    formData.append('evaluate',$('#evaluate').val());
    formData.append('type',$('#typeUpdateMovie').val());
    formData.append('resolution',$('input[name="resolution"]:checked').val());
    $.ajax({
        url: 'http://localhost/reST/API/movie.php/update',
        method: 'POST',
        data: formData,
        contentType: false,
        processData: false
    })
    .done(function(data){
        let type = $('#typeMovieSelect').val();
        GetMoviePage(1,type);
        clearFormMovie();
        })
    })
} 

// $(window).ready(function(){
//     $('.page-item')[0].addClass('active');
// })