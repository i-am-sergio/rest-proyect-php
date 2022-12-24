<?php
session_start();
if(session_destroy()) // Destruyendo todas las sesiones
{
header("Location: managerlogin.php"); // Redirigir a la página de inicio
}
?>