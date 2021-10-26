<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Prueba de conectar base de dato y sacar un valor en concreto"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
		<title> Las Mujeres en la Histori de la Informatica </title>
		<link rel="stylesheet" type="text/css" href="estilo.css"/>
	</head>
  <body>
    <?php
			if (!isset($_POST["enviar"]))
			{
				formulario();
			}
			else
			{
				echo '<section>';
				respuesta();
				echo '</section>';
			}
     ?>
  </body>
</HTML>

<?php
	function repetidor($valor)
	{
		if($valor == 1)
		{
			return 'repetidor';
		}
		return 'no repetidor';
	}

	function formulario()
	{
		echo
		'<section>
			<h1>FORMULARIO DE BUSQUEDA</H1>
			<form action="#" method="post">
				<label for="buscar"> VALOR A BUSCAR </label>
				<input name="buscar" type="text" value=""/>
				<button type="submit" name="enviar" value="Enviado">Enviar</button>
			</form>
		</section>';
	}

	function respuesta()
	{ //PUEDEN LLAMAR POR LA CONSOLA A LAS VARIABLES, PROTEGERLAS O QUEDARLAS PRIVADAS
		$servidor = 'localhost';
		$usuario = 'root';
		$contrasenia = '';
		$baseDeDatos = 'clase';
		$conexion = mysqli_connect($servidor,$usuario, $contrasenia,$baseDeDatos);
		$valoresPersona = str_replace("'","",$_POST["buscar"]);

		if (!is_numeric($valoresPersona))
		{
			// Esto es lo mismo que hago con la consulta, el trim quita los espacios de principion y final / el replace subtituye string que encuentre
			// $strLimpiado=trim($_POST["buscar"]);
			// $strLimpiado=str_replace(" ","",$strLimpiado);
			// $consulta = "SELECT * FROM alumno WHERE Nombre LIKE '".$strLimpiado."%';";
			$consulta = "SELECT * FROM alumno WHERE REPLACE(Nombre, ' ', '') LIKE (REPLACE(' ".$valoresPersona."%', ' ', ''));";

		}
		else
		{
			$consulta = 'SELECT * FROM alumno WHERE NumeroAlumno = '.$valoresPersona.';';
		}

		$resultado=mysqli_query($conexion ,$consulta);


		if (!is_numeric($valoresPersona))
		{
			$salida= mysqli_num_rows($resultado);

			if ($salida==0 || empty($_POST["buscar"]))
			{
				echo '<p> El alumno con nombre de buscada : ('.$valoresPersona.') no existe </p>';
			}
			else
			{
				while ($fila=mysqli_fetch_assoc($resultado))
				{
					echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).'</p>';
				}
			}
		}
		else
		{
			$fila=mysqli_fetch_assoc($resultado);

			if (mysqli_num_rows ($resultado)==0)
			{
				echo '<p> El alumno con numero de clase: '.$valoresPersona.' no existe </p>';
			}
			else
			{
				echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).' </p>';
			}
		}

		echo '<a href="" ><input type="button" name="VOLVER" value="VOLVER"/></a>';

		//ERROR AL USAR COMILLAS
	}
?>
