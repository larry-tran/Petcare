<?php
	include_once './dbConnect.php';
	$conn = dbConnect::connect();
	$userid = $_POST['userid'];
	$email = $_POST['email'];
	$status = $_POST['status'];
	$query_string = "UPDATE tblshopaccount SET email = '$email', status = '$status' where userid = '$userid'";
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