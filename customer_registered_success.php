<html>

  <head>
    <title> Inicio de sesión del ADMINISTRADOR | COMIDITAS UWU </title>
  </head>

  <link rel="stylesheet" type = "text/css" href ="css/manager_registered_success.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>

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
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Registrase </a></li>
            <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión </a></li>
          </ul>
        </div>

      </div>
    </nav>

<?php

require 'connection.php';
$conn = Connect();

$dni = $conn->real_escape_string($_POST['dni']);
$fullname = $conn->real_escape_string($_POST['fullname']);
//$username = $conn->real_escape_string($_POST['username']);
$apellido1 = $conn->real_escape_string($_POST['apellido1']);  //apellidos
$apellido2 = $conn->real_escape_string($_POST['apellido2']);  //apellidos
$fechaNaci = $conn->real_escape_string($_POST['fechaNaci']);
$email = $conn->real_escape_string($_POST['email']);
$telefono = $conn->real_escape_string($_POST['telefono']);//telefono
$direccion = $conn->real_escape_string($_POST['direccion']);
// $contact = $conn->real_escape_string($_POST['contact']);//telefono
$username = $conn->real_escape_string($_POST['username']);
$password = $conn->real_escape_string($_POST['password']);

//$query = "INSERT into CUSTOMER(fullname,username,email,contact,address,password) VALUES('" . $fullname . "','" . $username . "','" . $email . "','" . $contact . "','" . $address ."','" . $password ."')";
//$query = "INSERT INTO Usuario(nombres,primer_apellido,segundo_apellido,correo,telefono,username,password)
// VALUES('" . $fullname . "','" . $apellido1 . "','" . $apellido2 . "','" . $email . "','" . $telefono . "','" . $username ."','" . $password ."')";

$query = "CALL `insertarCliente`('$dni','$fullname','$apellido1','$apellido2','$email','$telefono','$username','$password','$direccion','$fechaNaci');";

$success = $conn->query($query);

if (!$success){
	die("Couldnt enter data: ".$conn->error);
}

$conn->close();

?>


<div class="container">
	<div class="jumbotron" style="text-align: center;">
		<h2> <?php echo "Welcome $fullname!" ?> </h2>
		<h1>Tu cuenta ha sido creada.</h1>
		<p>Inicie sesión ahora <a href="customerlogin.php">aquí</a></p>
	</div>
</div>

    </body>
</html>