<?php
session_start(); 
$error=''; 

if (isset($_POST['submit'])) {
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "Usuario o Contraseña es inválida";
}
else
{
// Define $username and $password
$username=$_POST['username'];
$password=$_POST['password'];
require 'connection.php';
$conn = Connect();

// SQL query to fetch information of registerd users and finds user match.
$query = "SELECT usuario, contrasenha 
			FROM usuario u
			INNER JOIN administrador a
			ON u.id=a.id
			WHERE usuario=? AND contrasenha=? LIMIT 1";

$stmt = $conn->prepare($query);
$stmt -> bind_param("ss", $username, $password);
$stmt -> execute();
$stmt -> bind_result($username, $password);
$stmt -> store_result();

if ($stmt->fetch())  
{
	$_SESSION['login_user1']=$username; // Initializing Session
	header("location: myrestaurant.php"); // Redirecting To Other Page
} else {
$error = "Usuario o Contraseña no es válido";
}
mysqli_close($conn); // Closing Connection
}
}
?>