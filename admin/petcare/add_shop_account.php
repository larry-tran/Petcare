<?php
	include_once './dbConnect.php';
	$conn = dbConnect::connect();
	$username = $_POST['username'];
	$password = $_POST['password'];
	$email = $_POST['email'];
	$shopid = $_POST['shopid'];
	$status = $_POST['status'];
	$InsertSQL = "insert into tblshopaccount (username,password,email,shopid,status)
	values ('$username','$password','$email','$shopid','$status')";
	if(mysqli_query($conn, $InsertSQL)){
		$last_id = mysqli_insert_id($conn);
		echo $last_id;
	}
	dbConnect::close($conn);
?>