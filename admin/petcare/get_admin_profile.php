<?php
	include_once './dbConnect.php';
	$user_name = $_POST["user_name"];
	$query_string = "select * from tbladmin where username = '$user_name'";
	$conn = dbConnect::connect();
	// Mảng JSON
	$response = array();
	// Câu lệnh Select dùng để xem dữ liệu
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	while($row = mysqli_fetch_array($result)){
		$t = array();
		$t["username"] = $row["username"];
		$t["email"] = $row["email"];
		$t["phone"] = $row["phone"];
		$t["fullname"] = $row["fullname"];
		// Mảng JSON
		array_push($response, $t);
	}
	dbConnect::close($conn);
	// Thiết lập header là JSON
	header('Content-Type: application/json');
	// Hiển thị kết quả
	echo json_encode($response);
?>