<?php
	include_once './dbConnect.php';
	$query_string = "Select count(userId) from tbluser where status = 'active'";
	$conn = dbConnect::connect();
	// Mảng JSON
	$response = array();
	// Câu lệnh Select dùng để xem dữ liệu
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	if($row = mysqli_fetch_array($result)){
		$response["totalUser"] = $row["count(userId)"];
	}
	$query_string = "Select count(userid) from tblshopaccount where status = 'active'";
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	if($row = mysqli_fetch_array($result)){
		$response["totalShopOwner"] = $row["count(userid)"];
	}
	$query_string = "Select count(idShop) from tblshop where type = 'spa' and status = 'active'";
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	if($row = mysqli_fetch_array($result)){
		$response["totalSpa"] = $row["count(idShop)"];
	}
	$query_string = "Select count(idShop) from tblshop where type = 'clinic' and status = 'active'";
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	if($row = mysqli_fetch_array($result)){
		$response["totalClinic"] = $row["count(idShop)"];
	}
	dbConnect::close($conn);
	// Thiết lập header là JSON
	header('Content-Type: application/json');
	// Hiển thị kết quả
	echo json_encode($response);
?>