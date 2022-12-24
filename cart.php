<?php
session_start();
require 'connection.php';
$conn = Connect();
if (!isset($_SESSION['login_user2'])) {
  header("location: customerlogin.php");
}
?>

<html>

<head>
  <title> Carrito | COMIDITAS UWU </title>
</head>

<link rel="stylesheet" type="text/css" href="css/cart.css">
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
          <span class="sr-only">Barra de navegación</span>
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

        <?php
        if (isset($_SESSION['login_user1'])) {

        ?>


          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user1']; ?> </a></li>
            <li><a href="myrestaurant.php">Panel de control del Administrador</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        <?php
        } else if (isset($_SESSION['login_user2'])) {
        ?>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user2']; ?> </a></li>
            <li><a href="foodlist.php"><span class="glyphicon glyphicon-cutlery"></span> Zona de Comida </a></li>
            <li class="active"><a href="foodlist.php"><span class="glyphicon glyphicon-shopping-cart"></span> Carrito
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
                <li> <a href="customersignup.php"> Registrar Cliente</a></li>
                <li> <a href="managersignup.php"> Registrar Administrador</a></li>
                <li> <a href="#"> Registrar Administrador</a></li>
              </ul>
            </li>

            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-log-in"></span> Iniciar Sesión <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li> <a href="customerlogin.php"> Iniciar Sesión Cliente</a></li>
                <li> <a href="managerlogin.php"> Iniciar Sesión Administrador</a></li>
                <li> <a href="#"> Iniciar Sesión Administrador</a></li>
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
  if (!empty($_SESSION["cart"])) {
  ?>
    <div class="container">
      <div class="jumbotron">
        <h1>Tu carrito de la compra</h1>
        <p>Se ve buenazo...!!!</p>

      </div>

    </div>
    <div class="table-responsive" style="padding-left: 100px; padding-right: 100px;">
      <table class="table table-striped">
        <thead class="thead-dark">
          <tr>
            <th width="40%">Nombre del alimento</th>
            <th width="10%">Cantidad</th>
            <th width="20%">Detalles del precio</th>
            <th width="15%">Total del pedido</th>
            <th width="5%">Acción</th>
          </tr>
        </thead>


        <?php

        $total = 0;
        $cantidad=0;
        // print_r($_SESSION["cart"]);

        foreach ($_SESSION["cart"] as $keys => $values) {
        ?>
          <tr>
            <td><?php echo $values["food_name"]; ?></td>
            <td><?php echo $values["food_quantity"] ?></td>
            <td>S/ <?php echo $values["food_price"]; ?></td>
            <td>S/ <?php echo number_format($values["food_quantity"] * $values["food_price"], 2); ?></td>
            <td><a href="cart.php?action=delete&id=<?php echo $values["food_id"]; ?>"><span class="text-danger">Eliminar</span></a></td>
          </tr>
        <?php
          $total = $total + ($values["food_quantity"] * $values["food_price"]);
          $cantidad = $cantidad + ($values["food_quantity"]);
        }
        $_SESSION["idRepartidor"] = "18697054";
        $usuarioActual = $_SESSION['login_user2']; //username

        $query = "SELECT id FROM usuario WHERE usuario = '$usuarioActual';";
        $result = mysqli_query($conn, $query);
        $row = mysqli_fetch_assoc($result);

        $idCliente = $row["id"];
        $_SESSION["idCliente"] = $idCliente;
        $_SESSION["cantidad"] = $cantidad;
        $_SESSION["total"] = $total;
        ?>
        <tr>
          <td colspan="3" align="right">Cantidad Productos</td>
          <td align="right"><?php echo $cantidad; ?></td>
          <td></td>
        </tr>
        <tr>
          <td colspan="3" align="right">Total</td>
          <td align="right">S/ <?php echo number_format($total, 2); ?></td>
          <td></td>
        </tr>
      </table>
      <?php
      echo '<a href="cart.php?action=empty"><button class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Vaciar Carrito</button></a>&nbsp;<a href="foodlist.php"><button class="btn btn-warning">Continuar Comprando</button></a>&nbsp;<a href="payment.php"><button class="btn btn-success pull-right"><span class="glyphicon glyphicon-share-alt"></span> Seguir</button></a>';
      ?>
    </div>
    <br><br><br><br><br><br><br>
  <?php
  }
  if (empty($_SESSION["cart"])) {
  ?>
    <div class="container">
      <div class="jumbotron">
        <h1>Tu carrito de la compra</h1>
        <p>¡Ups! No podemos oler nada de comida aquí. regresa y <a href="foodlist.php">ordenar ahora.</a></p>

      </div>

    </div>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br>
  <?php
  }
  ?>


  <?php


  if (isset($_POST["add"])) {
    if (isset($_SESSION["cart"])) {
      $item_array_id = array_column($_SESSION["cart"], "food_id");
      if (!in_array($_GET["id"], $item_array_id)) {
        $count = count($_SESSION["cart"]);

        $item_array = array(
          'food_id' => $_GET["id"],
          'food_name' => $_POST["hidden_name"],
          'food_price' => $_POST["hidden_price"],
          'R_ID' => $_POST["hidden_RID"],
          'food_quantity' => $_POST["quantity"]
        );
        $_SESSION["cart"][$count] = $item_array;
        echo '<script>window.location="cart.php"</script>';
      } else {
        echo '<script>alert("Products already added to cart")</script>';
        echo '<script>window.location="cart.php"</script>';
      }
    } else {
      $item_array = array(
        'food_id' => $_GET["id"],
        'food_name' => $_POST["hidden_name"],
        'food_price' => $_POST["hidden_price"],
        'R_ID' => $_POST["hidden_RID"],
        'food_quantity' => $_POST["quantity"]
      );
      $_SESSION["cart"][0] = $item_array;
    }
  }
  if (isset($_GET["action"])) {
    if ($_GET["action"] == "delete") {
      foreach ($_SESSION["cart"] as $keys => $values) {
        if ($values["food_id"] == $_GET["id"]) {
          unset($_SESSION["cart"][$keys]);
          echo '<script>alert("Food has been removed")</script>';
          echo '<script>window.location="cart.php"</script>';
        }
      }
    }
  }

  if (isset($_GET["action"])) {
    if ($_GET["action"] == "empty") {
      foreach ($_SESSION["cart"] as $keys => $values) {

        unset($_SESSION["cart"]);
        echo '<script>alert("Cart is made empty!")</script>';
        echo '<script>window.location="cart.php"</script>';
      }
    }
  }


  ?>
  <?php

  ?>

</body>

</html>