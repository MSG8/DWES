<!--Manuel Solís Gómez-->
<html>
	<head>
		<title>Mi primera página PHP</title>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="estilo.css"/>
	</head>
	<body>
		<!--Aqui abro el documento PHP-->
		<?php
			//Formamos el array
			$ano = array
			(
				1=>"enero",
				2=>"febrero",
				3=>"marzo",
				4=>"abril",
				5=>"mayo",
				6=>"junio",
				7=>"julio",
				8=>"agosto",
				9=>"septiembre",
				10=>"octubre",
				11=>"noviembre",
				12=>"diciembre"
			);

			//UN MES ESPECIFICO
			echo '<h2> Un mes especifico</h2>';

			echo '<p> Este mes '.$ano[5].' es el mes 5 </p>';

			//UN MES ESPECIFICO POR PARAMETRO
			echo '<h2> Un mes especifico de otra variable</h2>';

			$valor=5;

			echo '<p> Este mes '.$ano[$valor].' es el mes 5 </p>';

			echo '<h2> Un mes especifico de otra variable</h2>';

			$valor=5;

			echo '<p> Este mes '.$ano[$valor].' es el mes 5 </p>';

			echo '<h2> Meses por for</h2>';

					// echo  para tabla vertical
						// '<table border="1" >
							// <tr>
								// <td> Número del mes</td>
								// <td> Nombre del mes</td>
							// </tr>';


					// for($i=1;$i<=12;$i++) //mostrar el array con un for
					// {
						// echo '<tr>
								// <td> ' .$i.' </td>
								// <td> ' .$ano[$i].' </td>
							// </tr>';
					// }

					//echo '</table>';

			//TABLA HORIZONTAL FOR
			 echo
				'<table>
					<tr>
						<td> Número del mes </td>';

			for($i=1;$i<=12;$i++) //mostrar el array con un for
			{
				echo '<td> ' .$i.' </td>';
			}
			 echo '</tr>
					<tr>
						<td> Nombre del mes </td>';

			for($i=1;$i<=12;$i++) //mostrar el array con un for
			{
				echo '<td> ' .$ano[$i].' </td>';
			}
			 echo 	'</tr>
				</table>';

			echo '<h2> Meses por foreach</h2>';

			//TABLA HORIZONTAL FOREACH
			echo
				'<table >
					<tr>
						<td> Número del mes </td>';

			foreach($ano as $indice => $mes) //mostrar el array con un foreach
			{
				echo '<td> ' .$indice.' </td>';
			}
			 echo '</tr>
					<tr>
						<td> Nombre del mes </td>';

			foreach($ano as $indice => $mes) //mostrar el array con un foreach
			{
				echo '<td> ' .$mes.' </td>';
			}
			 echo 	'</tr>
				</table>';

					// foreach($ano as $indice => $mes) //mostrar el array con un foreach
					// {
						// echo '<p> El indice '.$indice.' es el mes '.$mes.' del ano </p>';
					// }

			echo '<h2> Meses por while</h2>';

			$i=1;

			//TABLA HORIZONTAL WHILE
			echo
				'<table >
					<tr>
						<td> Número del mes </td>';

			while($i <= 12) //mostrar el array con un while
			{
				echo '<td> ' .$i.' </td>';
				$i=$i+1;
			}
			 echo '</tr>
					<tr>
						<td> Nombre del mes </td>';
			$i=1;
			while($i <= 12) //mostrar el array con un while
			{
				echo '<td> ' .$ano[$i].' </td>';
				$i=$i+1;
			}
			 echo 	'</tr>
				</table>';

					// while($i <= 12) //mostrar el array con un while
					// {
						// echo '<p> El indice '.$i.' es el mes '.$ano[$i].' del ano </p>';
						// $i=$i+1;
					// }

			echo '<h2> Meses por dowhile</h2>';

			$i=1;

			//TABLA DO WHILE

			echo
				'<table >
					<tr>
						<td> Número del mes </td>';

			 //mostrar el array con un foreach
			do
			{
				echo '<td> ' .$i.' </td>';
				$i=$i+1;
			}while($i <= 12);
			 echo '</tr>
					<tr>
						<td> Nombre del mes </td>';
			$i=1;
			 //mostrar el array con un foreach
			do
			{
				echo '<td> ' .$ano[$i].' </td>';
				$i=$i+1;
			}while($i <= 12);
			 echo 	'</tr>
				</table>';

					// do//mostrar el array con un do..while
					// {
						// echo '<p> El indice '.$i.' es el mes '.$ano[$i].' del ano </p>';
						// $i=$i+1;
					// }while($i <= 12);

			echo '<h2> Meses por print_r</h2>';

			print_r($ano); //mostrar el array con un print_r
		?>
	</body>
</html>
