<?php

include('session_m.php');

if(!isset($login_session)){
header('Location: managerlogin.php'); 
}


/*
id -----
name-----
description----
price----
stock-------
idchef
idproveedor
foto_path------------
*/
$id = $conn->real_escape_string($_POST['id']);
$name = $conn->real_escape_string($_POST['name']);
$description = $conn->real_escape_string($_POST['description']);
$price = $conn->real_escape_string($_POST['price']);


// Storing Session
$user_check=$_SESSION['login_user1'];
//$R_IDsql = "SELECT RESTAURANTS.R_ID FROM RESTAURANTS, MANAGER WHERE RESTAURANTS.M_ID='$user_check'";
//$R_IDresult = mysqli_query($conn,$R_IDsql);
//$R_IDrs = mysqli_fetch_array($R_IDresult, MYSQLI_BOTH);
//$R_ID = $R_IDrs['R_ID'];

$stock = $conn->real_escape_string($_POST['stock']);
$idchef = $conn->real_escape_string($_POST['idchef']);
$idproveedor = $conn->real_escape_string($_POST['idproveedor']);
$foto_path = $conn->real_escape_string($_POST['foto_path']);

$query = "INSERT INTO consumible VALUES ('$id','$name','$description','$stock','$price','$idchef','$idproveedor','$foto_path');";
$success = $conn->query($query);

if (!$success){
	?>

	<!DOCTYPE html>
	<html>
	<head>
		<title></title>
	<link rel="stylesheet" type = "text/css" href ="css/add_food_items.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
	</head>
	<body>
	
    <button onclick="topFunction()" id="myBtn" title="Go to top">
      <span class="glyphicon glyphicon-chevron-up"></span>
    </button>
  
    <script type="text/javascript">
      window.onscroll = function()
      {
        scrollFunction()
      };

      function scrollFunction(){
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
          document.getElementById("myBtn").style.display = "block";
        } else {
          document.getElementById("myBtn").style.display = "none";
        }
      }

      function topFunction() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
      }
    </script>

    <nav class="navbar navbar-inverse navbar-fixed-top navigation-clean-search" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myNavbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php">COMIDITAS UWU</a>
        </div>

        <div class="collapse navbar-collapse " id="myNavbar">
          <ul class="nav navbar-nav">
            <li><a href="index.php">Inicio</a></li>
            <li><a href="aboutus.php">Acerca de</a></li>
            <li><a href="contactus.php">Contactános</a></li>
            <li><a href="cocineros.php">Cocineros</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $login_session; ?> </a></li>
            <li class="active"> <a href="managerlogin.php">Panel de control del Administrador</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        </div>

      </div>
    </nav>


	<div class="container">
    <div class="jumbotron">
     <h1>Lo sentimos </h1>
     <p>Ingrese los detalles de su restaurante antes de agregar alimentos.</p>
     <p><a href="myrestaurant.php"> Click Me </a></p>

    </div>
    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br>
	</body>
	
	</html>

	<?php
	
}
else {
	echo "SUCCESS";
	header('Location: add_food_items.php');
}

$conn->close();


?>