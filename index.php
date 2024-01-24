<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Factoría Inicio Startup';

$contenidoPrincipal = '';

$rutaApp = RUTA_APP;


    $contenidoPrincipal = <<<EOS
    <div class="initBoxx">

        
        <div class="comienzo">

            <div class="home">
                                
                <h1 class="titulo">
                <span>F</span><span>A</span><span>C</span><span>T</span><span>O</span><span>R</span><span>Í</span><span>A</span><span>    </span><span>S</span><span>T</span><span>A</span><span>R</span><span>T</span><span>U</span><span>P</span>
                </h1>
                <h2>Puedes emprender o puedes tener éxito</h2>
                <h2>Aprovecha la inteligencia colectiva y consigue tus objetivos</h2>

            </div>

            <div class="col">

                <div class="colDentro">

                    <div class="card card1">

                        <h4><a class="boton" href='{$rutaApp}/calendarioMostrar.php'>Calendario</a></h4>
                        <br>
                        <img src="img/c.png"/ width="175" height="120">
                        <span class="img"><img class="imagen" > </span>
                        <br><p>Publica y/o asiste a cursos, talleres, charlas.... y haz networking</p>
                        </div>

                        <div class="card card2">
                        <h4><a class="boton" href='{$rutaApp}/proyectosMostrar.php'>Proyectos</a></h4>
                        <br>
                        <img src="img/eventos.png"/ width="175" height="120">
                        <br><p>Crea y encuentra proyectos interesantes en los que colaborar</p>
                        </div>

                        <div class="card card3">
                        <h4> <a class="boton" href='{$rutaApp}/foro.php'>Foro</a></h4>
                        <br>
                        <img src="img/rec.png"/ width="175" height="120">
                        <br><p>Comparte opiniones y soluciones entre usuarios de toda la comunidad</p>
                        </div>

                        <div class="card card4">
                        <h4><a class="boton" href='{$rutaApp}/postMostrar.php'>Blog</a></h4>
                        <br>
                        <img src="img/p.png"/ width="175" height="120">
                        <br><p>Estate al día de las noticias relacionadas con el mundo empresarial</p>
                        </div>

                    </div>
                </div>
            </div>
           
            
        


        </div>

      


    </div>

  

    EOS;

require __DIR__.'/includes/vistas/plantillas/plantillaInicio.php';

