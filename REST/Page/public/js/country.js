// Hàm delete
function DeleteCountry() { 
    $('.itemdelete').on('click', function(){ 
        let id =  $(this).attr('data-id');
        $('.closebtn').click(function(){
            $.ajax({
                url: "http://localhost/reST/API/country.php/delete?id=" +id,
            }).done(function(data){
                load();
            });
        })  
    })
}


// hàm load catalog lên
function load() {
    $.ajax({
        url: 'http://localhost/rest/API/country.php/country',
        method: 'GET',
    }).done(function (data) {
        let strElement = '';
        for (const key in data) {
            const element = data[key];
            strElement += "<div class='col-md-3 mb-4'>";
            strElement += "<div class='card-showCata'><div class='content-allmovie'><p>Tổng phim</p><h2>"+element.count+"</h2></div>";
            strElement += "<div class='content-cata'> <h5>"+element.name_country+"</h5></div><div class='card-upde'>";
            strElement += "<button  class=' update-Cata mr-2' data-id='"+element.id+"' data-toggle='modal' data-target='#centralModal-lg'><i class='fas fa-edit'></i></button><button class='itemdelete mr-2' data-id='"+element.id+"' data-toggle='modal' data-target='#notification'><i class='fas fa-trash-alt'></i></button>";
            strElement += "</div></div></div>"; 
        }
        $('.RootClass').html(strElement);
        DeleteCountry();
        GetOneCatalog();
    })
}
//hàm insert catalog
function insert() {
    $('#btnInsert').on('click', function () {
        name = $('input[name="name"]').val();
        $.ajax({
            url: "http://localhost/rest/API/country.php/insert",
            method: "POST",
            data: {
                name_country: name
            }
        }).done(function (data) {
            console.log(data);
            alert('Thêm thành công')
            $('input[name="name"]').val('');
            load();
        })
    })
}
//hàm update catalog
function GetOneCatalog() {
    $('.update-Cata').on('click', function () {
        // Thay đổi nút thêm và sửa
        $('#btnUpdate').removeClass('d-none')
        $('#btnInsert').addClass('d-none')

        // lấy dữ liệu 1 catalog đổ vào form 
        id = $(this).attr('data-id');
        $.ajax({
            url: "http://localhost/rest/API/country.php/getOne",
            method: "GET",
            data: {
                id: id
            }
        }).done(function (data) {
            $('input[name="name"]').val(data.name_country);
            $('input[name="name"]').attr('data-id', data.id);
        })
    })
}

function handleUpdate() {
    $('#btnUpdate').click(function () {

        name = $('input[name="name"]').val();
        id = $('input[name="name"]').attr('data-id');

        $.ajax({
            url: "http://localhost/rest/API/country.php/update",
            method: "GET",
            data: {
                id: id,
                name: name
            }
        }).done(function (data) {
            alert('Sửa thành công')
            $('input[name="name"]').val('');
            load()
        })
    })
}

insert();
DeleteCountry();
GetOneCatalog();
handleUpdate();

//LOAD 
$('#insertCatalog').click(function () {
    // Thay đổi nút thêm và sửa
    $('#btnInsert').removeClass('d-none')
    $('#btnUpdate').addClass('d-none')
    // Xóa dữ liệu từ form update
    $('input[name="location"]').val('');
    $('input[name="name_cata"]').val('');
})