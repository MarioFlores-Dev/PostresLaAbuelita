<?php
    // Script para conexión a la base de datos
    $server= "localhost";
    $user = "root";
    $pwd = "";
    $db = "db_prueba";     
    $conection = mysqli_connect($server,$user,$pwd,$db)
                or die ("<h1>¡Ups! algo ha salido mal, al parecer no cuenta con conexión a la base de datos <br> porfavor pongase en contacto con el proveedor.</h1>");
?>