<?php
session_start();
?>

<html>

<head>
  <title> Sobre | COMIDA UWU </title>
</head>

<link rel="stylesheet" type="text/css" href="css/aboutus.css">
<!-- <link rel="stylesheet" type = "text/css" href ="css/bootstrap.min.css"> -->
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
          <li class="active"><a href="aboutus.php">Acerca de</a></li>
          <li><a href="contactus.php">Contactános</a></li>
          <li><a href="cocineros.php">Cocineros</a></li>
        </ul>

        <?php
        if (isset($_SESSION['login_user1'])) {

        ?>


          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user1']; ?> </a></li>
            <li><a href="myrestaurant.php">Panel de control de Administrador</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesión </a></li>
          </ul>
        <?php
        } else if (isset($_SESSION['login_user2'])) {
        ?>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $_SESSION['login_user2']; ?> </a></li>
            <li><a href="foodlist.php"><span class="glyphicon glyphicon-cutlery"></span> Zona de comida </a></li>
            <li><a href="cart.php"><span class="glyphicon glyphicon-shopping-cart"></span> Carrito
                (<?php
                  if (isset($_SESSION["cart"])) {
                    $count = count($_SESSION["cart"]);
                    echo "$count";
                  } else
                    echo "0";
                  ?>)
              </a></li>
            <li><a href="logout_u.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar sesión </a></li>
          </ul>
        <?php
        } else {

        ?>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> Sign Up <span class="caret"></span> </a>
              <ul class="dropdown-menu">
                <li> <a href="customersignup.php"> Registrar Cliente</a></li>
                <li> <a href="managersignup.php"> Registrar Administrador</a></li>

              </ul>
            </li>

            <li><a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-log-in"></span> Login <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li> <a href="customerlogin.php"> Iniciar Sesión Cliente</a></li>
                <li> <a href="managerlogin.php"> Iniciar Sesión Admnistrador</a></li>

              </ul>
            </li>
          </ul>

        <?php
        }
        ?>
      </div>

    </div>
  </nav>

  <div class="wide" style="text-align: center;">

    <div  class="tagline">No es <font color="red"><strong> tu vida laboral</strong></font>, es el <font color="green"><strong><em>trabajo de nuestra vida.</em>.</strong></font>
    </div>
    <h3 style="color: red">Sobre la cultura gastronómica en COMIDITAS UWU</h3>
    <br>
    <h3 style="color: white">Ordene alimentos y bebidas en línea de restaurantes cerca y alrededor de usted.<h3 style="color: white">Hacemos delivery de comida de los locales de su vecindario, sus cafés favoritos, restaurantes lujosos y de élite en su área,</h3>
      <h3 style="color : white"> y tambien de cadenas como Dominos, KFC, Burger King, Pizza Hut, FreshMenu, Mc Donald's, Subway, Faasos, Cafe Coffee Day, Taco Bell, y más. ¿No es emocionante?</h3>
      <h3 style="color : white"> ¡No imponemos restricciones de pedido mínimo! Ordene poco (o tanto) como desee. ¡Te lo enviaremos por Rappi!</h3>
    </h3>
  </div>

</html>