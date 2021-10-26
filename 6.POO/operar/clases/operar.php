<?php
  // Autor: Manuel Solis Gomez
  // Fixhero y clase: operar.php
  // Definicion: Esta es una clase usada para una determinada operacion entre 2 numeros.
  class Operar
  {
    private $numMayor;
    private $numMenor;
    private $resultado;

    function __construct($formulario)
    {
      if($formulario["num1"] > $formulario ["num2"])
      {
        $this->numMayor = $formulario["num1"];
        $this->numMenor = $formulario["num2"];
      }
      else
      {
        $this->numMayor = $formulario["num2"];
        $this->numMenor = $formulario["num1"];
      }
    }

    public function resultado($operador)
    {
      switch ($operador)
      {
        case "+":
          $this->resultado= $this->numMayor + $this->numMenor;
          break;
        case "-":
          $this->resultado= $this->numMayor - $this->numMenor;
          break;
        case "*":
          $this->resultado= $this->numMayor * $this->numMenor;
          break;
        case "/":
          $this->resultado= $this->numMayor / $this->numMenor;
          break;
      }

      return $this->resultado;
    }
  }
?>
