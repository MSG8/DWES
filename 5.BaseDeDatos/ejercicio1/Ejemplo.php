<!DOCTYPE html>
<!-- Manuel Solís Gómez -->
<HTML>
	<head>
		<meta charset="UTF-8"/>
		<meta type="author" content="Manuel Solis Gomez"/>
		<meta type="description" content="Prueba de conectar base de datos"/>
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0"/>
		<title> Las Mujeres en la Histori de la Informatica </title
	</head>
  <body>
    <?php
      $servidor = 'localhost';
      $usuario = 'root';
      $contrasenia = '';
      $baseDeDatos = 'clase';
      $conexion = mysqli_connect($servidor,$usuario, $contrasenia,$baseDeDatos);
			$valoresPersona = array (49,'Jose Javier Carmona Calisto',1);
      $error = mysqli_connect_error();
      if (!empty($error))
      {
        echo '<p> usted tiene el error '.$error.'</p>';
      }
      else
      {
        echo '<p> usted se conecto bien </p>'; // NO SE PUEDE ENVIAR POR STRING
      }

      $consulta='SELECT * FROM alumno;';
      $resultado=mysqli_query($conexion ,$consulta); // LA BASE DE DATOS TIENE 2 INDICES, 1 ASOCIATIVO (con la clave principal) Y OTRO (con la fila)
			// $indice= mysqli_num_rows($resultado);
			// echo $indice;

			//while ($fila=mysqli_fetch_rows($resultado);)// eso es para llamar al indice asociativo
			//while ($fila=mysqli_fetch_array($resultado);)// eso es para llamar al indice asociativo
			while ($fila=mysqli_fetch_assoc($resultado))// eso es para llamar al indice asociativo
			{
				echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).' </p>';
				// foreach ($fila as $indiceResultado => $valorResultado)
	       // {
	       //    echo '<p> Para el valor '.$valorResultado.' tiene el indice '.$indiceResultado.'  </p>';
	       //  }
	       //print_r($fila); //Sirve para visualizar contenidos como array
			 }
			 var_dump($valoresPersona); //Visualiza contenidos como array ademas de decir sus tipos
			 echo(count($valoresPersona));

			 echo '<h1> Probar el insert into</h1>';
			$consulta=insertar('alumno',$valoresPersona);
			mysqli_query($conexion ,$consulta);
			echo $consulta;
			$consulta = 'SELECT * FROM alumno;';
      $resultado=mysqli_query($conexion ,$consulta); // LA BASE DE DATOS TIENE 2 INDICES, 1 ASOCIATIVO (con la clave principal) Y OTRO (con la fila)
 			$indice= mysqli_num_rows ($resultado);
 			echo $indice;

			//VEMOS EL CAMBIO
 			while ($fila=mysqli_fetch_assoc($resultado))
 			{
				//unset($fila['Nombre']); Te dara error pero has quitado esa variable
 				echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).' </p>';
 			 }

			 //PRUEBA DE DATA_SEEK, ahora esta al final del puntero del array
			 echo '<h1> PRUEBA DE mysqli_data_seek($rsultado,int) </h1>';
			 mysqli_data_seek($resultado,3); //Si pones mas de lo qeu llegan ls filas de array, este da fallo
			 $fila=mysqli_fetch_assoc($resultado);

			 echo '<p> El alumno/a '.$fila['Nombre'].' tiene numero de clase ('.$fila['NumeroAlumno'].') y es '.repetidor($fila['Repetir']).' </p>';

			 //PRUEBA CONSULTA CON COUNT();, este tendra indices asociativo(nombre del campo) y numerico
			 echo '<h1> PRUEBA DE COUNT() </h1>';
			 $consulta = 'SELECT COUNT(*) AS Contar FROM alumno;'; // Si usas un alias el indice asociativo sera el alias
       $resultado=mysqli_query($conexion ,$consulta);
			 $fila=mysqli_fetch_array($resultado);

			 foreach ($fila as $indice => $valor)
			 {
			 	echo '<p> Probamos el indice que sale cuando usas el COUNT: el indice es '.$indice.' y su valor es '.$valor.' </p>';
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
