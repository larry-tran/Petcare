<?php
 
 if($_SERVER['REQUEST_METHOD'] == 'POST')
 {
 
 $ImageData = $_POST['image_data'];
 
 $ImageName = $_POST['image_name'];
 
 $shop_id = $_POST['shop_id'];
	 if (!file_exists('images')) {
		mkdir('images', 0777, true);
	}
	 if (!file_exists("images/$shop_id")) {
		mkdir("images/$shop_id", 0777, true);
	}
 $ImagePath = "images/$shop_id/$ImageName";

 file_put_contents($ImagePath,base64_decode($ImageData));

 echo "Your Image Has Been Uploaded.";

 }
?>