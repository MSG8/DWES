<!--Manuel Solís Gómez-->
<html>
	<head>
		<title>Mi primera página PHP</title>
		<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
	</head>
	<body>
		<!--<h1>Mi primer ejemplo</h1>-->
		<?php
			echo '<h1>Mi primer ejemploo/h1>';
			
			for($i=1;$i<=6;$i++){
				echo '<h'.$i.'>Hola Mundo</h'.$i.'>';
			}
		?>
		<h2>Mi segundo ejemplo</h2>
	</body>
</html>
