<?php
	include 'connected.php';
	header("Access-Control-Allow-Origin: *");


if (!$link) {
    echo "Error: Unable to connect to MySQL." . PHP_EOL;
    echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
    echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    
    exit;
}

if (!$link->set_charset("utf8")) {
    printf("Error loading character set utf8: %s\n", $link->error);
    exit();
	}

if (isset($_GET)) {
	if ($_GET['isAdd'] == true) {

		$id = $_GET['id'];		
		$password = $_GET['password'];
		$name = $_GET['name'];
		$idcard = $_GET['idcard'];
		$phonenumber = $_GET['phonenumber'];
		$chooseType = $_GET['chooseType'];
		
							
		$sql = "INSERT INTO `user`(`idUser`, `id`, `password`, `name`, `idcard`, `phonenumber`, `chooseType`, `NameShop`, `Address`, `PhoneShop`, `UrlPicture`, `Lat`, `Lng`, `Token`) VALUES (Null,'$id','$password','$name','$idcard','$phonenumber','$chooseType','$NameShop','$Address','$PhoneShop','$UrlPicture','$Lat','$Lng','$Token')";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master";
   
}
	mysqli_close($link);
?>