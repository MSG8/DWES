<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Pagina para modificar informacion de empleados de una empresa"/>
		<meta name="viewport" content="width=device-width, user-scalable=yes, initial-scale=0.8, maximum-scale=2.0, minimum-scale=0.8"/>
		<title> Administrador de empleados </title>
		<link rel="stylesheet" type="text/css" href="css/trabajoPorcentaje.css">
        <link rel="stylesheet" type="text/css" href="css/estiloFormulario.css">
	</head>
	<body>
        <?php 
            require ('clases/procesos.php');
            $procesos = new Procesos();
        ?>
        <header>

        </header>
        <nav>

        </nav>
        <main>
            <nav>
                <ul>
                    <?php //Solo sale infromacion en el nav si se a registrado antes
                        if (isset($_GET['op'])) 
                        {
                            if ($_GET['op']=='modificar') 
                            {
                                echo
                                '<li> <a href="indice.php?op=modificar&campo=correo"> MODIFICAR CORREO </a> </li>
                                <li> <a href="indice.php?op=modificar&campo=password"> MODIFICAR CONTRASEÑA </a> </li>'; 
                            }
                        }
                        else 
                        {
                            if ((!isset($_GET['op']) && $procesos->conexion->buscarAdmin($_POST)->fetch_assoc())) 
                            {
                                echo
                                    '<li> <a href="indice.php?op=modificar&campo=correo"> MODIFICAR CORREO </a> </li>
                                    <li> <a href="indice.php?op=modificar&campo=password"> MODIFICAR CONTRASEÑA </a> </li>';
                            }
                        }
                        
                    ?>
                </ul>
            </nav>
            <article>
                <?php //Segun su op se realiza una o otra cosa
                    $procesos->estructura();
                ?>
            </article>
        </main>
        <footer>

        </footer>
	</body>
</HTML>