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
	if ($_GET['isAdd'] == 'true') {
			
		$idUser = $_GET['idUser'];		
		$NameShop = $_GET['NameShop'];
		$Address = $_GET['Address'];
		$PhoneShop = $_GET['PhoneShop'];
		$UrlPicture = $_GET['UrlPicture'];
		$Lat = $_GET['Lat'];
		$Lng = $_GET['Lng'];
		
		
							
		$sql = "UPDATE `user` SET `NameShop` = '$NameShop', `Address` = '$Address', `PhoneShop` = '$PhoneShop', `UrlPicture` = '$UrlPicture', `Lat` = '$Lat', `Lng` = '$Lng' WHERE idUser = '$idUser'";

		$result = mysqli_query($link, $sql);

		if ($result) {
			echo "true";
		} else {
			echo "false";
		}

	} else echo "Welcome Master ";
   
}

	mysqli_close($link);
?>