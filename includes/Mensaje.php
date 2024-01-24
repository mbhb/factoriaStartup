<?php

namespace es\ucm\fdi\aw;

require_once __DIR__.'/config.php';

class Mensaje {
    private $conn;
    private $titulo;
    private $autor;
    private $contenido;
    private $id;
    private $fecha;
    private$id_Padre;

    public function __construct() {
        $app = Aplicacion::getInstance();
        $this->conn = $app->getConexionBd();
    }
   

    public function obtenerMensajesHijo($padre){
            
        $sql = "SELECT * FROM mensajes WHERE id_padre = ".$padre." ORDER BY fecha ASC";
        $rs = $this->conn->query($sql);
        
        $result = array();
        while($fila = $rs->fetch_assoc()) {
                    $result[] =$fila;
        }
        
         return $result;
    }

    public function obtenerMensajeporId($id) {
        $sql = "SELECT * FROM mensajes WHERE id=".$id."  ORDER BY fecha DESC";
        $rs = $this->conn->query($sql);
        if ($rs) {
            $fila = $rs->fetch_assoc();
            if(!$fila) return false;
           
        }
        return $fila;

    }

    public function autorMensaje($autor) {
        $sql = "SELECT * FROM mensajes WHERE autor = ".$autor."";
        $result = $this->conn->query($sql);
        $idPadre = null;
        if ($result && $result->num_rows > 0) {
            $fila = $result->fetch_assoc();
            $idPadre = $fila['id_padre'];
        }
        return $idPadre;

    }





    public function obtenerMensajesPadre() {
        $sql = "SELECT * FROM mensajes WHERE id_padre IS NULL ORDER BY fecha DESC";
        $rs = $this->conn->query($sql);
        $mensajes = array();
        if ($rs) {
            while ($fila = $rs->fetch_assoc()) {
                $mensajes[] = $fila;
            }
        }   
        
    return $mensajes;
    }
    


    public function obtenerTodosTitulo() {
        $respuestas = array();
        $sqlRespuestas = "SELECT titulo FROM mensajes ORDER BY fecha ASC";
        $rsRespuestas = $this->conn->query($sqlRespuestas);
        if ($rsRespuestas) {
            while ($filaRespuesta = $rsRespuestas->fetch_assoc()) {
                $respuestas[] = $filaRespuesta;
            }
        }
        return $respuestas;
    }

    public function saberIdPadre($id) {
        $sql = "SELECT id_padre FROM mensajes WHERE id = ".$id."";
        $result = $this->conn->query($sql);
        $idPadre = null;
        if ($result && $result->num_rows > 0) {
            $fila = $result->fetch_assoc();
            $idPadre = $fila['id_padre'];
        }
        return $idPadre;

    }

    public function obtenerRespuestas($idPadre) {
        $respuestas = array();
        $sqlRespuestas = "SELECT * FROM mensajes WHERE id_padre = ".$idPadre." ORDER BY fecha DESC";
        $rsRespuestas = $this->conn->query($sqlRespuestas);
        if ($rsRespuestas) {
            while ($filaRespuesta = $rsRespuestas->fetch_assoc()) {
                $respuestas[] = $filaRespuesta;
            }
        }
        return $respuestas;
    }
    

    public function obtenerMostrarMensajes() {
        $mensajes = array();
        $sql = "SELECT * FROM mensajes WHERE id_padre IS NULL ORDER BY fecha DESC";
        $rs = $this->conn->query($sql);
        if ($rs) {
            while ($fila = $rs->fetch_assoc()) {
                $mensajes[] = $fila;
            }
        }
        foreach ($mensajes as $fila) {
            echo '<div class="mensaje">';
            echo '<h3>'.$fila['titulo'].'</h3>';
            echo '<p>Por '.$fila['autor'].' el '.$fila['fecha'].'</p>';
            echo '<p>'.$fila['contenido'].'</p>';
            echo '</div>';
        }
    }
    

    public function enviarMensaje($titulo, $contenido, $idPadre = 0) {
        $autor = intval($_SESSION['id_usuario']);
        
        $fecha = date("Y-m-d H:i:s");
        if($idPadre == NULL){
            $idPadre=0;
     
            $sql = sprintf("INSERT INTO mensajes (titulo, contenido, autor, fecha, id_padre) VALUES('%s', '%s', '%s', '%s', NULL)"
                , $this->conn->real_escape_string($titulo)
                , $this->conn->real_escape_string($contenido)
                , $this->conn->real_escape_string($autor)
                , $this->conn->real_escape_string($fecha)
            );    
            var_dump($autor,$titulo, $idPadre );  
            }
            else{
            $sql = sprintf("INSERT INTO mensajes (titulo, contenido, autor, fecha, id_padre) VALUES('%s', '%s', '%s', '%s', '%s')"
                , $this->conn->real_escape_string($titulo)
                , $this->conn->real_escape_string($contenido)
                , $this->conn->real_escape_string($autor)
                , $this->conn->real_escape_string($fecha)
                , $idPadre);        
            }
        $this->titulo=$titulo;
        $this->contenido=$contenido;
        $this->autor=$autor;
        $this->fecha=$fecha;
        $this->id_Padre=$idPadre;
        return $this->conn->query($sql);
       
    }
    public function getTitulo() {
        return $this->titulo;
    }

    public function getId() {
        return $this->id;
    }

    public function getAutor() {
        return $this->autor;
    }
    public function getPadre() {
        return $this->id_Padre;
    }

    public function getContenido() {
        return $this->contenido;
    }



    public function getFecha() {
        return $this->fecha;
    }

}

