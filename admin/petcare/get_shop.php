<?php
	include_once './dbConnect.php';
	$shopId = $_GET["shopId"];
	$query_string = "select * from tblshop where idShop = '$shopId'";
	$conn = dbConnect::connect();
	// Mảng JSON
	$response = array();
	// Câu lệnh Select dùng để xem dữ liệu
	$result = mysqli_query($conn, $query_string);
	//Đọc dữ liệu từ MySQL
	while($row = mysqli_fetch_array($result)){
		$t = array();
		$t["shopId"] = $row["idShop"];
		$t["shopName"] = $row["nameShop"];
		$t["logo"] = $row["imgShop"];
		$t["shopAddress"] = $row["addressShop"];
		$t["shopPhonenumber"] = $row["phoneNumShop"];
		$t["openTime"] = $row["openTime"];
		$t["closeTime"] = $row["closeTime"];
		$t["type"] = $row["type"];
		$t["image"] = $row["adImgShop"];
		$t["status"] = $row["status"];
		// Mảng JSON
		array_push($response, $t);
	}
	dbConnect::close($conn);
	// Thiết lập header là JSON
	header('Content-Type: application/json');
	// Hiển thị kết quả
	echo json_encode($response);
?>