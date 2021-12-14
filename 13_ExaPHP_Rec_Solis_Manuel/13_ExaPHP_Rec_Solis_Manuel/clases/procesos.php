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
            if (isset($_GET['op']))
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
            else 
            {
                $this->admin();
            }
            
        }
        public function altaAdmin()
        {
            if (isset($_POST['aceptaAlta']) AND $this->conexion->altaAdmin($_POST) AND ($_POST['password']==$_POST['passwordRep'])) // Si se envia el post y el alta ha sido true
            {
                // mensaje de que ahora esta registrado y si quiere iniciar sesion
                echo
                '<div id="info">
                    <p>
                        USUARIO CREADO
                    </p>
                    <a href="indice.php"> INICIO SESION </a>
                </div>';
            }
            else //Si no se envia
            {
                echo 
                '<section>
                    <form action="" method="post" >
                        <h2> ALTA ADMNISTRADOR </h2>
                        <div>
                            <label for="nombreUsuario">  Usuario </label>
                            <input type="text" name="nombreUsuario" value="" required="required" />
                        </div>
                        <div>
                            <label for="correo">  Correo </label>
                            <input type="email" name="correo" value="" required="required" />
                        </div>
                        <div>
                            <label for="password">  Contraseña </label>
                            <input type="text" name="password" value="" required="required" />
                        </div>
                        <div>
                            <label for="passwordRep"> Rep. Contraseña </label>
                            <input type="text" name="passwordRep" value="" required="required" />
                        </div>
                        <div>
                            <label for="codigo">  Codigo </label>
                            <input type="text" name="codigo" value="" required="required" />
                        </div>
                        <input type="submit" value="ACEPTAR" name="aceptaAlta" />
                        <a href="indice.php"> INICIAR SESION </a>
                    </form>
                </section>';
                if (isset($_POST['aceptaAlta']) AND !$this->conexion->altaAdmin($_POST)) // Si se alta no fue true, puede ser que el check, nombre o el correo falle
                {
                    if ($this->conexion->numeroError() == 4025) 
                    {
                        echo 
                        '<div id="aviso">
                            <p>
                                CODIGO NO VALIDO
                            </p>
                        </div>';
                    }
                    if ($this->conexion->numeroError() == 1062) 
                    {
                        echo 
                        '<div id="aviso">
                            <p>
                                NOMBRE DE USUARIO O CORREO REPETIDO
                            </p>
                        </div>';
                    }
                }
            }
        }

        public function admin()
        {
            if (isset($_POST['acepta']) AND $this->conexion->buscarAdmin($_POST)->fetch_assoc()) // Si se envia el post y la fila existe
            { 
                $fila = $this->conexion->buscarAdmin($_POST)->fetch_assoc();
                echo
                '<section>
                    <form >
                        <h2> USUARIO </h2>
                        <div>
                            <label for="dni">  Usuario </label>
                            <input type="text" name="nombreUsuario" value="'.$fila['nombreUsuario'].'" readonly="readonly" />
                        </div>
                    </form>
                </section>';
            }
            else //Si no se envia
            {
                echo 
                '<section>
                    <form action="" method="post" >
                        <h2> REGISTRARSE </h2>
                        <div>
                            <label for="nombreUsuario">  Usuario </label>
                            <input type="text" name="nombreUsuario" value="" required="required" />
                        </div>
                        <div>
                            <label for="password">  Contraseña </label>
                            <input type="text" name="password" value="" required="required" />
                        </div>
                        <input type="submit" value="ACEPTAR" name="acepta" />
                        <a href="indice.php?op=altaAdmin"> CREAR ADMN </a>
                    </form>
                </section>';
                if (isset($_POST['acepta']) AND !$this->conexion->buscarAdmin($_POST)->fetch_assoc()) // Si no existe la fila saldra un error
                {
                    if ($this->conexion->numeroError() == 0) 
                    {
                        echo 
                        '<div id="aviso">
                            <p>
                                ESTE USUARIO NO EXISTE
                            </p>
                        </div>';
                    }
                    else 
                    {
                        echo 
                        '<div id="aviso">
                            <p>
                                ERROR DESCONOCIDO
                            </p>
                        </div>';
                    }
                }
            }
        }

        public function modificar($campo)
        {
            if ($campo == 'correo') 
            {
                if (isset($_POST['aceptaMod']) AND $this->conexion->modicificarCorreo($_POST)) // Si se envia el post y la fila existe
                {
                    // html con qeu se realizo bien el cambio
                }
                else //Si no se envia
                {
                    $fila = $this->conexion->buscarAdmin($_POST)->fetch_assoc();
                    echo 
                    '<section>
                        <form action="" method="post" >
                            <h2> MODIFICAR CORREO </h2>
                            <div>
                                <label for="correo">  Correo </label>
                                <input type="email" name="correo" value="'.$fila['correo'].'" required="required" />
                            </div>
                            <input type="submit" value="ACEPTAR" name="aceptaMod" />
                        </form>
                    </section>';
                    if (isset($_POST['aceptaMod']) AND !$this->conexion->modicificarCorreo($_POST)) // Si no existe la fila saldra un error
                    {
                        echo $this->conexion->numeroError();
                        echo $this->conexion->tipoError();
                        //aviso de error
                    }
                }
            }
            else 
            {
                echo 
                    '<div id="aviso">
                        <p>
                            Este proceso no me apetece progamarlo
                        </p>
                    </div>';
            }
        }
    }
// fin de clase proceso