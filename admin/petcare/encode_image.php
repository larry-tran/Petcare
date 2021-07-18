<?php 
	// Get the image and convert into string
	$shop_id = $_POST['shop_id'];
	$image_name = $_POST['image_name'];
	$ImagePath = "images/$shop_id/$image_name";
	$img = file_get_contents($ImagePath);
	// Encode the image string data into base64
	$data = base64_encode($img);
	// Display the output
	echo $data;
?>