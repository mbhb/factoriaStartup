<?php
namespace es\ucm\fdi\aw;
require_once __DIR__.'/includes/config.php';

$tituloPagina = 'Perfil mis matches';

$contenidoPrincipal = '';

$confirmados = Matches::obtenerTotalMatchesConfirmados($_SESSION['id_usuario']);
$noConfirmados = Matches::obtenerTotalMatchesSinConfirmar($_SESSION['id_usuario']);
$confirmadosEmpty = '';
$noConfirmadosEmpty = '';
// Mostrar cada proyecto con su imagen 

if($noConfirmados == ''){
    $noConfirmadosEmpty .= <<<EO
    <div class="matchNo">
        <div class="filaTitulo">
            <h2>No se encuentran matches sin confirmar</h2>
        </div>
    </div>
    EO;
}

if($confirmados == ''){
    $confirmadosEmpty .= <<<EO
    <div class="matchNo">
        <div class="filaTitulo">
            <h2>No se encuentran matches confirmados</h2>
        </div>
    </div>
    EO;
}

$contenidoPrincipal.= <<<EO
    <div class="todosMatches">
    <div class="anadirMatches1"> 
        <h3>Matches sin confirmar</h3>
    </div>
    $noConfirmados
    $noConfirmadosEmpty
    <div class="anadirMatches2"> 
    <h3>Todos los Matches</h3>
    </div>
    $confirmados
    $confirmadosEmpty
EO;

require __DIR__.'/includes/vistas/plantillas/plantillaPerfil.php';