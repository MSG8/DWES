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
				require 'clases/validarValores.php';
				$validar = new ValidarValores($_POST);
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
				<label for="num1"> Numero1 </label>
				<input name="num1" type="number" value="" placeholder="Pon un numero"/>
				<label for="num2"> Numero2 </label>
				<input name="num2" type="number" value="" placeholder="Pon un numero"/>
				<select name="operador">
					<option value="" selected="selected" hidden="hidden">--Seleccione un tipo de operador--</option>
					<option value="+"> Suma </option>
					<option value="-"> Resta </option>
					<option value="*"> Multiplicar </option>
					<option value="/"> Dividir </option>
				</select>
				<button type="submit" name="enviar" value="Enviado">Enviar</button>
			</form>
		</section>';
	}

	function respuesta()
	{
		require 'clases/operar.php';

		$operacion=new Operar($_POST);

		//var_dump($_POST["operador"]);

		$resultado=$operacion->resultado($_POST["operador"]);

		echo '<p> El valor resultante sera =  '.$resultado.' </p>';

		echo '<a href=""><input type="button" name="VOLVER" value="VOLVER"/></a>';
	}
?>
