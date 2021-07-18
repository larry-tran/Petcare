<?php
	include_once './dbConnect.php';
	$user_name = $_POST["user_name"];
	$user_pass = $_POST["user_pass"];
	$query_string = "UPDATE tbladmin SET password = '$user_pass' where username = '$user_name'";
	$conn = dbConnect::connect();
	// Mảng JSON
	$response;
	// Câu lệnh Select dùng để xem dữ liệu
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