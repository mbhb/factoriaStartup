<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Proyectos';

$id_Proyecto = "1";

if (isset($_GET['id'])) {
    $id_Proyecto = trim($_GET['id']);
}

$resultado = Proyecto::obtenerProyectosPorId($id_Proyecto);


$contenidoPrincipal = '';
$contenidoPrincipal.= <<<EO
    <div class="proyectoIndividual">
EO;

foreach ($resultado as $fila) {

    $id_proyecto = $fila['id_proyecto'];
    $nombre = $fila['nombre'];
    $short_description = $fila['short_description'];
    $sector = $fila['sector'];
    $description = $fila['description'];
    $needs_description = $fila['needs_description'];
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
                <h2>Breve Descripción</h2>
                <p>$short_description</p>
                <h2>Descripción Completa</h2>
                <p>$description</p>
                <h2>Necesidades del proyecto</h2>
                <p>$needs_description</p>
            </div>
        </div>
    </div>
    EO;

}

$contenidoPrincipal.= <<<EO
    </div>
EO;

require __DIR__.'/includes/vistas/plantillas/plantillaProyectoIndividual.php';



