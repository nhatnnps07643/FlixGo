<?php
	require 'restful_api.php';
    require '../DAO/movie.php';
    require '../DAO/photos.php';
    require '../DAO/catalog.php';
    require '../DAO/country.php';
class movie extends restful_api {
	function __construct(){
		parent::__construct();
	}
	// 

	//Lấy phim lẽ hoặc phim bộ và trang
	function showMovieTemplate(){
		$type = $_GET['type'];
		$page = $_GET['page'];
		$data = movie_page_and_type($type,$page,12);
		$this->response(200, $data);
	}


	//------------------------------------------
	// Hàm lấy tất cả movie
	function GetAllMovie(){
		if ($this->method == 'GET'){
			$data = movie_select_all();
			$this->response(200, $data);
		}
	}

	function GetAllInfomation(){
		if ($this->method == 'GET'){
			$data = SelectAllInfo();
			$this->response(200, $data);
		}
	}

	//------------------------------------------
	// Hàm lấy movie từ thể loại phim
	function GetMovieByIdCatalog(){
		if ($this->method == 'GET'){
            $id_cata = $_GET['id_cata'];
            $data = movie_select_all_by_id($id_cata);
			$this->response(200, $data);
		}
	}
	function GetImgByIdMovie(){
		if ($this->method == 'GET'){
            $movie = $_GET['movie'];
            $data = photos_select_by_id($movie);
			$this->response(200, $data);
		}
	}
	// Delete image 
	function DeleteImage(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			$id = explode(',',$id);
			$data = photos_delete($id);
			$this->response(200, $data);
		}
	}

	function InsertPhoto(){
		$id = $_POST['id_movie'];
		$listFile = $_FILES['fileImage'];
		$data = array();
		foreach ($listFile['tmp_name'] as $key => $value) {
			$url = $listFile['tmp_name'][$key];
			move_uploaded_file($url, '../Page/public/img/'. $listFile['name'][$key]);
			$result = photos_insert($listFile['name'][$key],$id);
			array_push($data, array($id=>$result));
		}
		$this->response(200, $data);
	}
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function GetURL(){ 
		function curl($url) {
			$ch = @curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			$head[] = "Connection: keep-alive";
			$head[] = "Keep-Alive: 300";
			$head[] = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7";
			$head[] = "Accept-Language: en-us,en;q=0.5";
			curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36');
			curl_setopt($ch, CURLOPT_HTTPHEADER, $head);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, FALSE);
			curl_setopt($ch, CURLOPT_TIMEOUT, 60);
			curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 60);
			curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
			curl_setopt($ch, CURLOPT_HTTPHEADER, array('Expect:'));
			$page = curl_exec($ch);
			curl_close($ch);
			return $page;
		}
		function getPhotoGoogle($link){
			$get = curl($link);
			$data = explode('url\u003d', $get);
			$url = explode('%3Dm', $data[1]);
			$decode = urldecode($url[0]);
			$count = count($data);
			$linkDownload = array();
			if($count > 4) {
				$v1080p = $decode.'=m37';
				$v720p = $decode.'=m22';
				$v360p = $decode.'=m18';
				$linkDownload['fhd'] = $v1080p;
				$linkDownload['hd'] = $v720p;
				$linkDownload['sd'] = $v360p;
			}
			if($count > 3) {
				$v720p = $decode.'=m22';
				$v360p = $decode.'=m18';
				$linkDownload['hd'] = $v720p;
				$linkDownload['sd'] = $v360p;
			}
			if($count > 2) {
				$v360p = $decode.'=m18';
				$linkDownload['sd'] = $v360p;
			}
			return $linkDownload;
		}

		if ($this->method == 'GET'){
            $link = $_GET['link'];
			$urlVideo = getPhotoGoogle($link);
			$this->response(200, $urlVideo);
		}
	}
	// Admin
	function GetMovieById2(){
		if ($this->method == 'GET'){
            $id_movie = $_GET['id_movie'];
			$data = movie_select_by_id($id_movie);
			$this->response(200, $data);
		}
	}
	// ------------------
	//------------------------------------------
	// API lấy nội dung của phim đó 
	function Insert(){
		if ($this->method == 'POST'){
			$name = $_POST['name'];
			$link = $_POST['link'];
            $year = $_POST['year'];
			$time = $_POST['time'];
			$age = $_POST['age'];
			$image = $_FILES['file'];
			$trailer = $_POST['trailer'];
			$trailer = str_replace('watch?v=', 'embed/', $trailer);
			$shortDes = $_POST['short_des'];
            $description = $_POST['des'];
			$id_cata = $_POST['id_cata'];
			$id_country = $_POST['id_country'];
            $resolution = $_POST['resolution'];
			$evaluate = $_POST['evaluate'];
            $type = $_POST['type'];
			$view = 0;
			$urlImage = $image['name'];

			move_uploaded_file($image['tmp_name'], "../page/public/img/".$image['name'] );

			$data = movie_insert($name,$evaluate,$view,$year,$time,$id_country,$shortDes,$description,
			$urlImage, $trailer, $link, $age, $resolution, $type, $id_cata);  
			// UPDATE LẠI TỔNG PHIM CỦA DANH MỤC
			if($data == null){
				$this->response(200, array('notification'=> ' No insert Movie because data insert fit', 'result' => false));
			}else{
				$countcountry = count_country($id_country)['count'] + 1; 
				country_update_count($id_country,$countcountry);

				$countCata = count_catalog($id_cata)['count'] + 1; 
				catalog_update_count($id_cata,$countCata);

				$this->response(200, array('notification'=> 'Insert completed', 'result'=>true));
			}
		}
	}
	function update(){
		if ($this->method == 'POST'){
			$id = $_POST['id'];
			$imgOld = $_POST['imageOld'];
			$name = $_POST['name'];
			$link = $_POST['link'];
            $year = $_POST['year'];
			$time = $_POST['time'];
			$age = $_POST['age'];
			$trailer = $_POST['trailer'];
			$trailer = str_replace('watch?v=', 'embed/', $trailer);
			$shortDes = $_POST['short_des'];
            $description = $_POST['des'];
			$id_cata = $_POST['id_cata'];
			$id_country = $_POST['id_country'];
            $resolution = $_POST['resolution'];
			$evaluate = $_POST['evaluate'];
            $type = $_POST['type'];
			$view = 0;
			if(!isset($_FILES['file'])){
				$urlImage = $imgOld;
			}else{
				$urlImage = $_FILES['file']['name'];
			}

			// GET ID CATALOG AND COUNTRY OLD
			$movie = getMovieByid($id);
			$id_cata_old = $movie['id_cata'];
			$id_country_old = $movie['id_country'];

			$data = movie_update($id, $name,$evaluate,$view,$year,$time,$id_country,$shortDes,$description,
			$urlImage, $trailer, $link, $age, $resolution, $type, $id_cata);
			if($data == null){
				$this->response(200, array('notification'=> ' No update Movie because data insert fit', 'result' => false));
			}else{

				if($id_cata =! $id_cata_old){
					// UPDATE catalog OLD 
					$count_catalog_old = count_catalog($id_cata_old)['count'] - 1;
					catalog_update_count($id_cata_old,$count_catalog_old);
					// UPDATE catalog NEW
					$count_catalog_new = count_catalog($id_cata)['count'] + 1; 
					catalog_update_count($count_catalog_new,$count_catalog_new);
				}

				if($id_country != $id_country_old){
					// UPDATE country OLD 
					$count_country_old = count_country($id_country_old)['count'] - 1;
					country_update_count($id_country_old,$count_country_old);
					// UPDATE country NEW
					$count_country_new = count_country($id_country)['count'] + 1;
					country_update_count($id_country,$count_country_new);
				}

				$this->response(200, array('notification'=> 'Update completed', 'result'=>true));
			}
		}
	}
	function delete(){
		if ($this->method == 'GET'){
			$id = $_GET['id'];
			// GET ID CATALOG AND COUNTRY OLD
			$movie = getMovieByid($id);
			$id_cata_old = $movie['id_cata'];
			$id_country_old = $movie['id_country'];

			$data = movie_delete($id);
			if ($data == null){
				$this->response(200, array('notification' => ' No Delete Movie because data have movie series', 'result' => false));
			}else{

				$count_catalog_old = count_catalog($id_cata_old)['count'] - 1;
				catalog_update_count($id_cata_old,$count_catalog_old);

				$count_country_old = count_country($id_country_old)['count'] - 1;
				country_update_count($id_country_old,$count_country_old);

				$this->response(200, array('notification'=> ' Delete success', 'result' => true));
			}
		}
	}
//Apis xử lý get link video google photo
//----------------------------------------------------------------------------------------------------
}
$movie = new movie();
?>
