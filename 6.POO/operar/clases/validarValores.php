<?php
  // Autor: Manuel Solis Gomez
    // Fixhero y clase: validarValores.php
  // Definicion: Esta es una clase usada para validar que el formulario no este vacio.
  class ValidarValores
  {
  	public $errores = 0;

    function __construct($formulario)
    {

  		if (empty($formulario["num1"]))
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (empty($formulario["num2"]))
  		{
  			$this->errores = $this->errores+1;
  		}

  		if (empty($formulario["operador"]))
  		{
  			$this->errores = $this->errores+1;
  		}
  	}
  }
?>
