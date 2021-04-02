<?php
    session_start();
    if(empty($_SESSION['username'])){
        header("location:login.php");
    }
    $username = $_SESSION['username'];    
?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../assets/css/FontAwesome/css/all.css">
    <link rel="shortcut icon" href="../assets/images/icons/Logo-con-Fondo-redondo_1.ico" type="image/x-icon">
    </head>
<body>
    <div class="menu">
        <p><i class="fas fa-user"></i> <b>BIENVENIDO <?php echo strtoupper($username);?></b></p>
            <ul>
                <li>
                    <a href="menu.php"><i class="fas fa-home"></i> Inicio</a>
                    <a href="clients.php"><i class="fas fa-users"></i> Clientes</a>
                    <a href="products.php"><i class="fas fa-utensils"></i> Productos</a>
                    <a href="productions.php"><i class="fas fa-chart-line"></i> Producciones</a>
                    <a href="sales.php"><i class="fas fa-shopping-cart"></i> Ventas</a>
                </li>
            </ul>
        <a href="logic/logOut.php"><i class="fas fa-sign-out-alt"></i> Cerrar Sesión</a>
    </div>

