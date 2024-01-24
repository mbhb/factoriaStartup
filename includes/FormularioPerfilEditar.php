<?php
namespace es\ucm\fdi\aw;

class FormularioPerfilEditar extends Formulario
{
    public function __construct()
    {
        parent::__construct('formBuscador', ['urlRedireccion' => 'perfil.php', 'enctype'=> 'multipart/form-data']);
    }

    protected function generaCamposFormulario(&$datos)
    {
        $infoUser = Usuario::buscaInfoUsuario($_SESSION['id_usuario']);

        $nombre = $infoUser->getNombre();
        $apellido =  $infoUser->getApellido();
        $nombre_usuario = $infoUser->getNombreUsuario();
        $correo = $infoUser->getCorreo();
        $ruta = Imagen::getRutaFromBBDD($infoUser->getImg());
        if(!$ruta) $ruta= RUTA_IMGS .'/fotosUsers/user.png';

        $img = $ruta;

        $htmlErroresGlobales = self::generaListaErroresGlobales($this->errores);
        $erroresCampos = self::generaErroresCampos(['nombre', 'apellido', 'nombre_usuario', 'img'], $this->errores, 'span', array('class' => 'error'));

        $html = <<<EOF
            $htmlErroresGlobales                
            <div class="info"> 
                <div class="columnaImg">
                    <div class="img">
                        <img src=$ruta alt="ImgUser">
                        </div>
                </div>   
                
                <div class="fila">
                <label for="img">Imagen:</label>
                <input type="file" name="img" value="$img"/>
                {$erroresCampos['img']}
                </div>
        
                <div class="fila">
                    <label for="img">Nombre:</label>
                    <input type="text" name="nombre" placeholder="$nombre" value="$nombre" required>
                    {$erroresCampos['nombre']}
                </div>

                <div class="fila">
                    <label for="img">Apellido:</label>
                    <input type="text" name="apellido" placeholder="$apellido" value="$apellido" required>
                    {$erroresCampos['apellido']}
                </div>

                <div class="fila">
                    <label for="img">Nombre de Usuario:</label>
                    <input type="text" name="nombre_usuario" placeholder="$nombre_usuario" value="$nombre_usuario" required>
                    {$erroresCampos['nombre_usuario']}
                </div>   
                
                <button type="submit">Aceptar</button>
                                             
                </form>                    
            </div>                      
        EOF;

    return $html;
    }


    protected function procesaFormulario(&$datos){
        
        $this->errores = [];

        $nombre = trim($datos['nombre'] ?? '');
        $nombre = filter_var($nombre, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        if ( empty($nombre) || mb_strlen($nombre) < 5 ) {
            $this->errores['nombre'] = "El nombre tiene que tener una longitud de al menos 5 caracteres.";
        }
        
        $apellido = trim($datos['apellido'] ?? '');
        $apellido = filter_var($apellido, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        if ( empty($apellido) || mb_strlen($apellido) < 5 ) {
            $this->errores['apellido'] = "El apellido tiene que tener una longitud de al menos 5 caracteres.";
        }

        $nombre_usuario = trim($datos['nombre_usuario'] ?? '');
        $nombre_usuario = filter_var($nombre_usuario, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        if ( empty($nombre_usuario) || mb_strlen($nombre_usuario) < 5 ) {
            $this->errores['nombre_usuario'] = "El nombre de usuario tiene que tener una longitud de al menos 5 caracteres.";
        }  

        

        //IMAGEN
        $errorArchivo = $_FILES['img']['error'] == UPLOAD_ERR_OK && count($_FILES) == 1;
        
        if (!$errorArchivo) {
            $this->errores['img'] = 'Error: Se necesita la imagen del perfil';
            
        }
        else{
            $nombreFoto = $_FILES['img']['name'];

            $ok = Imagen::check_file_uploaded_name($nombreFoto) && Imagen::check_file_uploaded_length($nombreFoto);

            $ok = Imagen::sanitize_file_uploaded_name($nombreFoto);

            $extension = pathinfo($nombreFoto, PATHINFO_EXTENSION);
            $ok = $ok && in_array($extension, Imagen::EXTENSIONES_PERMITIDAS);

            $finfo = new \finfo(FILEINFO_MIME_TYPE);
            $mimeType = $finfo->file($_FILES['img']['tmp_name']);
            $ok = preg_match('/image\/*./', $mimeType);


            $mimeType = $finfo->file($_FILES['img']['tmp_name']);

            if (!$ok) {
                $this->errores['img'] = 'El archivo tiene un nombre o tipo no soportado';
            }


        } 

        if (count($this->errores) === 0) {
           
            //SUBIR IMAGEN
            $tmp_name = $_FILES['img']['tmp_name']; 
            $imagen = Imagen::crea('', $nombreFoto, $mimeType, "fotosUsers");     
            $imagen->guarda($imagen);
            $variableId = $imagen->getIdImagen();
            $carpeta = $imagen->getCarpeta();
            $fichero = "img/{$carpeta}/{$variableId}.{$extension}";
            $imagen->setRuta($fichero);
            $imagen->cambia();
            

            if (!move_uploaded_file($tmp_name, $imagen->getRuta())) {
                $this->errores['img'] = 'Error al mover el archivo';
            }        
            
            $usuario = Usuario::update($_SESSION['id_usuario'], $nombre, $apellido, $nombre_usuario, $imagen->getIdImagen());
        }  
    }
}
    
