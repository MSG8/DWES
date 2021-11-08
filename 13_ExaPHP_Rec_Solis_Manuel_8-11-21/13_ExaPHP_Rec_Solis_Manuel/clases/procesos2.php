<?php
    class Procesos
    {
        public $conexion;

        function __construct() 
        {
            require('operacionesBD.php');
            $this->conexion = new OperacionesBD();
        }
        public function estructura()
        {
            switch ($_GET['op']) 
            {
                case 'altaAdmin':
                    $this->altaAdmin();
                    break;
                
                case 'modificar':
                    $this->modificar($_GET['campo']);
                    break;

                default:
                    $this->admin();
                    break;
            }
        
        }
        public function admin()
        {
            if (isset($_POST['acepta']) AND $this->conexion->buscarAdmin($_POST)->fetch_assoc()) // Si se envia el post y la fila existe
            {
                // html con nombre de usuario y se puden los nav
            }
            else //Si no se envia
            {
                //Formulario de buscar admin
                if (!$this->conexion->buscarAdmin($_POST)->fetch_assoc()) // Si no existe la fila saldra un error
                {
                    $this->conexion->numeroError();
                    $this->conexion->tipoError();
                    //aviso de error
                }
            }
        }
    }
// fin de clase proceso