<?php

include('session_m.php');

if(!isset($login_session)){
header('Location: managerlogin.php'); 
}



// $email = $conn->real_escape_string($_POST['email']);
$id = $conn->real_escape_string($_POST['id']);
$nombre = $conn->real_escape_string($_POST['name']);
// $address = $conn->real_escape_string($_POST['address']);


$query = "INSERT INTO proveedor VALUES('$id','$nombre')";
$success = $conn->query($query);

if (!$success){
	?>
	<!DOCTYPE html>
	<html>
	<head>
		<title>change</title>
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
            <span class="sr-only">Barra de Navegación</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php">COMIDITAS UWU</a>
        </div>

        <div class="collapse navbar-collapse " id="myNavbar">
          <ul class="nav navbar-nav">
            <li class="active" ><a href="index.php">Página Principal</a></li>
            <li><a href="aboutus.php">Acerca de</a></li>
            <li><a href="contactus.php">Contáctanos</a></li>
            <li><a href="cocineros.php">Cocineros</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrarse </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión </a></li>
          </ul>
        </div>

      </div>
    </nav>
    <div class="container">
	<div class="jumbotron" style="text-align: center;">
		<h1>Usted ya tiene un restaurante</h1>
		<p>Regrese a su <a href="view_food_items.php">Restaurante</a></p>
	</div>
</div>
	
	</body>
	</html>

	<?php
}
else {
	header('Location: myrestaurant.php');
}

$conn->close();


?>