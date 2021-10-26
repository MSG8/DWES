<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Pagina de inicio de una pagina web de informacion sobre las mujeres en la informatica"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
		<title> Las Mujeres en la Histori de la Informatica </title>
		<link rel="stylesheet" type="text/css" href="estilo.css"/>
		<link rel="stylesheet" type="text/css" href="estilo3.css"/>
	</head>
	<body>
    <?php
			echo '<h2> VER ARRAY </H2>';
      print_r($_POST);

      echo '<h3> COMO DEBERIA SER </H3>';
			if (!empty($_POST['nombre']))
			{
				echo '<p> El valor nombre: '.$_POST['nombre'].'</p>';
			}

			if (isset($_POST['check']))
			{
				echo '<p> El valor check: '.$_POST['check'].'</p>';
			}
			
			if (!empty($_POST['mujeres']))
			{
				echo '<p> El valor mujeres: '.$_POST['mujeres'].'</p>';
			}
    ?>
	</body>
</HTML>
