<!DOCTYPE html>
<!--
	Autor Manuel Solis Gomez
 	Fixhero y clase: diasMes.php
 	Definicion: Esta es una clase usada para el nombre y el numero de dias de determinado mes en determinado año.
-->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Devolver dd/nombre_mes/aaaa y numero de dias de un mes mediante una clase"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
		<title> Fecha actual </title>
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
				require 'clases/validarFecha.php';
				$validar = new validarFecha($_POST);
				if ($validar->errores==0)
				{
					echo '<section>';
					respuesta();
					echo '</section>';
				}
				else
				{
					formulario();
					echo "<script>alert('Tiene en su formulario errores')</script>";
				}
			}
     ?>
  </body>
</HTML>

<?php
	function formulario()
	{
		echo
		'<section>
			<h1>FORMULARIO DE BUSQUEDA</H1>
			<form action="#" method="post">
				<label for="dias"> FECHA </label>
				<input name="dias" type="number" value="" placeholder="dd"/>
				<input name="mes" type="number" value="" placeholder="mm"/>
				<input name="anio" type="number" value="" placeholder="aaaa"/>
				<button type="submit" name="enviar" value="Enviado">Enviar</button>
			</form>
		</section>';
	}

	function respuesta()
	{
		require 'clases/diasMes.php';

		// echo '<p> El mes '.$_POST['mes'].' del año '.$_POST['anio'].' </p>';

		$anioPedido=new diasMes($_POST['anio']);

		$mes=$anioPedido->devolverArray(($_POST['mes']-1));

		// var_dump($mes);

		echo '<p> '.$_POST['dias'].' / '.$mes[0].' / '.$_POST['anio'].' </p>';
		echo '<p> El mes '.$mes[0].' tiene '.$mes[1].' dias </p>';

		echo '<a href=""><input type="button" name="VOLVER" value="VOLVER"/></a>';

	}


?>
