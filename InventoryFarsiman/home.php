<?php
  $page_title = 'Home Page';
  require_once('includes/load.php');
  if (!$session->isUserLoggedIn(true)) { redirect('index.php', false);}
?>
<?php include_once('layouts/header.php'); ?>
<div class="row">
  <div class="col-md-12">
    <?php echo display_msg($msg); ?>
  </div>
 <div class="col-md-12">
    <div class="panel">
    <img src="libs/images/logologin.png"  class="img-responsive center-block" alt="">
      <div class="jumbotron text-center">
         <h1>Bienvenido<hr>Manejo de Inventario y Puntos de Distribución</h1>
         <p>Manejo de Sucursales e Inventarios</p>
      </div>
    </div>
 </div>
</div>
<?php include_once('layouts/footer.php'); ?>
