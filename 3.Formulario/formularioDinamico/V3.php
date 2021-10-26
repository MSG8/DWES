<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<?php
		cabeza();
		cuerpo();
	?>

</HTML>

<?php
	function arrayRelleno()
	{
		return $mujeres = array //Necesitas devolverlo para que se guarde los datos
		(
			0=>'Margaret Hamilton',
			1=>'Lynn Conway',
			2=>'Grace Murray Hopper'
		);
	}

	function opciones($mujeres) //pasas el array para poder usarlo
	{
		for ($indice = 0; $indice < count($mujeres) ; $indice++) // El count da el tamaño del elemento dentro
		{
			echo '<option value="'.$mujeres[$indice].'"  >--'.$mujeres[$indice].'--</option>';
		}
	}

	function cabeza()
	{
		echo
		(
		'<head>
			<meta charset="UTF-8"/>
			<meta type="author" content="Manuel Solis Gomez"/>
			<meta type="description" content="Pagina de formulario de la pagina web"/>
			<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
			<title> Formulario de Opinion </title>
			<link rel="stylesheet" type="text/css" href="estilo.css"/>
			<link rel="stylesheet" type="text/css" href="estilo2.css"/>
		</head>'
		);
	}

	function cuerpo()
	{
		echo
		(
'			<body>
				<header>
					<h1> LAS MUJERES EN LA HISTORIA DE LA INFORMATICA</h1>
				</header>
				<form action="recoger.php" method="post"> <!--<form action="recoger2.php" method="get">-->
					<fieldset>
						<legend>Datos de personales</legend>
						<label  for="nombre"> Nombre completo y apellidos del solicitante (tal y como aparecen en el DNI):</label>
						<input type="text" name="nombre" placeholder="Nombre Apellido Apellido"  />
						<label for="check">Usted es:</label>
						<input type="radio" name="check" class="eleccion" value="Estudiante" /> Estudiante
						<input type="radio" name="check" class="eleccion" value="Profesor"/> Profesor
					</fieldset>
					<fieldset>
						<legend>Datos de la Opinion</legend>
						<label  for="mujeres">¿Cual es su favorita?</label>
						<select name="mujeres" >
								<option value="" selected="selected" hidden="hidden">--Seleccione un nombre--</option>
		');
		$mujeres=arrayRelleno();
		opciones($mujeres);
		echo
		(
						'
						</select>
					</fieldset>
					<!--Borrar-->
					<button type="reset" name="borrar" value="Borrar" >Borrar</button>
					<!--Enviar-->
					<button type="submit" name="enviar" value="Enviado">Enviar</button>
				</form>
				<footer>
					<a href="tabla.html">Resumen</a>
					<a href="index.html">Inicio</a>
					<a href="mailto:masogo008@gmail.com">Correo</a>
					<img src="imagenes/logo.png" />
				</footer>
			</body>
'		);
	}
?>
