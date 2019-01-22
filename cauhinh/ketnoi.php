<?php
// $dbHost="sql300.byethost3.com";
// $dbUser="b3_21196951";
// $dbPass="HT241198hvt916AT";
// $dbName="b3_21196951_vps";
$dbHost="localhost";
$dbUser="root";
$dbPass="916241198";
$dbName="hoangtoanmobileshop";

$conn = mysqli_connect($dbHost, $dbUser, $dbPass, $dbName);

if($conn)
{
	$setLang = mysqli_query($conn, "SET NAMES 'utf8'");
}
else
{
	die("Kết nối thất bại".mysqli_connect_error());
}
?>