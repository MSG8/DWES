<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Prueba de conectar base de dato y sacar un valor en concreto"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
		<title> Las Mujeres en la Histori de la Informatica </title
	</head>
  <body>
		<form >
			<label for="buscar"> Valor a buscar.... </label>
			<input name="buscar" type="text" value=""/>
		</form>

    <?php
      $servidor = 'localhost';
      $usuario = 'root';
      $contrasenia = '';
      $baseDeDatos = 'clase';
      $conexion = mysqli_connect($servidor,$usuario, $contrasenia,$baseDeDatos);
			$valoresPersona = 200;
      // if ($error = mysqli_connect_error())
      // {
      //   echo '<p> usted tiene el error '.$error.'</p>';
      // }
      // else
      // {
      //   echo '<p> usted se conecto bien </p>'; // NO SE PUEDE ENVIAR POR STRING
      // }

      $consulta = 'SELECT * FROM alumno WHERE NumeroAlumno = '.$valoresPersona.';';
      $resultado=mysqli_query($conexion ,$consulta);
			$fila=mysqli_fetch_assoc($resultado);

      if (mysqli_num_rows ($resultado)==0)
      {
        echo '<p> El alumno con numero de clase: '.$valoresPersona.' no existe </p>';
      }
      else
      {
        echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).' </p>';
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

	function insertar($tabla,$valores)
	{
		//INSERT INTO alumno VALUES (99, 'JavierJose' , 0);
		return "INSERT INTO ".$tabla." VALUES (".$valores[0]. ",'".$valores[1]."',".$valores[2].");";
		// 	for ($i=0; $i < count($valores); $i++) //INTENTAR POR ARRAY DINAMICO
		// 	{
		// 		if (isNaN($valores[i]))
		// 		{
		// 			"'".$valores[i]."'";
		// 		}
		// 		else
		// 		{
		// 			.$valores[i].;
		// 		}
		// 		if (i < (count($valores)-1))
		// 		{
		// 			",";
		// 		}
		// 	}
		// ");";
	}
?>
