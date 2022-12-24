<?php
include('session_m.php');

if(!isset($login_session)){
header('Location: managerlogin.php'); 
}

?>
<!DOCTYPE html>
<html>

  <head>
    <title> Inicio de sesión del administrador | COMIDITAS UWU </title>
  </head>

  <link rel="stylesheet" type = "text/css" href ="css/add_food_items.css">
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

          <ul class="nav navbar-nav navbar-right">
            <li><a href="#"><span class="glyphicon glyphicon-user"></span> Bienvenido <?php echo $login_session; ?> </a></li>
            <li class="active"> <a href="managerlogin.php">Panel de control de Administrador</a></li>
            <li><a href="logout_m.php"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión </a></li>
          </ul>
        </div>

      </div>
    </nav>




<div class="container">
    <div class="jumbotron">
     <h1>¡Hola Administrador! </h1>
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
    		<a href="add_food_items.php" class="list-group-item active">Añadir alimentos</a>
    		<a href="edit_food_items.php" class="list-group-item ">Editar Alimentos</a>
    		<a href="delete_food_items.php" class="list-group-item ">Eliminar Alimentos</a>
    	</div>
    </div>
    
    <div class="col-xs-9">
      <div class="form-area" style="padding: 0px 100px 100px 100px;">
        <form action="add_food_items1.php" method="POST">
        <br style="clear: both">
          <h3 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> AGREGAR NUEVO ARTÍCULO AQUÍ </h3>

          <div class="form-group">
            <input type="text" class="form-control" id="id" name="id" placeholder="ID de la comida" required="">
          </div>    

          <div class="form-group">
            <input type="text" class="form-control" id="name" name="name" placeholder="Nombre de la comida" required="">
          </div>     

          <div class="form-group">
            <input type="text" class="form-control" id="description" name="description" placeholder="Descripción de la comida" required="">
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" id="price" name="price" placeholder="Precio en soles" required="">
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="stock" name="stock" placeholder="Cantidad en stock" required="">
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" id="idchef" name="idchef" placeholder="ID chef" required="">
          </div>

          <div class="form-group">
            <input type="text" class="form-control" id="idproveedor" name="idproveedor" placeholder="ID proveedor" required="">
          </div>
          
          <div class="form-group">
            <input type="text" class="form-control" id="foto_path" name="foto_path" placeholder="Link de su imagen" required="">
          </div>

          <div class="form-group">
          <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right"> AGREGAR COMIDA </button>    
      </div>
        </form>

        
        </div>
      
    </div>
</div>

  </body>
</html>