<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Factoría Startup';

$contenidoPrincipal = '';

$rutaApp = RUTA_APP;


    $contenidoPrincipal = <<<EOS
    <div class="initBoxx">

        <h1 class="titulo">
        <span>N</span><span>E</span><span>G</span><span>O</span><span>C</span><span>I</span><span>A</span><span>D</span><span>O</span><span>R</span>
        </h1>
        <div class="descripcion">
            <h2>Selecciona la opción que más te interese:</h2>
        </div>

        <div class="opciones">

            <div class="botonBusco">
            
            <h3>Aquí encontrarás proyectos o sectores afines en los que podrás colaborar</h3>
            <h3>¿A qué esperas para encontar tu proyecto ideal?</h3>
            <a class="boton" href='{$rutaApp}/negociadorBusquedaColaborar.php'>Busco colaborar en un proyecto</a>
            </div>

           

            <div class="botonBusco">
            
            <h3>¿Tienes un proyecto interesante?</h3>
            <h3>Aquí encontrarás perfiles que se ajusten a las necesidades de tu proyecto</h3>
            <a class="boton" href='{$rutaApp}/negociadorBusquedaColaboradores.php'>Busco colaboradores para mi proyecto</a> 
            </div>

        </div>

       
        


    </div>

  

    EOS;

require __DIR__.'/includes/vistas/plantillas/plantillaNegociador.php';




















