<?php
    /**
     * Controlador de la aplicacion, se encarga de dirigir los procesos
     */
    class App
    {
        public $operaciones; //Declaro clase operaciones, encargada de las operaciones con la base de datos
        public $vista; //Declaro clase vista, encargada de la parte visual del programa
        public $modelo; //Declaro clase modelo, encargada de los datos guardados en la base de datos
        function __construct()
        {
            require 'operacionesBd.php'; //llamamos a los parametros para la conexion
            $this->operaciones = new Operaciones();
            $this->vista = new Vista();
            $this->modelo = new Modelo();
        }
        public function sesion()
        {
            if (isset($_GET['op'])) 
            {
               switch ($_GET['op']) 
               {
                   case 'Crear':
                        $this->crearUsuario($_POST);
                       break;
                   default:
                        $this->verificarUsuario();
                       break;
               }
            }
            else 
            {
                $this->verificarUsuario();
            }
        }
        public function verificarUsuario()
        {
            if (isset($_POST['entrar']) && $informacionUsuario = $this->operaciones->buscarUsuario($_POST['correo'])->fetch_assoc()) 
            {
                if ($_POST['constrasenia'] == $informacionUsuario['contrasenia'] ) 
                {
                    if (!isset($_SESSION['correo'])) 
                    {
                        echo'sesion NO existente';
                        var_dump($_POST);
                        $_SESSION['correo'] = $_POST['correo'];
                    }
                    else 
                    {
                        echo'sesion existente';
                    }
                    echo'sesion iniciada';
                    $this->vista->perfil();
                }
            }
            else 
            {
                $this->vista->formularioEntrar();
            }
        }
        public function crearUsuario($formulario)
        {
            if (isset($_POST['crear']) && $this->operaciones->agregarUsuario($formulario)) 
            {
                if (isset($_POST['preferencia'])) 
                {
                    $this->operaciones->guardarPreferencias($_POST);
                }
                header('Location: ?op=Inicio');
            }
            else 
            {
                //$this->vista->formularioCrear($this->operaciones->minijuegos());
                $this->vista->formularioCrearDos($this->operaciones->minijuegos());
            }
        }
    }
    /**
     * Clase destinada a visualizar nuestra aplicacion
     */
    class Vista
    {
        public function formularioEntrar()
        {
            echo
                '<form action="" method="post">
                    <h2> ENTRAR </h2>
                    <div>
                        <label for="correo">
                            CORREO
                        </label>
                        <input type="text" name="correo"/>
                    </div>
                    <div>
                        <label for="constrasenia">
                            CONSTRASEÑA
                        </label>
                        <input type="text" name="constrasenia"/>
                    </div>
                    <input value="ENTRAR" type="submit" name="entrar" />
                    <a href="?op=Crear"> Crear cuenta </a>
                </form>'
            ;
        }
        public function formularioCrear($minijuegos)
        {
            echo
                '<form action="" method="post">
                    <h2> CREAR </h2>
                    <div>
                        <label for="correo">
                            CORREO
                        </label>
                        <input type="text" name="correo"/>
                    </div>
                    <div>
                        <label for="constrasenia">
                            CONSTRASEÑA
                        </label>
                        <input type="text" name="constrasenia"/>
                    </div>
                    <div>
                        <label for="preferencia">
                            PREFERENCIAS
                        </label>';
                if (isset($minijuegos)) 
                {
                     
                    echo '<select name="preferencia[]" multiple="multiple">';
                    echo '<option value="null" selected="selected" hidden="hidden"> SELECCIONA PREFERENCIAS </option>';
                    while ($fila = $minijuegos->fetch_assoc()) 
                    {
                        echo '<option value='.$fila["idMinijuego"].'> '.$fila["nombre"].' </option>';
                    }
                    echo '</select>';
                }
                echo 
                    '</div>
                    <input value="CREAR" type="submit" name="crear" />
                    <a href="?op=Iniciar"> Iniciar sesion </a>
                </form>'
            ;
        }
        public function formularioCrearDos($minijuegos)
        {
            echo
                '<form action="" method="post">
                    <h2> CREAR </h2>
                    <div>
                        <label for="correo">
                            CORREO
                        </label>
                        <input type="text" name="correo"/>
                    </div>
                    <div>
                        <label for="constrasenia">
                            CONSTRASEÑA
                        </label>
                        <input type="text" name="constrasenia"/>
                    </div>
                    <div>
                        <label for="preferencia">
                            PREFERENCIAS
                        </label>';
                if (isset($minijuegos)) 
                {
                    while ($fila = $minijuegos->fetch_assoc()) 
                    {
                        echo 
                            '
                            <div>
                                <input type="checkbox" name="preferencia[]" value='.$fila["idMinijuego"].' />
                                <label for="preferencia[]">
                                    '.$fila["nombre"].' 
                                </label>
                            </div>'
                        ;
                    }
                    echo '</select>';
                }
                echo 
                    '</div>
                    <input value="CREAR" type="submit" name="crear" />
                    <a href="?op=Iniciar"> Iniciar sesion </a>
                </form>'
            ;
        }
        public function perfil()
        {
            echo
                '
                <div id="entrado">
                    <p> BIENVENIDO A NUESTRA WEB </p>
                </div>
                
                <p> YA ESTAS REGISTRADO DON/DOÑA '.$_SESSION["correo"].' con nombre de sesion: '.session_name().' y id de sesion de: '.session_id().' </p>
                
                <a href="?op=Inicio"> Cambiar cuenta </a>'
            ;
        }
    }
    /**
     * Clase destinada a guardar la informacion de nuestra aplicacion
     * $puntuacion es la puntuacion de la partida
     * $nick es el nombre del jugador
     */
    class Modelo
    {
        public $puntuacion; 
        function __construct()
        {
            $this->puntuacion = 0;
            $this->nick = '';
        }
    }
?>