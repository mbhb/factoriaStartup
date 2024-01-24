<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Proyectos';

$sector = "ALL";

if (isset($_GET['sector'])) {
    $sector = trim($_GET['sector']);
}

$resultado = Proyecto::obtenerTotalProyectos($sector);

$form = new FormularioProyectoBusqueda(false);
$html = $form->gestiona();

$contenidoPrincipal = '';
$contenidoPrincipal.= <<<EO
    <div class="todosProyectos">
        <h3>Proyectos</h3>
        <div class="anadirProy"> 
        
            $html
            <a class='button proyecto' href='/factoriaStartup/proyectoCrear.php'>+</a>
            
            
        </div>
EO;

foreach ($resultado as $fila) {

    $id_proyecto = $fila['id_proyecto'];
    $nombre = $fila['nombre'];
    $short_description = $fila['short_description'];
    $sector = $fila['sector'];
    $ruta = Imagen::getRutaFromBBDD($fila['imagen']);
    $contenidoPrincipal.= <<<EO
    <div class="proyecto">
        
        <div class="filaTitulo">
            <h2>$nombre</h2>
        </div>

        <div class="fila">
            <div class="columnaImg">
                <img src="$ruta" alt="ImgProject">
            </div>

            <div class="columna">
                <p>$short_description</p>
                <a href="proyectosMostrarCompleto.php?id=$id_proyecto">Leer más</a>
            </div>
        </div>
    </div>
    EO;

}

$contenidoPrincipal.= <<<EO
    </div>
EO;

require __DIR__.'/includes/vistas/plantillas/plantillaProyectos.php';



