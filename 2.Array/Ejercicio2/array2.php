<!--Manuel Solís Gómez-->
<html>
	<head>
		<title>Mi primera página PHP</title>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8"/>
	</head>
	<body>
		<!--Aqui abro el documento PHP-->
		<?php
			$pedido=3;

			mesPedido($pedido);

			function mesPedido($pedido='1')
			{
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

				echo '<h3> El mes pedido fue '.$ano[$pedido].'</h3>';
			}

		?>
	</body>
</html>
