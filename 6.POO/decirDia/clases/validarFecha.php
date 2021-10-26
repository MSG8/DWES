<?php
  // Autor: Manuel Solis Gomez
  // Fixhero y clase: validarFecha.php
  // Definicion: Esta es una clase usada para validar una fecha introducida por formulario (input [type="number"]).
  class validarFecha
  {
  	public $errores = 0;

    function __construct($año)
    {

  		if (empty($año["dias"]))
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (empty($año["mes"]))
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (empty($año["anio"]))
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (($año["dias"]) > 31 || ($año["dias"]) < 1)
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (($año["mes"]) > 12 || ($año["mes"]) < 1)
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (($año["anio"]) > date("Y") || ($año["anio"]) < 1)
  		{
  			$this->errores = $this->errores+1;
  		}
  	}
  }
?>
