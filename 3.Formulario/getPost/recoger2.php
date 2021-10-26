<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Pagina de inicio de una pagina web de informacion sobre las mujeres en la informatica"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<title> Las Mujeres en la Histori de la Informatica </title>
		<link rel="stylesheet" type="text/css" href="estilo.css">
		<link rel="stylesheet" type="text/css" href="estilo3.css">
	</head>
	<body>
    <?php
			echo '<h2> VER ARRAY </H2>';
      print_r($_GET);
			echo '<h2> CON DIFERENCIAS </H2>';

			//PROBAMOS EL ISSET
			//Se usa para saber is existe una variable, elc heck o el radio dan que no existen, ahi usamos el isset
			echo '<h3> ISSET </H3>';
			if (isset($_GET['nombre']))
			{
				echo '<p> El valor nombre: '.$_GET['nombre'].'</p>';
			}
			if (isset($_GET['edad']))
			{
				echo '<p> El valor edad: '.$_GET['edad'].'</p>';
			}
			if (isset($_GET['cuadrotexto']))
			{
				echo '<p> El valor cuadro de texto: '.$_GET['cuadrotexto'].'</p>';
			}
			if (isset($_GET['correo']))
			{
				echo '<p> El valor email: '.$_GET['correo'].'</p>';
			}
			if (isset($_GET['check']))
			{
				echo '<p> El valor check: '.$_GET['check'].'</p>';
			}
			if (isset($_GET['mujeres']))
			{
				echo '<p> El valor mujeres: '.$_GET['mujeres'].'</p>';
			}

			//PROBAMOS EL EMPTY
			//Dice si un campo, aunque exista su variable, esta vacicomo la mayoria de los inputs
			echo '<h3> EMPTY </H3>';
			if (!empty($_GET['nombre']))
			{
				echo '<p> El valor nombre: '.$_GET['nombre'].'</p>';
			}
			if (!empty($_GET['edad']))
			{
				echo '<p> El valor edad: '.$_GET['edad'].'</p>';
			}
			if (!empty($_GET['cuadrotexto']))
			{
				echo '<p> El valor cuadro de texto: '.$_GET['cuadrotexto'].'</p>';
			}
			if (!empty($_GET['correo']))
			{
				echo '<p> El valor email: '.$_GET['correo'].'</p>';
			}
			if (!empty($_GET['check']))
			{
				echo '<p> El valor check: '.$_GET['check'].'</p>';
			}
			if (!empty($_GET['mujeres']))
			{
				echo '<p> El valor mujeres: '.$_GET['mujeres'].'</p>';
			}

			//PROBAMOS SIN NADA
			echo '<h3> NADA </H3>';
			echo '<p> El valor nombre: '.$_GET['nombre'].'</p>';
			echo '<p> El valor edad: '.$_GET['edad'].'</p>';
			echo '<p> El valor cuadro de texto: '.$_GET['cuadrotexto'].'</p>';
			echo '<p> El valor email: '.$_GET['correo'].'</p>';
			echo '<p> El valor check: '.$_GET['check'].'</p>';
			echo '<p> El valor mujeres: '.$_GET['mujeres'].'</p>';

			//COMO CREO QUE ES
			//Como deberia hacerse
			echo '<h3> COMO DEBERIA SER </H3>';
			if (!empty($_GET['nombre']))
			{
				echo '<p> El valor nombre: '.$_GET['nombre'].'</p>';
			}
			if (!empty($_GET['edad']))
			{
				echo '<p> El valor edad: '.$_GET['edad'].'</p>';
			}
			if (!empty($_GET['cuadrotexto']))
			{
				echo '<p> El valor cuadro de texto: '.$_GET['cuadrotexto'].'</p>';
			}
			if (!empty($_GET['correo']))
			{
				echo '<p> El valor email: '.$_GET['correo'].'</p>';
			}
			if (isset($_GET['check']))
			{
				echo '<p> El valor check: '.$_GET['check'].'</p>';
			}
			if (!empty($_GET['mujeres']))
			{
				echo '<p> El valor mujeres: '.$_GET['mujeres'].'</p>';
			}
			/*echo '<h2> USANDO EMPTY </H2>';
      foreach ($_GET as $nombre => $valor)
      {
				if (empty($valor) == false)
				{
					echo '<p> El valor del input '.$nombre.' es este valor '.$valor.'</p>';
				}
      }
			echo '<h2> USANDO ISSET </H2>';
			foreach ($_GET as $nombre => $valor)
			{
				if (isset($valor))
				{
					echo '<p> El valor del input '.$nombre.' es este valor '.$valor.'</p>';
				}
			}*/
    ?>
	</body>
</HTML>
