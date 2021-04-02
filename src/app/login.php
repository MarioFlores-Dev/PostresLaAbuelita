<?php 
    //Variable por si no se encuentra registrado el usuario o la clave no coincide
    $error = "";
    session_start();
    if(!empty($_SESSION['username'])){
        header("location:menu.php");
    }
    //Mostrar mensaje de error
    if(!empty($_SESSION['logueado'])){
        $error = "Usuario y/o Contraseña incorrectos";
    }
    ?>
<!-- Formulario de Logueo -->
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link rel="stylesheet" href="../assets/css/FontAwesome/css/all.css">
    <link rel="shortcut icon" href="../assets/images/icons/Logo-con-Fondo-redondo_1.ico" type="image/x-icon">
    <title>Login</title>
</head>
<body>
    <h1 class="error_login"><?php echo $error;?></h1>
    <div class="container_form">
        <div class="container">
            <div class="logo">
                <img src="../assets/images/Logo.png" alt="Logo de la empresa" width="100%">
            </div>
            <div class="form">
                <h1 class="title_form">Bienvenido al sistema</h1><br>
                <form action="logic/vallogin.php" method="POST">
                    <br><p><i class="fas fa-user"></i><b> Usuario</b></p>
                    <input type="text" autocomplete="off" class="edit_txt" required name="username">
                    <span></span>
                    <br><br><b><p><i class="fas fa-key"></i> Contraseña</b></p>
                    <input type="password" autocomplete="off" class="edit_txt" required name="password">
                    <br><br>
                    <input type="submit" value="Iniciar Sesión" class="submit_button">
                </form>
            </div>
        </div>
    </div>
</body>
</html>