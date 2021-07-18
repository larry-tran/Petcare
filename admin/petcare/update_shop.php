<?php
	include_once './dbConnect.php';
	$conn = dbConnect::connect();
	$shopId = $_POST['shopId'];
	$shopName = $_POST['shopName'];
	$logo = $_POST['logo'];
	$shopAddress = $_POST['shopAddress'];
	$shopPhoneNumber = $_POST['shopPhoneNumber'];
	$openTime = $_POST['openTime'];
	$closeTime = $_POST['closeTime'];
	$type = $_POST['type'];
	$image = $_POST['image'];
	$status = $_POST['status'];
	$query_string = "UPDATE tblshop SET nameShop = '$shopName', imgShop = '$logo', addressShop = '$shopAddress'
	, phoneNumShop = '$shopPhoneNumber', openTime = '$openTime', closeTime = '$closeTime'
	, type = '$type', adImgShop = '$image', status = '$status' where idShop = '$shopId'";
	$response;
	if(mysqli_query($conn, $query_string)){
		$response = true;
	}
	else{
		$response = false;
	}
	dbConnect::close($conn);
	header('Content-Type: application/json');
	// Hiển thị kết quả
	echo json_encode($response);
?>