<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Perfil';

$infoUser = Usuario::buscaInfoUsuario($_SESSION['id_usuario']);

$contenidoPrincipal = '';

$contenidoPrincipal.= <<<EO
    <div class="todoInfo">
        <div class="titulo"> 
                <h2>Mi Perfil</h2>
                <div class="boton">
                <a href="perfilEditar.php"><button>Editar Datos</button></a>
            </div>
        </div>
EO;


$nombre = $infoUser->getNombre();
$apellido =  $infoUser->getApellido();
$nombre_usuario = $infoUser->getNombreUsuario();
$correo = $infoUser->getCorreo();
$ruta = Imagen::getRutaFromBBDD($infoUser->getImg());


$numAptitudes= $infoUser->getAptitudes();
$aptitudes=Aptitudes::obtenerAptitudPorNum($numAptitudes);

$aptitudesBBDD = Aptitudes::getAptitudesUser($_SESSION['id_usuario']);
$aptitudes = '';
if($aptitudesBBDD == NULL){
    $aptitudes = "Ninguna";
}
foreach($aptitudesBBDD as $apt){
   
    $aptitudes .=  " " . Aptitudes::obtenerAptitudPorNum($apt['id_aptitud']) ;
}


if(!$ruta) $ruta= RUTA_IMGS .'/fotosUsers/user.png';

$contenidoPrincipal .= <<<EO

        <div class="info"> 
            <div class="columnaImg">
                <div class="img">
                    <img src=$ruta alt="ImgUser">
                    </div>
            </div>


            <p>Nombre de usuario: $nombre_usuario</p>
            <p>Nombre: $nombre</p>
            <p>Apellido: $apellido</p>
            <p>Correo: $correo</p>
            <p>Aptitudes: $aptitudes</p>
        </div> 
        
    </div>

EO;
   


require __DIR__.'/includes/vistas/plantillas/plantillaPerfil.php';