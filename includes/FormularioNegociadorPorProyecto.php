<?php
namespace es\ucm\fdi\aw;


class FormularioNegociadorPorProyecto extends Formulario
{
    private $id_proyecto;

    public function __construct($id_proyecto) {
        $this->id_proyecto = $id_proyecto;
    parent::__construct('formBusqueda', [ 'enctype' => 'multipart/form-data']);
    }

    
    protected function generaCamposFormulario(&$datos)
    {    
        $erroresCampos = self::generaErroresCampos(['porcentajeEmpresa','porcentajeVentas', 'errorGlobal'], $this->errores, 'span', array('class' => 'error'));

                

        $html = <<<EOF
            <div class="contact_form">
                <div class="titulo">
                    <h1>Selecciona el porcentaje que te gustaría conseguir tras esta negociación</h1>
                        <div class="contenedor">   
                            <div class="porcVentas">    
                                <p>Porcentaje empresa:</p>
                                <input class ="control" type="number" name="porcentajeEmpresa" id="porcentajeEmpresa" placeholder="Selecciones un porcentaje numérico" >
                                {$erroresCampos['porcentajeEmpresa']}
                            </div>    
                            <div class="porcVentas">
                                <p>Porcentaje de ventas o beneficios:</p>
                                <input class ="control" type="number" name="porcentajeVentas" id="porcentajeVentas" placeholder="Selecciones un porcentaje numérico" >
                                {$erroresCampos['porcentajeVentas']}
                            </div>
                            <div class="porcVentas">
                                <p>Por obra y servicio</p>
                                <select name="obrayservicio" id="obrayservicio">
                                    <option value="1">Sí</option>
                                    <option value="0" selected>No</option>
                                </select>
                            </div>
                            <div class="porcVentas">
                                <p>Pacto a futuro</p>
                                <select name="pactoAFuturo" id="pactoAFuturo">
                                    <option value="1">Sí</option>
                                    <option value="0" selected>No</option>
                                </select>
                            </div>
                        </div>
                        <div class="contenedor2">  
                            <h1>Si lo desea puede escribir un mensaje para el usuario:</h1>
                            <input class ="control" type="text" name="mensaje" id="mensaje" placeholder="Escriba un mensaje para el usuario">
                          
                            <div class="botonNeg"><button class= "envio" type="submit"name="negociar">Negociar</button></div>
                            {$erroresCampos['errorGlobal']}
                        </div> 
                </div>
            </div>
        EOF;

        return $html;
    }
    

    protected function procesaFormulario(&$datos){

        $porcentajeEmpresa = trim($datos['porcentajeEmpresa'] ?? '');
        $porcentajeEmpresa = filter_var($porcentajeEmpresa, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
    
        $porcentajeVentas = trim($datos['porcentajeVentas'] ?? '');
        $porcentajeVentas = filter_var($porcentajeVentas, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $mensaje = trim($datos['mensaje'] ?? '');
        $mensaje = filter_var($mensaje, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $obrayservicio = trim($datos['obrayservicio'] ?? '');
        $obrayservicio = filter_var($obrayservicio, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

        $pactoAFuturo = trim($datos['pactoAFuturo'] ?? '');
        $pactoAFuturo = filter_var($pactoAFuturo, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        
        if ( empty($porcentajeEmpresa)) {
            $this->errores['porcentajeEmpresa'] = "Debes seleccionar el porcentaje de la empresa que deseas.";
        }

        if ( empty($porcentajeVentas) ) {
            $this->errores['porcentajeVentas'] = "Debes seleccionar el porcentaje de las ventas que deseas.";
        }
        $busquedaProyecto = new BusquedaProyectos($_SESSION['id_usuario'], $this->id_proyecto, $porcentajeVentas,$porcentajeEmpresa, $obrayservicio, $pactoAFuturo, $mensaje);

        $existe = $busquedaProyecto->existeBusqueda();
        if ($existe) {
            $this->errores['errorGlobal'] = "La negociación con ese proyecto ya existe.";
        }

        $match = NULL;
        
        if (count($this->errores) === 0) {            
                
            $intento = $busquedaProyecto->insertarBusqueda();

            if($intento){

                //PRIMERO HACER UN BUCLE PARA TODAS LAS BÚSQUEDA_COLABORADORES CON ESTE ID_PROYECTO SELECCIONADO, CUYA APTITUD SEA ALGUNA DE LAS MÍAS Y QUE EL USUARIO SEA DISTINTO AL USUARIO DE BÚSQUEDA_PROY
                $busquedas_colab = BusquedaColaboradores::getBusquedaColabMatches($_SESSION['id_usuario'], $this->id_proyecto);

                foreach($busquedas_colab as $busqueda_colab){

                    //EXTRAER EL ID DE LA BUSQUEDA DE BUSQUEDA PROYECTO
                    $busqueda_proyecto = BusquedaProyectos::getIdFromBBDD($_SESSION['id_usuario'], $this->id_proyecto);
                    
                    //MIRAR SI YA EXISTE MATCH PARA ESA COMBINACIÓN DE BÚSQUEDA_COLAB Y BÚSQUEDA_PROY
                    $existeMatch = Matches::existe_match($busqueda_colab['id_busqueda'], $busqueda_proyecto['id_busqueda']);
                    
                    //MIRAR SI CUMPLE LOS CRITERIOS PARA HACER MATCH
                    $cumpleCriteriosMatch = Matches::analizarSiMatch($busqueda_colab, $busqueda_proyecto);

                    //SI EL MATCH NO EXISTE Y SE CUMPLEN LOS CRITERIOS PARA HACER MATCH
                    if(!$existeMatch && $cumpleCriteriosMatch){
                        //HACER MATCH
                        $match = Matches::hacer_match($busqueda_colab, $busqueda_proyecto);

                        if($match){

                            //SACAR POR PANTALLA EL POPUP
                            $nombreUser = Usuario::buscaNombreUsuarioPorId($busqueda_colab['id_usuario']);
                            $nombreProyecto = Proyecto::getNombreFromId($busqueda_colab['id_proyecto']);

                            $mensaje = "El usuario " . $nombreUser . " está interesado en que colabores en su proyecto ". $nombreProyecto;
                            
                            $popup = new MatchPopUp("¡Has hecho match!", $mensaje, $busqueda_colab['id_busqueda'], $busqueda_proyecto['id_busqueda']);
                            $popup->show();
                            
                        }
                    }
                }          
            }

            if($match == NULL){
                $mensaje = "No has hecho match con ningún proyecto. ¡Sigue intentándolo!";
                $popup = new MatchPopUp("Lo siento...", $mensaje, NULL, NULL);
                $popup->show();
            }
        }
    }
}