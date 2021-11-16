<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Pagina para modificar informacion de empleados de una empresa"/>
		<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=0.8, maximum-scale=2.0, minimum-scale=0.8"/>
		<title> Administrador de empleados </title>
		<link rel="stylesheet" type="text/css" href="css/trabajo.css">
	</head>
	<body>
        <h1> BORRAMOS LA COOKIE</h1>
        <?php
            if (isset($_COOKIE['nombreUsuario']))
            {
                echo '<h2>Tu nombre es '.$_COOKIE['nombreUsuario'].'</h2>';
                setcookie('nombreUsuario','',time()-3600);
                echo '<h2>Cookies borrada</h2>';
            }
            else 
            {
                echo '<h2>Cookies ya estan borradas</h2>';
            }
        ?>
        <a href="crearCookies.php">CREAR COOKIES</a>
        <a href="seguirCookies.php">SEGUIR NAVEGADOR</a>
    </body>   
</HTML>