<!--Manuel Solís Gómez-->
<html>
	<head>
		<title>EJERCICIO 3 DE ARRAY</title>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	<//link rel="stylesheet" type="text/css" href="estilo.css"/>
	</head>
	<body>
		<!--Aqui abro el documento PHP-->
		<?php
			//Como quiero visualizar el nombr del mes y sus dias, usare una array asociativa
			//Pondre el nombre del mes como su indice (Ya que no se repite), y los dias como el valor
			//Asi con un simple foreach tendria todo hecho

			echo '<h1> Mostrar todos los meses y cantidad de dia de todos los meses </h1>';

			$ano["enero"]=31;
			$ano["febrero"]= array(0=> 29, 1=> 28); // asigno en el array a la posicvion ano[febrero]
			//$ano["febrero"]=bisiesto(date("Y")); //Uso la funcion para colocar la cantidad de dia dependiendo del año actual
			$ano["marzo"]=31;
			$ano["abril"]=30;
			$ano["mayo"]=31;
			$ano["junio"]=30;
			$ano["julio"]=31;
			$ano["agosto"]=31;
			$ano["septiembre"]=30;
			$ano["octubre"]=31;
			$ano["noviembre"]=30;
			$ano["diciembre"]=31;

			//print_r ($ano); VEO SI TIENE EL ARRAY DENTRO

			//echo '<p> El mes febrero tiene '.$ano["febrero"][1].' dias</p>'; PRUEBA DE ARRAY DENTRO DE OTRA

			foreach ($ano as $meses => $dias)
			{
				if ($meses == 'febrero')
				{
					if (date("Y") % 4 == 0)
					{
						echo '<p> El mes '.$meses.' tiene '.$dias[0].' dias</p>';
					}
					echo '<p> El mes '.$meses.' tiene '.$dias[1].' dias</p>';
				}
				else
				{
					echo '<p> El mes '.$meses.' tiene '.$dias.' dias</p>';
				}
			}

			//PRUEBA DE DATE
			 //echo date("Estoy en el año Y el mes M, con el dia D a las H,");

			/*foreach ($ano as $meses => $dias)
			{
				echo '<p> El mes '.$meses.' tiene '.$dias.' dias</p>';
			}

			//FUNVION PARA SI ES BISIESTO COLOCAR EN EL ARRAY EL VALOR
			function bisiesto($actual)
			{
				if (($actual % 4) == 0) //Si es divisble de 4 y da 0 sera bisiesto
				{
					return 29;
				}
				return 28;
			}*/

		?>
	</body>
</html>
