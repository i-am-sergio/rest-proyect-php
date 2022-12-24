<?php
include('session_m.php');

if(!isset($login_session)){
header('Location: managerlogin.php'); 
}

?>
<!DOCTYPE html>
<html>

  <head>
    <title> Inicio de Sesión del ADMINISTRADOR | COMIDITAS UWU </title>
  </head>

  <link rel="stylesheet" type = "text/css" href ="css/edit_food_items.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
    function display_alert()
    {
      alert("Actualización realizada...!!!");
    }
  </script>

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
            <li><a href="index.php">Página Principal</a></li>
            <li><a href="aboutus.php">Acerca de</a></li>
            <li><a href="contactus.php">Contáctanos</a></li>
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
    		<a href="view_food_items.php" class="list-group-item ">Ver artículos de comida</a>
    		<a href="add_food_items.php" class="list-group-item ">Añadir artículos de comida</a>
    		<a href="edit_food_items.php" class="list-group-item active">Editar artículos de comida</a>
    		<a href="delete_food_items.php" class="list-group-item ">Eliminar artículos de comida</a>
        <a href="view_order_details.php" class="list-group-item ">Ver detalles de proveedores</a>
    	</div>
    </div>
    


    
    

<div class="col-xs-3">

  <div class="form-area" style="padding: 10px 10px 110px 10px; ">
  
    <div style="text-align: center;">
      <h3>Click en Menu <br><br></h3>
    </div>
    <?php
   
 

    if (isset($_GET['submit'])) {
    $id_consumible = $_GET['id_consumible'];
    $nombre = $_GET['nombre'];
    $precio = $_GET['precio'];
    $descripcion = $_GET['descripcion'];
    $stock = $_GET['stock'];
    $id_chef = $_GET['id_chef'];
    $id_proveedor = $_GET['id_proveedor'];


    $query = mysqli_query($conn, "UPDATE consumible set
    id_consumible='$id_consumible',
    nombre='$nombre',
    descripcion='$descripcion',
    stock=$stock, 
    precio='$precio',
    id_chef='$id_chef',
    id_proveedor='$id_proveedor'
    where id_consumible='$id_consumible'");
    }
    $query = mysqli_query($conn, "SELECT * FROM consumible");
    while ($row = mysqli_fetch_array($query)) {

      ?>

      <div class="list-group" style="text-align: center;">
        <?php
      echo "<b><a href='edit_food_items.php?update= {$row['id_consumible']}'>{$row['nombre']}</a></b>";  
        ?>
      </div>


    <?php
    }
    ?>
    

    <?php
    if (isset($_GET['update'])) {
    $update = $_GET['update'];
    
    $query1 = mysqli_query($conn, "SELECT * FROM consumible WHERE id_consumible=$update");
    while ($row1 = mysqli_fetch_array($query1)) {

    ?>
</div>
</div>



<div class="container">
<div class="col-md-6">
 <div class="form-area" style="padding: 0px 100px 100px 100px;">
        <form action="edit_food_items.php" method="GET">
        <br style="clear: both">
          <h3 style="margin-bottom: 25px; text-align: center; font-size: 30px;"> EDITA TUS COMIDAS AQUÍ </h3>

          <div class="form-group">
            <input class='input' type='hidden' name="id_consumible" value=<?php echo $row1['id_consumible'];  ?> />
          </div>

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> Nombre de comida: </label>
            <input type="text" class="form-control" id="nombre" name="nombre" value=<?php echo $row1['nombre'];  ?> placeholder="Nombre de tu comida" required="">
          </div>     

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> Descripción de Comida: </label>
            <input type="text" class="form-control" id="descripcion" name="descripcion" value=<?php echo $row1['descripcion'];  ?> placeholder="Descripción de Comida" required="">
          </div>

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> Cantidad Stock: </label>
            <input type="text" class="form-control" id="stock" name="stock" value=<?php echo $row1['stock'];  ?> placeholder="Cantidad Stock" required="">
          </div>

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> Precio de Comida: </label>
            <input type="text" class="form-control" id="precio" name="precio" value=<?php echo $row1['precio'];  ?> placeholder="Precio de tu comida" required="">
          </div>

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> ID de Chef: </label>
            <input type="text" class="form-control" id="id_chef" name="id_chef" value=<?php echo $row1['id_chef'];  ?> placeholder="ID de Chef" required="">
          </div>

          <div class="form-group">
            <label for="username"><span class="text-danger" style="margin-right: 5px;">*</span> ID de Proveedor: </label>
            <input type="text" class="form-control" id="id_proveedor" name="id_proveedor" value=<?php echo $row1['id_proveedor'];  ?> placeholder="ID de Proveedor" required="">
          </div>

          <div class="form-group">
          <button type="submit" id="submit" name="submit" class="btn btn-primary pull-right" onclick="display_alert()" value="Display alert box" > Actualizar </button>    
      </div>
        </form>


    <?php
}
}


  ?>
      
  </div>




</div>


<?php
mysqli_close($conn);
?>
</div>
</div>

  </body>
<br>
</html>