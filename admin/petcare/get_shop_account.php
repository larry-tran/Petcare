<?php
	include_once './dbConnect.php';
	$shopid = $_POST["shopid"];
	$query_string = "select * from tblshopaccount where shopid = '$shopid'";
	$conn = dbConnect::connect();
	// Mảng JSON
	$response = array();
	// Câu lệnh Select dùng để xem dữ liệu
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	while($row = mysqli_fetch_array($result)){
		$t = array();
		$t["userid"] = $row["userid"];
		$t["username"] = $row["username"];
		$t["email"] = $row["email"];
		// Mảng JSON
		array_push($response, $t);
	}
	dbConnect::close($conn);
	// Thiết lập header là JSON
	header('Content-Type: application/json');
	// Hiển thị kết quả
	echo json_encode($response);
?>