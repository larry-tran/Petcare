<?php
class dbConnect {
 /**
 * Thiết lập kết nối đến CSDL
 *
 */
	public static function connect() {
		include_once dirname(__FILE__) . './config.php';
		$conn;
		// Kết nối đến MySQL
		$conn = mysqli_connect(DB_HOST, DB_USERNAME, DB_PASSWORD) or die(mysqli_error());
		// Chọn cơ sở dữ liệu
		mysqli_select_db($conn , DB_NAME) or die(mysqli_error());
		
		// Trả về đối tượng connection
		return $conn;
	}
	public static function close($conn) {
		return mysqli_close($conn);
	}
}
?>