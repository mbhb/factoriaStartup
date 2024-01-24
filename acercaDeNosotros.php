<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Acerca de Nosotros';

$contenidoPrincipal = '';

$rutaApp = RUTA_APP;



    $contenidoPrincipal = <<<EOS
            
                                    
                <div class="fondoQuienesSomos">
                    <div class="content">

                    
                        <div class="contenido">
                            <h1 class="element titulo">¿Quienes forman Factoria StartUp?</h1>
                            <h2>En Factoría StartUp dispones de las herramientas y recursos necesarios para poder:</h2>
                        </div>   


                        <div class="contenido2">
                        <img src="img/post-it.jpg" alt="Imagen" class="image">

                            <div class="lista">
                            <ul>
                                <li>Crear un perfil profesional adaptado al proyecto que te interesa.</li>
                                <li>Publicar un proyecto en cualquier fase del mismo.</li>
                                <li>Encontrar equipo; socio, colaborador, mentor ..</li>
                                <li>Evolucionar y crecer en la comunidad en cada momento</li>
                                <li>Buscar y publicar eventos que te ayuden a crecer como profesional</li>
                                <li>Publicar y exponer tus ideas, tus conocimientos, tu experiencia…</li>
                                <li>Encontrar respuestas y soluciones a través del soporte comunitario</li>
                                <li>Comunicarte con cualquier miembro de la comunidad de forma pública o privada.</li>    
                            </ul>

                            <p>Existen más recursos, pero en vez de extendernos más creemos que es mejor que entres y lo compruebes.
                        Además que esto no acaba aquí, en Factoría StartUP estamos en constante evolución e iremos añadiendo más herramientas y funcionalidades para tu éxito</p>

                            </div>
                        </div>
                    </div>

                    <div class="contenido">

                        

                    </div>
                </div>   
                <div class="overlay">
                              
                

                
               
                <div class="boton">
                    <button class="boton">
                        <a href="registro.php">¡Empieza ahora!</a>
                    </button>
                </div>

                <div class="colaboracion">
            
                <div class="parteDeAbajo">

                    <div class="titulo">
                        <h3>Nuestros colaboradores</h3>
                    </div>
                </div>

                <div class="colaboradores">
                    <div class="colaborador">
                    <h4>Antonio González</h4>
                    
                    <p>CEO</p>
                    </div>

                    <div class="colaborador">
                    <h4>Paco Guio</h4>
                    <p>CTO</p>
                    </div>


                </div>
                    
                
                <div class="colaboradores">
                    <div class="colaborador">
                    <h4>Miriam García Godoy</h4>
                    <br>
                    <div class="img-box">
                    <img src="img/miriam.jpg">
                    </div>
                    <br><p>Estudiante del Doble grado de Ingenieria Informatica y ADE</p>
                    </div>

                    <div class="colaborador">
                    <h4>Leire Fernández Rivas</h4><br>
                    <div class="img-box">
                    <img src="img/leire.jpeg"/width="200" height="250">
                    </div>
                    <br><p>Estudiante del Doble grado de Ingenieria Informatica y ADE</p>
                    </div>

                    <div class="colaborador">
                    <h4>María Belén Herruzo Barroso</h4>
                    <br>
                    <div class="img-box">
                    <img src="img\maria.jpeg"/width="200" height="250">
                    </div>
                    <br><p>Estudiante del Doble grado de Ingenieria Informatica y ADE</p>
                    </div>

                </div>

                
            </div>
            

                   
             </div>    

            </div>
            

    EOS;

require __DIR__.'/includes/vistas/plantillas/plantillaNormal.php';

//https://www.youtube.com/watch?v=cP9KxNqHrUY   