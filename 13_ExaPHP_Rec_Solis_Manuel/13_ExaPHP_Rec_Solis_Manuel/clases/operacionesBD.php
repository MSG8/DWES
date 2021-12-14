<?php
class OperacionesBD
{
    public $conexion;
    public $resultado;

    function __construct() 
    {
        require('config.php'); //llamamos a las constantes para la conexion
        $this->conexion = new mysqli(SERVIDOR, USUARIO, CONTRASENA, BASEDATOS); //CREAMOS LA CONEXION CON LA BASE DE DATOS
    }

    public function hacerConsulta($consulta)
    {
        return $this->conexion->query($consulta);
    }

    public function altaAdmin($datos) //por los datos de formulario crea un admin
    {
        $consulta = "INSERT INTO Administrador(nombreUsuario, correo, password, codigo) VALUES ('".$datos['nombreUsuario']."', '".$datos['correo']."', '".$datos['password']."', '".$datos['codigo']."');";
        $this->resultado = $this->hacerConsulta($consulta);
        return $this->resultado;
    }

    public function buscarAdmin($datos) //busca si existe ese admin
    {
        $consulta = "SELECT * FROM Administrador WHERE nombreUsuario = '".$datos['nombreUsuario']."' AND password = '".$datos['password']."';";
        $this->resultado = $this->hacerConsulta($consulta);
        return $this->resultado;
    }

    public function modificarCorreo($datos) //busca si existe ese admin
    {
        $consulta = "UPDATE Administrador SET Administrador WHERE nombreUsuario = '".$datos['nombreUsuario']."' AND password = '".$datos['password']."';";
        $this->resultado = $this->hacerConsulta($consulta);
        return $this->resultado;
    }

    public function filasAfec() 
    {
        return $this->resultado->num_rows;
    }

    public function numeroError()
    {
       return $this->conexion->errno;
    }

    public function tipoError()
    {
       return $this->conexion->error;
    }

    public function cerrar()
    {
       $this->conexion->close();
    }
}

?>