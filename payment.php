<?php
session_start();
require 'connection.php';
$conn = Connect();
if(!isset($_SESSION['login_user2'])){
header("location: customerlogin.php"); 
}
?>

<html>

  <head>
    <title> CARTA | COMIDITAS UWU </title>
  </head>

  <link rel="stylesheet" type = "text/css" href ="css/payment.css">
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
            <li><a href="index.php">Inicio</a></li>
            <li><a href="aboutus.php">Sobre Nosotros</a></li>
            <li><a href="contactus.php">Contactános</a></li>
            <li><a href="cocineros.php">Cocineros</a></li>

          </ul>

<?php
if(isset($_SESSION['login_user1'])){

?>
           <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> BIENVENID@ <?php echo $_SESSION['login_user1']; ?> </a></li>
            <li><a href="myrestaurant.php">CONTRO DE PANEL DEL ADMIN</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
<?php
}
else if (isset($_SESSION['login_user2'])) {
  ?>
           <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user2']; ?> </a></li>
            <li><a href="foodlist.php"><span class="glyphicon glyphicon-cutlery"></span> Zona de comida </a></li>
            <li><a href="cart.php"><span class="glyphicon glyphicon-shopping-cart"></span> CARTA
             (<?php
              if(isset($_SESSION["cart"])){
              $count = count($_SESSION["cart"]); 
              echo "$count"; 
            }
              else
                echo "0";
              ?>)
              </a></li>
            <li><a href="logout_u.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
  <?php        
}
else {

  ?>

<ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Sign Up <span class="caret"></span> </a>
                <ul class="dropdown-menu">
              <li> <a href="customersignup.php"> Registrarse Cliente</a></li>
              <li> <a href="managersignup.php"> Registrarse ADMIN</a></li>
              <li> <a href="#"> Registrarse ADMIN</a></li>
            </ul>
            </li>

            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-log-in"></span> Login <span class="caret"></span></a>
              <ul class="dropdown-menu">
              <li> <a href="customerlogin.php"> Inicio de sesión de Cliente</a></li>
              <li> <a href="managerlogin.php"> Inicio de sesión de ADMIN</a></li>
              <li> <a href="#"> Inicio de sesión de ADMIN</a></li>
            </ul>
            </li>
          </ul>

<?php
}
?>
      </div>

      </div>
    </nav>

 <?php

$total = $_SESSION["total"];
$cantidad = $_SESSION["cantidad"];
$orden_fecha = date('Y-m-d');
$idCliente = $_SESSION["idCliente"];
$idRepartidor = $_SESSION["idRepartidor"];

$queryOrden = "INSERT INTO orden(`total`,`cantidad`,`fecha`,`id_cliente`,`id_repartidor`) VALUES 
              ('$total','$cantidad','$orden_fecha','$idCliente','$idRepartidor')";

$successOrden = $conn->query($queryOrden);  

$queryIdOrden = "select id_orden AS id from orden ORDER BY id_orden DESC LIMIT 1";
$result = mysqli_query($conn, $queryIdOrden);
$row = mysqli_fetch_assoc($result);
$idOrden = $row["id"];

$gtotal = 0;
  foreach($_SESSION["cart"] as $keys => $values)
  {

    $F_ID = $values["food_id"];
    $foodname = $values["food_name"];
    $quantity = $values["food_quantity"];
    $price =  $values["food_price"];
    $total = ($values["food_quantity"] * $values["food_price"]);
    $R_ID = $values["R_ID"];
    $username = $_SESSION["login_user2"];
    $order_date = date('Y-m-d');
    $cantidad = $_SESSION["cantidad"];
    
    $_SESSION["cantidad"] = $cantidad;
    
    $gtotal = $gtotal + $total;

    $query = "INSERT INTO orden_consumible VALUES ('$idOrden','$F_ID','$quantity');";

    /*$query = "INSERT INTO ORDERS (F_ID, foodname, price,  quantity, order_date, username, R_ID) 
              VALUES ('" . $F_ID . "','" . $foodname . "','" . $price . "','" . $quantity . "','" . $order_date . "','" . $username . "','" . $R_ID . "')";
    */        

    $success = $conn->query($query);         

      if(!$success)
      {
        ?>
        <div class="container">
          <div class="jumbotron">
            <h1>Algo fue mal!</h1>
            <p>Vuelva a intentarlo después.</p>
          </div>
        </div>

        <?php
      }
   
  }
        ?>
        <div class="container">
          <div class="jumbotron">
            <h1>Escoge una opción de pago:</h1>
          </div>
        </div>
        <br>
<h1 class="text-center">Total a Pagar: S/ <?php echo "$gtotal"; ?></h1>
<h5 class="text-center">Se están incluyendo todos los cargos por servicio. (no se aplican gastos de envío)</h5>
<br>
<h1 class="text-center">
  <a href="cart.php"><button class="btn btn-warning"><span class="glyphicon glyphicon-circle-arrow-left"></span> Regresar al carrito</button></a>
  <a href="onlinepay.php"><button class="btn btn-success"><span class="glyphicon glyphicon-credit-card"></span> Pago en línea</button></a>
  <a href="COD.php"><button class="btn btn-success"><span class="glyphicon glyphicon-"></span> Pago contra Entrega</button></a>
</h1>
        


<br><br><br><br><br><br>
        </body>
</html>