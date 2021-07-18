<?php
	include_once './dbConnect.php';
	$conn = dbConnect::connect();
	$shopName = $_POST['shopName'];
	$logo = $_POST['logo'];
	$shopAddress = $_POST['shopAddress'];
	$shopPhoneNumber = $_POST['shopPhoneNumber'];
	$openTime = $_POST['openTime'];
	$closeTime = $_POST['closeTime'];
	$type = $_POST['type'];
	$image = $_POST['image'];
	$status = $_POST['status'];
	$InsertSQL = "insert into tblshop (nameShop,imgShop,addressShop,phoneNumShop,openTime,closeTime,type,adImgShop,status)
	values ('$shopName','$logo','$shopAddress','$shopPhoneNumber','$openTime','$closeTime','$type','$image','$status')";
	if(mysqli_query($conn, $InsertSQL)){
		$last_id = mysqli_insert_id($conn);
		echo $last_id;
	}
	dbConnect::close($conn);
?>
