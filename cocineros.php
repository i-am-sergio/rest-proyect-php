<?php
session_start();
?>

<html>

<head>
  <title> Contacto | COMIDITAS UWU </title>
</head>

<link rel="stylesheet" type="text/css" href="css/contactus.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<body>


  <button onclick="topFunction()" id="myBtn" title="Go to top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </button>

  <script type="text/javascript">
    window.onscroll = function() {
      scrollFunction()
    };

    function scrollFunction() {
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
          <li><a href="index.php">Inicio</a></li>
          <li><a href="aboutus.php">Acerca de</a></li>
          <li><a href="contactus.php">Contactános</a></li>
          <li class="active"><a href="cocineros.php">Cocineros</a></li>
        </ul>

        <?php


        if (isset($_SESSION['login_user1'])) {

        ?>


          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user1']; ?> </a></li>
            <li><a href="myrestaurant.php">Panel de Control de Administrador</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        <?php
        } else if (isset($_SESSION['login_user2'])) {
        ?>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user2']; ?> </a></li>
            <li><a href="foodlist.php"><span class="glyphicon glyphicon-cutlery"></span> Zona de Comida </a></li>
            <li><a href="cart.php"><span class="glyphicon glyphicon-shopping-cart"></span> Carrito
                (<?php
                  if (isset($_SESSION["cart"])) {
                    $count = count($_SESSION["cart"]);
                    echo "$count";
                  } else
                    echo "0";
                  ?>)
              </a></li>
            <li><a href="logout_u.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        <?php
        } else {

        ?>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Registrarse <span class="caret"></span> </a>
              <ul class="dropdown-menu">
                <li> <a href="customersignup.php"> Registar Cliente</a></li>
                <li> <a href="managersignup.php"> Registrar Administrador</a></li>

              </ul>
            </li>

            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-log-in"></span> iniciar Sesión <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li> <a href="customerlogin.php"> Iniciar Sesión Cliente</a></li>
                <li> <a href="managerlogin.php"> Iniciar Sesión Administrador</a></li>

              </ul>
            </li>
          </ul>

        <?php
        }
        ?>
      </div>

    </div>
  </nav>
  <br>

  <div class="heading">
    <strong>Tenemos los mejores Chefs del <span class="edit"> Mundo</span></strong>
  </div>

  <div class="col-xs-12 line">
    <hr>
  </div>

  <div class="container">
  <div class="container" style="width:95%;">

<!-- Display all Food from food table -->
<?php

require 'connection.php';
$conn = Connect();

// $sql = "SELECT * FROM `chef`";
$sql ="SELECT a.DNI 'DNI', CONCAT(a.nombres,' ',a.primer_apellido,' ',a.segundo_apellido) AS 'Nombre completo', a.foto_path AS 'Foto',
ec.especialidad AS `especialidad`
FROM trabajador_restaurante a
INNER JOIN chef b
INNER JOIN especialidad_chef ec
ON b.DNI = a.DNI 
AND ec.id_chef = b.DNI";

$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) {
  $count = 0;

  while ($row = mysqli_fetch_assoc($result)) {
    if ($count == 0)
      echo "<div class='row'>";

?>
    <div class="col-md-3">

      <form method="post" action="cart.php?action=add&id=<?php echo $row["DNI"]; ?>">
        <div class="mypanel" align="center" ;>
          <img src="<?php echo $row["Foto"]; ?>" class="img-responsive cocineros">
          <h4 class="text-dark"><?php echo $row["Nombre completo"]; ?></h4>
          <h5 class="text-info"><?php echo $row["especialidad"]; ?></h5>
          <!-- <h5 class="text-info">Quantity: <input type="number" min="1" max="25" name="quantity" class="form-control" value="1" style="width: 60px;"> </h5> -->
          <input type="submit" name="add" style="margin-top:5px;" class="btn btn-success" value="Mas Informacion">
        </div>
      </form>

    </div>

  <?php
    $count++;
    if ($count == 4) {
      echo "</div>";
      $count = 0;
    }
  }
  ?>

</div>
</div>
<?php
} else {
?>

<div class="container">
<div class="jumbotron">
  <center>
    <label style="margin-left: 5px;color: red;">
      <h1>¡Ups! No hay cocineros para mostrar.</h1>
    </label>
  </center>

</div>
</div>

<?php

}

?>


  </div>

  <?php
  if (isset($_POST['submit'])) {
    require 'connection.php';
    $conn = Connect();

    $Name = $conn->real_escape_string($_POST['name']);
    $Email_Id = $conn->real_escape_string($_POST['email']);
    $Mobile_No = $conn->real_escape_string($_POST['mobile']);
    $Subject = $conn->real_escape_string($_POST['subject']);
    $Message = $conn->real_escape_string($_POST['message']);

    $query = "INSERT into contact(Name,Email,Mobile,Subject,Message) VALUES('$Name','$Email_Id','$Mobile_No','$Subject','$Message')";
    $success = $conn->query($query);

    if (!$success) {
      die("Couldnt enter data: " . $conn->error);
    }

    $conn->close();
  }
  ?>

</body>


</html>