<?php
session_start(); 
$error=''; 

if (isset($_POST['submit'])) {
if (empty($_POST['username']) || empty($_POST['password'])) {
$error = "Usuario o Contraseña es inválido";
}
else
{
$username=$_POST['username'];
$password=$_POST['password'];
require 'connection.php';
$conn = Connect();

$query = "SELECT usuario, contrasenha FROM usuario WHERE usuario=? AND contrasenha=? LIMIT 1";

$stmt = $conn->prepare($query);
$stmt -> bind_param("ss", $username, $password);
$stmt -> execute();
$stmt -> bind_result($username, $password);
$stmt -> store_result();

if ($stmt->fetch())  
{
	$_SESSION['login_user2']=$username; 
	header("location: foodlist.php"); 
} else {
$error = "Usuario o Contraseña no es válido";
}
mysqli_close($conn); 
}
}
?>