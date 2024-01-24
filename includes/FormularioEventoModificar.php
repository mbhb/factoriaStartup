<?php

namespace es\ucm\fdi\aw;

require_once __DIR__.'/Formulario.php';
use es\ucm\fdi\aw\src\Utils;

class FormularioEventoModificar extends Formulario {


    public function __construct() {
        parent::__construct('formModificarEvento', ['urlRedireccion' => 'calendarioMostrar.php', 'action' => '', 'enctype' => 'multipart/form-data']);
    }

    protected function generaCamposFormulario(&$datosIniciales) {
        
           
        $nombreEvento = $datos['sector'] ?? null;
        $fechaEvento = $datos['fechaEvento'] ?? null;
        
        $htmlErroresGlobales = self::generaListaErroresGlobales($this->errores);
        $erroresCampos = self::generaErroresCampos(['sector', 'fechaEvento'], $this->errores, 'span', array('class' => 'error'));
        


        $id_usuario = Usuario::buscaIdUsuario($_SESSION['nombreUsuario']);
        $htmlDesplegableSectores = self::generaDesplegableEventos($id_usuario);
        
        
        $nombreEvento = $datosIniciales['sector'] ?? '';
        $fechaEvento = $datosIniciales['fechaEvento'] ?? '';
        $html = <<<EOF
        <div class="FormularioCrear">
            <div class="contact_form">
                <h2>Modificar evento</h2>
                    <br></br>
                    <label>Nombre del evento:</label>
                    $htmlDesplegableSectores
                    {$erroresCampos['sector']}
                    
                    <label>¿Cuál quiere que sea la nueva fecha del evento?</label>
                    <input type="date" name="fechaEvento" value="$fechaEvento" />
                    {$erroresCampos['fechaEvento']}

                    <input class="evento" type="submit" value="Modificar evento" />
            </div>
        </div>
        EOF;

        return $html;
    }

    protected function procesaFormulario(&$datos) {
    
        $this->errores=[];

        $fechaEvento = trim($datos['fechaEvento'] ?? '');
        if ( empty($fechaEvento) ) {
            $this->errores['fechaEvento'] = "Debes seleccionar una fecha para el evento.";
        }
        
        $nombreEvento = trim($datos['sector'] ?? '');
        //$sector = filter_var($sector, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        if ($nombreEvento == "Selecciona el evento") {
            $this->errores['sector'] = 'No ha seleccionado ningún evento.';
            
        }
        
    
        if (count($this->errores) === 0) {


            $evento = Eventos::buscaEventoPorNombre($nombreEvento);
            if (!$evento) {
                $this->errores[] = "El evento que intentas modificar no existe.";
            } else {
                $evento->setEvento($nombreEvento);
                $evento->setDate($fechaEvento);
                $evento->setIdEvento($evento->getIdEvento());
                $evento = Eventos::actualiza($evento);
                
            }
        }

    }

    public function generaDesplegableEventos($id_usuario){
        $listaEventos = Eventos::obtenerTotalEventosUsuario($id_usuario);
    
        $numfilas = sizeof($listaEventos);
    
        $html = '<div class="divDesplegable"> <select class="input" name="sector" id="sector" required>';   
        $html .= '<option hidden class="desplegable" selected>Selecciona el evento</option>';	
    
        foreach ($listaEventos as $evento) {
            $id = $evento->getEvento();
            $nombre = $evento->getIdEvento();
            $date = $evento->getDate();
            
            
            
            $html .= '<option value="' . $nombre . '">' .$nombre. "(". $date . ")" .'</option>';	
        } 
    
        $html .= '</select> </div>';
    
        return $html;        
    }
}

    
