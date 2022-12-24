<?php
include('session_m.php');

if(!isset($login_session)){
header('Location: managerlogin.php'); 
}

?>
<!DOCTYPE html>
<html>

  <head>
    <title> Inicio de sesión ADMIN | COMIDITAS UWU </title>
  </head>

  <link rel="stylesheet" type = "text/css" href ="css/view_order_details.css">
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
            <li><a href="aboutus.php">Acerca de</a></li>
            <li><a href="contactus.php">Contactános</a></li>
            <li><a href="cocineros.php">Cocineros</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenid@ <?php echo $login_session; ?> </a></li>
            <li class="active"> <a href="managerlogin.php">PANEL DE CONTROL DEL ADMINISTRADOR</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        </div>

      </div>
    </nav>




<div class="container">
    <div class="jumbotron">
     <h1>HOLA ADMINISTRADOR! </h1>
     <p>Gestiona todo tu restaurante desde aquí</p>

    </div>
    </div>

<div class="container">
    <div class="container">
    	<div class="col">
    		
    	</div>
    </div>

    
    	<div class="col-xs-3" style="text-align: center;">

    	<div class="list-group">
    		<a href="myrestaurant.php" class="list-group-item ">Agregar nuevo Proveedor</a>
    		<a href="view_food_items.php" class="list-group-item">Ver artículos de comida</a>
    		<a href="add_food_items.php" class="list-group-item ">Añadir artículos de comida</a>
    		<a href="edit_food_items.php" class="list-group-item ">Editar artículos de comida</a>
    		<a href="delete_food_items.php" class="list-group-item ">Eliminar artículos de comida</a>
        <a href="view_order_details.php" class="list-group-item active">Ver detalles de proveedores</a>
    	</div>
    </div>
    


    
    <div class="col-xs-9">
      <div class="form-area" style="padding: 0px 100px 100px 100px;">
        <form action="" method="POST">
        <br style="clear: both">
          <h3 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> SU LISTA DE PROVEEDORES </h3>

<?php




// Storing Session
$user_check=$_SESSION['login_user1'];
$sql = "CALL cantidad_proveedores();";
$result = mysqli_query($conn, $sql);


if (mysqli_num_rows($result) > 0)
{

  ?>

  <table class="table table-striped">
    <thead class="thead-dark">
      <tr>
        <th>  </th>
        <th> ID de proveedor </th>
        <th> Nombre proveedor</th>
        <th> Tipo de productos </th>
        <th> Número de consumibles que provee </th>
      </tr>
    </thead>

    <?PHP
      //OUTPUT DATA OF EACH ROW
      while($row = mysqli_fetch_assoc($result)){
    ?>

  <tbody>
    <tr>
      <td> <span class="glyphicon glyphicon-menu-right"></span> </td>
      <td><?php echo $row["ID"]; ?></td>
      <td><?php echo $row["Nombre de proveedor"]; ?></td>
      <td><?php echo $row["Tipo de productos"]; ?></td>
      <td><?php echo $row["Numero de consumibles distribuidos"]; ?></td>
    </tr>
  </tbody>
  
  <?php } ?>
  </table>
    <br>


  <?php } else { ?>

  <h4><center>0 RESULTS</center> </h4>

  <?php } ?>

        </form>

        
        </div>
      
    </div>
</div>
<br>
<br>
<br>
<br>
  
  </body>
</html>