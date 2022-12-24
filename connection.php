<?php




function Connect()
{
	$dbhost = $_ENV["DB_HOST"];
	$dbuser = $_ENV["DB_USER"];
	$dbpass = $_ENV["DB_PASSWORD"];
	$dbname = $_ENV["DB_NAME"];
	$port = $_ENV["DB_PORT"];

	// $dbhost = "localhost";
	// $dbuser = "root";
	// $dbpass = "administrador";
	// $dbname = "restaurant";

	//Create Connection
	$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

	return $conn;
}
?>