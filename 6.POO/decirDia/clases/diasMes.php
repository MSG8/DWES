<?php
  // Autor Manuel Solis Gomez
  // Fixhero y clase: diasMes.php
  // Definicion: Esta es una clase usada para el nombre y el numero de dias de determinado mes en determinado año.
  class diasMes
  {
    private $meses; // creamos el array del año como si no fuera bisiesto

    function __construct($anio) // el constructor cambiara el numero de dias de febrero si es un año bisiesto
    {
      $this->meses = array // creamos el array del año como si no fuera bisiesto
       (
         array ('Enero',31),
         array ('Febrero',28),
         array ('Marzo',31),
         array ('Abril',30),
         array ('Mayo',31),
         array ('Junio',30),
         array ('Julio',31),
         array ('Agosto',31),
         array ('Septiembre',30),
         array ('Octubre',31),
         array ('Noviembre',30),
         array ('Diciembre',31)
       );

      if ($anio % 4 ==0)
      {
        $this->meses[1][1] = 29;
      }
    }

    public function devolverArray($mesPedido) // creado el objeto llamaremos a esta clase con el mes que queremos
    {
      return $this->meses[$mesPedido];
    }
  }
?>
